#include "Lib-String.h"

void GetString(char* Destination, const char* ConstString)
{
    while(1)
    {
        *Destination = *ConstString;
        if(*Destination == 0) { return; }
        Destination++;
        ConstString++;
    }
}


unsigned char StrToByte(char* Source, char Length)
{
    char num = 0, count = 0;
    while(1)
    {
        if(*Source >= '0' && *Source <= '9')
        {
            count++;
            if(count == 1) { num = *Source - '0'; } else { num = (num * 10) + (*Source - '0'); }
            if(count == 3) { return num; }
        }
        Source++;
        length--;
        if(Length == 0) { return num; }
    }
}

uint16 GetStringLength(char* String)
{
    uint16 i = 0;

    while(*String) { i++; String++; }
    return i;
}

uint16 GetConstStringLength(const char* String)
{
    uint16 i = 0;

    while(*String) { i++; String++; }
    return i;
}
