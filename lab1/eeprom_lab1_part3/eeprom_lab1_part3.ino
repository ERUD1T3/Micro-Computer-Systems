/* lab 1 part 3
 *  read string from serial monitor and
 *  store into EEPROM then display that string
 *  Josias Moukpe
 */


#include <EEPROM.h>
#include "./lab_utils/eeprom_utils.h"

void setup() {
  Serial.begin(115200);
//  dht.begin();
}

void loop() {

  String msg = "";
//  disp();
  clearString();
  dispString();

  
  if(hasString()) {
    Serial.println("EEPROM has message stored");
    dispString();
  }
  else {
    
    Serial.println("No message in EEPROM");
    Serial.println("Write to EEPROM?");
    
    
    while(msg.length() <= 0){
      msg = Serial.readString();;
    }

    Serial.println(msg);
    
    if(msg.equals("yes\n")) {
      Serial.println("Write your message to store");
      msg = "";
      msg = Serial.readString();
      while(msg.length() <= 0){
        msg = Serial.readString();
      }
    
      Serial.println(msg);
  //  disp();
      if(msg.length() > 0){
        writeString(msg);
        dispString();
        disp();
      }    
 
    }
    else {
      Serial.println("No?! Alright boss");
    }
  } // end else
} // end loop
