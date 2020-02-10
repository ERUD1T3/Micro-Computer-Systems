/* lab 1 part 1
 *  only read from EEPROM
 *  Josias Moukpe
 */

#include <EEPROM.h>
#include "./lab_utils/eeprom_utils.h"



void setup() {
  Serial.begin(115200);
}

void loop() {
  Serial.println("EEPROM contains");
  disp();
} // end loop
