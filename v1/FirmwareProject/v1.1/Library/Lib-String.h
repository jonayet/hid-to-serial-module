#ifndef STRING_H
#define STRING_H
#include "CompilerDefinations.h"

void GetString(char* Destination, const char* ConstString);
uint16 GetStringLength(char* String);
uint16 GetConstStringLength(const char* String);
unsigned char StrToByte(char* Source, char Length);

#endif // STRING_H
