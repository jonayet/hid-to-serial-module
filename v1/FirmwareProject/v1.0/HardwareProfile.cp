#line 1 "E:/Workplace/Projects/Embedded/HidToSerialModule/v1/FirmwareProject/v1.0/HardwareProfile.c"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/v1/firmwareproject/v1.0/hardwareprofile.h"
#line 15 "e:/workplace/projects/embedded/hidtoserialmodule/v1/firmwareproject/v1.0/hardwareprofile.h"
extern unsigned int Timer_1ms;


void ConfigureIO();
void ConfigureModules();
void ConfigureInterrupts();
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/v1/firmwareproject/v1.0/compilerdefinations.h"
#line 5 "E:/Workplace/Projects/Embedded/HidToSerialModule/v1/FirmwareProject/v1.0/HardwareProfile.c"
void ConfigureIO()
{

 PORTA = 0;
 PORtB = 0;
 PORTC = 0;


  LATC2_bit  = 0;
  TRISC2_bit  = 0;
}


void ConfigureModules()
{

 ADCON1 = 0x0F;


 CMCON = 7;


 T08BIT_bit = 1;
 T0CS_bit = 0;
 PSA_bit = 0;
 T0PS2_bit = 1;
 T0PS1_bit = 0;
 T0PS0_bit = 1;
 TMR0H = 0;
 TMR0L = 0;
 TMR0ON_bit = 1;
}


void ConfigureInterrupts()
{

 IPEN_bit = 1;
 PEIE_bit = 1;


 TMR0IP_bit = 0;
 RCIP_bit = 0;


 TMR0IF_bit = 0;
 TMR0IE_bit = 1;


 GIE_bit = 1;
}
