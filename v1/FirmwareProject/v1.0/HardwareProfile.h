#ifndef _HARDWAREPROFILE_H_
#define _HARDWAREPROFILE_H_

// define System Clock
#define _XTAL_FREQ 24000000UL

//macro for TMR0, TMR1, TMR3 interrupt reload value
#define TIMER_RELOAD_VALUE(TIME_US, PRESCALER, POSTSCALER) (TIME_US / ((PRESCALER * POSTSCALER * 1.0F) / (Clock_MHz() / 4)))


// define IO
#define _OP_RS485_DEnRE LATC2_bit
#define _DR_RS485_DEnRE TRISC2_bit
#define _OP_DEBUG_SIG LATA0_bit
#define _DR_DEBUG_SIG TRISA0_bit

extern unsigned int Timer_1ms;

/*** Function Prototypes ***/
void ConfigureIO();
void ConfigureModules();
void ConfigureInterrupts();

#endif