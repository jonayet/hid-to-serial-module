#line 1 "E:/Workplace/Projects/Embedded/HidToSerialModule/hid-to-serial-module/v1/FirmwareProject/v1.0/Interrupt.c"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/hardwareprofile.h"
#line 17 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/hardwareprofile.h"
extern unsigned int Timer_1ms;


void ConfigureIO();
void ConfigureModules();
void ConfigureInterrupts();
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/compilerdefinations.h"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/library/uart-hw.h"





extern char UART_String[ 900 ];
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
#line 7 "E:/Workplace/Projects/Embedded/HidToSerialModule/hid-to-serial-module/v1/FirmwareProject/v1.0/Interrupt.c"
void interrupt()
{

 USB_Interrupt_Proc();
}

void interrupt_low()
{


 if(TMR0IE_bit == 1 && TMR0IF_bit == 1)
 {

 TMR0L = 256 -  (1000 / ((64 * 1 * 1.0F) / (Clock_MHz() / 4))) ;



 Timer_1ms++;


 TMR0IF_bit = 0;
 }

 if(RCIE_bit == 1 && RCIF_bit == 1)
 {

  { FSR_Backup = FSR0; FSR0 = &UART_String[UART_Counter]; if(OERR_bit) { CREN_bit = 0; CREN_bit = 1; } while(1) { INDF0 = RCREG; PREINC0 = '\0'; UART_Counter++; UART_Timer = 0x20; while(UART_Timer) { if(RCIF_bit == 1) { break; } UART_Timer--; } if(!UART_Timer) { break; } } FSR0 = FSR_Backup; UART_NewReceived = 0xFF; } ;
 }


}
