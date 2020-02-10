/* lab 1 part 3
 *  read string from serial monitor and
 *  store into EEPROM then display that string
 *  Josias Moukpe
 */

#include <dht11.h>
#include <EEPROM.h>
#include "./lab_utils/eeprom_utils.h"
#include "./lab_utils/sensor_utils.h"

const dht11 DHT11;

void setup()
{
  Serial.begin(115200);
}

void loop()
{
  String msg = "";

  dispString(); //displays previous values

  // if there is any input from Serial monitor,
  // trigger the data save on eeprom
  if (Serial.readString().length() > 0)
  {
    writeString(dhtSense(DHT11));
  }
  delay(500);
} // end loop
