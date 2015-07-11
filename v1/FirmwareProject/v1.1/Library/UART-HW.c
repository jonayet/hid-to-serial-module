
// header files
#include "UART-HW.h"



//--- Global Variables ---
char UART_String[UART_BUFFER_SIZE];
unsigned char UART_NewReceived;
unsigned char UART_Tmp;
unsigned char UART_Timer;
unsigned int UART_Counter;
unsigned int FSR_Backup;


// write some text on UART
void UART_WriteByte(unsigned char DataByte)
{
    // wait until last data send, then load with new data
    while(TRMT_bit == 0) { }
    TXREG = DataByte;
}


// write some text on UART
void UART_WriteConstString(const char* ConstString)
{
    while(*ConstString)
        {
                // write each and every charecter of the text
        while(TRMT_bit == 0) { }
        TXREG = *ConstString;
                
                // increament ConstString
                ConstString++;
        }
}

// write some text on UART
void UART_WriteString(char* String)
{
    while(*String)
    {
        // write each and every charecter of the text
        while(TRMT_bit == 0) { }
        TXREG = *String;

        // increament ConstString
        String++;
    }
}

// read UART data untile TimeOut occured
void UART_ReadWait(unsigned int TimeOut)
{
    // set empty string to UartString
    UART_String[0] = '\0';
    UART_Counter = 0;

    // clear previous flag(gerbage read) and re-enable UART receive interrupt
    UART_NewReceived = RCREG;
    UART_NewReceived = 0;
    RCIE_bit = 1;
        
        // wait for TimeOut occured
    while(TimeOut) { Delay_ms(1); TimeOut--; }
        
    // disable UART receive
    RCIE_bit = 0;
}

/*
 *        Start new Reading Asynchronusly
 */
void UART_StartReading()
{
    // clear previous flag(gerbage read) and re-enable UART receive interrupt
    UART_NewReceived = RCREG;
    UART_NewReceived = 0;
    RCIE_bit = 1;
    
    // set empty string to UartString
    UART_String[0] = '\0';
    UART_Counter = 0;
}

/*
 *        Stop Asynchronusly Reading
 */
void UART_StopReading()
{
    // disable UART receive
    RCIE_bit = 0;
}