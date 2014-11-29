// Interrupt service routines
#include "HardwareProfile.h"
#include "CompilerDefinations.h"
#include "Library/UART-HW.h"

// Interrupt service routine
void interrupt()
{
    // Call library interrupt handler routine
    USBDev_IntHandler();
}

void interrupt_low()
{
    if(TMR0IE_bit == 1 && TMR0IF_bit == 1)
    {
        // reset TMR0 for 1 ms
        TMR0L = 256 - TIMER_RELOAD_VALUE(1000, 64, 1);

        // serve os timer
        //OS_Timer();
        Timer_1ms++;

        // clear event flag
        TMR0IF_bit = 0;
    }

    if(RCIE_bit == 1 && RCIF_bit == 1)
    {
        // will clear RCIF_bit flag
        UART_InterruptService();
    }
}