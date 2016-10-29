#include <NewPing.h>
#include <SoftwareSerial.h>

SoftwareSerial mySerial(10, 11); // RX, TX

#define TRIGGER_PIN  12
#define ECHO_PIN      9
#define MAX_DISTANCE 100
#define LED_PIN  13
#define BUSY_PIN 5

NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE);

class DFPlayer
{
public:
   DFPlayer(HardwareSerial& _s)
      : m_hardware_serial(&_s),
        m_software_serial(nullptr)
   {
      init_buf();
   }
   
   DFPlayer(SoftwareSerial& _s)
      : m_hardware_serial(nullptr),
        m_software_serial(&_s)
   {
      init_buf();
   }
   
   void play_physical(uint16_t num)
   {
      send_cmd(0x03, num);
      while (1)
      {
         delay(50);
         if (digitalRead(BUSY_PIN))
            break;
      }
   }

   void set_volume(uint16_t volume)
   {
      send_cmd(0x06, volume);
   }

   uint16_t get_num_flash_files()
   {
      flush();
      send_cmd_feedback(0x48);
      return get_reply();
   }

   void flush()
   {
      if (m_hardware_serial)
         while (m_hardware_serial->available())
            ;
      else
         while (m_software_serial->available())
            ;
   }
   
   uint16_t get_reply()
   {
      delay(50);
      
      uint8_t buf[10];
      int n = 0;
      while (n < 10)
      {
         uint8_t c;
         if (!get_char(c))
         {
            Serial.println("exhausted");
            return 0;
         }
         if ((n == 0) && (c != 0x7E))
         {
            Serial.println("wrong");
            continue;
         }
         buf[n++] = c;
      }
#if 0
      char s[40];
      sprintf(s, "Reply: ");
      for (int i = 0; i < 10; i++)
         sprintf(s+strlen(s)-1, "%02X ", buf[i]);
      Serial.println(s);
#endif
      if ((n == 10) && (buf[9] == 0xEF))
         return buf[5]*256+buf[6];
      return 0;
   }
   
private:
   bool get_char(uint8_t& c)
   {
      if (m_hardware_serial && m_hardware_serial->available())
      {
         c = m_hardware_serial->read();
         return true;
      }
      if (m_software_serial && m_software_serial->available())
      {
         c = m_software_serial->read();
         return true;
      }
      return false;
   }
   
   void init_buf()
   {
      send_buf[0] = 0x7E;
      send_buf[1] = 0xFF;
      send_buf[2] = 0x06;
      send_buf[9] = 0xEF;
   }
   
   void send_cmd(uint8_t cmd, uint16_t arg = 0)
   {
      send_buf[3] = cmd;
      send_buf[4] = 0;
      fill_uint16_bigend((send_buf+5), arg);
      fill_checksum();
      send();
   }

   void send_cmd_feedback(uint8_t cmd, uint16_t arg = 0)
   {
      send_buf[3] = cmd;
      send_buf[4] = 1;
      fill_uint16_bigend((send_buf+5), arg);
      fill_checksum();
      send();
   }

   static void fill_uint16_bigend(uint8_t *thebuf, uint16_t data)
   {
      *thebuf =	(uint8_t)(data>>8);
      *(thebuf+1) =	(uint8_t)data;
   }

   uint16_t get_checksum(uint8_t *thebuf)
   {
      uint16_t sum = 0;
      for(int i = 1; i < 7; i++)
      {
         sum += thebuf[i];
      }
      return -sum;
   }


   void fill_checksum()
   {
      uint16_t checksum = get_checksum(send_buf);
      fill_uint16_bigend(send_buf+7, checksum);
   }

   void send()
   {
      if (m_hardware_serial)
         for (int i = 0; i < 10; i++)
            m_hardware_serial->write(send_buf[i]);
      else
         for (int i = 0; i < 10; i++)
            m_software_serial->write(send_buf[i]);
	}

   uint8_t send_buf[10];
   HardwareSerial* m_hardware_serial;
   SoftwareSerial* m_software_serial;
};

DFPlayer player(mySerial);

int num_flash_files = 0;

void setup()
{
   Serial.begin(57600);

   mySerial.begin(9600);
	delay(10);
   player.set_volume(10);
	delay(10);
   while (num_flash_files == 0)
   {
      num_flash_files = player.get_num_flash_files();
      digitalWrite(LED_PIN, 1);
      delay(100);
      digitalWrite(LED_PIN, 0);
      delay(100);
   }
   Serial.print("Files on flash: ");
   Serial.println(num_flash_files);
}

int on = 0;

void loop()
{
   int cm = sonar.ping_cm();
   if (cm)
   {
      if (cm < 30)
      {
         Serial.print("Ping: ");
         Serial.print(cm);
         Serial.println(" cm");
         int num = 1+random(num_flash_files);
         Serial.print("Play ");
         Serial.println(num);
         player.play_physical(num);
      }
   }
   digitalWrite(LED_PIN, on);
   on = !on;
}
