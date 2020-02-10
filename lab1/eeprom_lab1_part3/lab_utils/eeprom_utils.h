#ifndef EEPROM_UTILS_H
#define EEPROM_UTILS_H


#include <EEPROM.h>

#define TERM 0 //byte value used as the null terminator for string

bool isValidChar(byte b);
void disp(void);
void dispString(void);
void clearString(void);
void writeString(String str);
bool hasString(void);

bool isValidChar(byte b)
{
    //  check if character is valid alpha numeric
    return (b >= 32 && b <= 126) ? true : false;
}

void disp(void)
{
    //  display content of eeprom
    byte data;

    for (int adrs = 0; adrs < EEPROM.length(); ++adrs)
    {
        data = EEPROM.read(adrs);
        Serial.print("EEPROM offset: ");
        Serial.print(adrs);
        Serial.print(" | val: ");
        Serial.print(data);
        Serial.print(" | char: ");
        Serial.println((char)data);
        delay(50);
    }
}

void dispString(void)
{
    //  display string in eeprom
    byte data;

    for (int adrs = 0; adrs < EEPROM.length(); ++adrs)
    {
        data = EEPROM.read(adrs);
        Serial.print("EEPROM offset: ");
        Serial.print(adrs);
        Serial.print(" | val: ");
        Serial.print(data);
        Serial.print(" | char: ");
        Serial.println((char)data);
        delay(50);
        if (!isValidChar(data))
        {
            break;
        }
    }
}

void writeString(String str)
{
    //  write string to eeprom
    clearString();
    for (unsigned int c = 0; c < str.length(); ++c)
    {
        EEPROM.write(c, str[c]);
    }
    EEPROM.write(str.length(), TERM);
}

void clearString(void)
{
    //  clear the eeprom by added terminator
    EEPROM.write(0, TERM);
}

bool hasString(void)
{
    //  return true eeprom has string

    byte data;
    for (int adrs = 0; adrs < EEPROM.length(); ++adrs)
    {
        data = EEPROM.read(adrs);
        if (!isValidChar(data) && adrs == 0)
        {
            return false;
        }

        if (!isValidChar(data) && adrs > 0)
        {
            return true;
        }
    }
    return false;
}


#endif
