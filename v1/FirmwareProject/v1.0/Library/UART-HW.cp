#line 1 "E:/Workplace/Projects/Embedded/HidToSerialModule/v1/FirmwareProject/v1.0/Library/UART-HW.c"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/v1/firmwareproject/v1.0/library/uart-hw.h"





extern char UART_String[ 945 ];
extern unsigned char UART_NewReceived;
extern unsigned char UART_Timer;
extern unsigned int UART_Counter;
extern unsigned int FSR_Backup;



void UART_WriteByte(unsigned char DataByte);
void UART_WriteConstString(const char *ConstString);
void UART_WriteString(char *String);
void UART_ReadWait(unsigned int TimeOut);
void UART_StartReading();
void UART_StopReading();
void UART_InterruptService();
#line 8 "E:/Workplace/Projects/Embedded/HidToSerialModule/v1/FirmwareProject/v1.0/Library/UART-HW.c"
char UART_String[ 945 ];
unsigned char UART_NewReceived;
unsigned char UART_Tmp;
unsigned char UART_Timer;
unsigned int UART_Counter;
unsigned int FSR_Backup;



void UART_WriteByte(unsigned char DataByte)
{

 while(TRMT_bit == 0) { }
 TXREG = DataByte;
}



void UART_WriteConstString(const char* ConstString)
{
 while(*ConstString)
 {

 while(TRMT_bit == 0) { }
 TXREG = *ConstString;


 ConstString++;
 }
}


void UART_WriteString(char* String)
{
 while(*String)
 {

 while(TRMT_bit == 0) { }
 TXREG = *String;


 String++;
 }
}


void UART_ReadWait(unsigned int TimeOut)
{

 UART_String[0] = '\0';
 UART_Counter = 0;


 UART_NewReceived = RCREG;
 UART_NewReceived = 0;
 RCIE_bit = 1;


 while(TimeOut) { Delay_ms(1); TimeOut--; }


 RCIE_bit = 0;
}
#line 75 "E:/Workplace/Projects/Embedded/HidToSerialModule/v1/FirmwareProject/v1.0/Library/UART-HW.c"
void UART_StartReading()
{

 UART_NewReceived = RCREG;
 UART_NewReceived = 0;
 RCIE_bit = 1;


 UART_String[0] = '\0';
 UART_Counter = 0;
}
#line 90 "E:/Workplace/Projects/Embedded/HidToSerialModule/v1/FirmwareProject/v1.0/Library/UART-HW.c"
void UART_StopReading()
{

 RCIE_bit = 0;
}
