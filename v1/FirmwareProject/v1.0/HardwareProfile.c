#include "HardwareProfile.h"
#include "CompilerDefinations.h"

/*** I/O pin Configuration ***/
void ConfigureIO()
{
    // clear all port data
    PORTA = 0;
    PORtB = 0;
    PORTC = 0;
    
    // configure RS485 as Receiver mode
    _OP_RS485_DEnRE = 0;
    _DR_RS485_DEnRE = 0;
}

/*** Built-in Hardware Module Configuration ***/
void ConfigureModules()
{
    // use all AN input as Digital Input
    ADCON1 = 0x0F;
    
    // disable internal comparator
    CMCON = 7;
    
    /** Configure TMR0 module **/
    T08BIT_bit = 1;         // use as 8 bit mode
    T0CS_bit = 0;           // clock source: instruction cycle
    PSA_bit = 0;            // assign pre-scaler
    T0PS2_bit = 1;          // presacler value 1:64
    T0PS1_bit = 0;          // 000 - 1:2,  001 - 1:4,  010 - 1:8,   011 - 1:16
    T0PS0_bit = 1;          // 100 - 1:32, 101 - 1:64, 110 - 1:128, 111 - 1:256
    TMR0H = 0;              // clear register value
    TMR0L = 0;
    TMR0ON_bit = 1;           // start the TMR0 module
}

/*** Interrupt Configuration ***/
void ConfigureInterrupts()
{
    // enable Interrupt prioraty and Low priority interrupt
    IPEN_bit = 1;
    PEIE_bit = 1;

    // set TMR0 and UART RX interrupt as low priority
    TMR0IP_bit = 0;
    RCIP_bit = 0;

    // enable TMR0 interrupt
    TMR0IF_bit = 0;
    TMR0IE_bit = 1;

    // enable Global interrupt
    GIE_bit = 1;
}