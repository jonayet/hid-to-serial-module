#line 1 "E:/Workplace/Projects/Embedded/HidToSerialModule/v1/FirmwareProject/v1.0/Library/Lib-String.c"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/v1/firmwareproject/v1.0/library/lib-string.h"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/v1/firmwareproject/v1.0/compilerdefinations.h"
#line 5 "e:/workplace/projects/embedded/hidtoserialmodule/v1/firmwareproject/v1.0/library/lib-string.h"
void GetString(char* Destination, const char* ConstString);
 unsigned int  GetStringLength(char* String);
 unsigned int  GetConstStringLength(const char* String);
unsigned char StrToByte(char* Source, char Length);
#line 3 "E:/Workplace/Projects/Embedded/HidToSerialModule/v1/FirmwareProject/v1.0/Library/Lib-String.c"
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

 unsigned int  GetStringLength(char* String)
{
  unsigned int  i = 0;

 while(*String) { i++; String++; }
 return i;
}

 unsigned int  GetConstStringLength(const char* String)
{
  unsigned int  i = 0;

 while(*String) { i++; String++; }
 return i;
}
