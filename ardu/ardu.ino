#include <SoftwareSerial.h>
#include <dfplayer.h>

void setup()
{
	Serial.begin(9600);
	mp3_set_serial(Serial);
	delay(1);                     // delay 1ms to set volume
   mp3_set_volume(30);          // value 0~30
}

void loop()
{
#if 1
   mp3_play (1);
	delay (6000);
	mp3_next ();
	delay (6000);
	mp3_prev ();
	delay (6000);
	mp3_play (4);
	delay (6000);
#else
   for (int i = 1; i <= 50; ++i)
   {
      mp3_play(i);
      delay(2000);
   }
#endif
}
