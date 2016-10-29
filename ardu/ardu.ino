#include <SoftwareSerial.h>

SoftwareSerial mySerial(10, 11); // RX, TX

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
   }

   void get_u_sum()
   {
      send_cmd(0x47);
   }

   //
   void get_tf_sum()
   {
      send_cmd(0x48);
   }

   //
   void get_flash_sum()
   {
      send_cmd(0x49);
   }

   void set_volume(uint16_t volume)
   {
      send_cmd(0x06, volume);
   }

private:
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

void setup()
{
   Serial.begin(9600);

   mySerial.begin(9600);
	delay(1);                     // delay 1ms to set volume
   player.set_volume(30);          // value 0~30
}

void loop()
{
   for (int i = 1; i <= 50; ++i)
   {
      Serial.print("Play ");
      Serial.println(i);
      player.play_physical(i);
      delay(2000);
   }
}
