#ifndef SENSOR_UTILS_H
#define SENSOR_UTILS_H

#include <dht11.h>

#define DHT11PIN 7 // pin for sensor output signal

String dhtSense(dht11 DHT11);


String dhtSense(dht11 DHT11)
{
    //  return the reading from the sensor as string
    String res = "";

    int chk = DHT11.read(DHT11PIN);
    float h = (float)DHT11.humidity;
    float t = (float)DHT11.temperature;

    // contructing the result
    res = "temp: " + String(t) + " *C " + "Hum: " + String(h) + " % ";

    Serial.println(res);
    return res;
}


#endif
