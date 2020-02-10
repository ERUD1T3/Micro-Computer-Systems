/* lab 1 part 2
 *  read string from serial monitor and
 *  store into EEPROM then display that string
 *  Josias Moukpe
 */


#include <EEPROM.h>
#include "./lab_utils/eeprom_utils.h"


void setup() {
  Serial.begin(115200);
}

void loop() {
String msg = "";

//    if(Serial.available() > 0) {
      
//      d/isp(); // display content of EEPROM before

      
      Serial.println("Enter value to write to EEPROM");
      
      while(msg.length() <= 0){
        msg = Serial.readString();
      }

      Serial.println(msg);

       if(msg.length() > 0) {
          writeString(msg);
          dispString();
          disp();
          
       }
//    }/
} // end loop
