/*******************************************************************************
 * Project name:
        Name_Of_The_Project

 * Author:
        Jonayet Hossain
 
 * Copyright:
        (c) INFRA Technologies, 2008-2013.

 * Revision History:
        20110101:
                - initial release;   
 
 * Description:
        Discription_Of_The_Project
 
 * Test configuration:
        MCU:                        PIC16F877A
        Dev. Board:                _PCB_BOARD_NAME_
        Oscillator:                HS, 8.0000 MHz
        Ext. Modules:        LCD 2x16
        SW:                                mikroC PRO for PIC v4.60
 
 * NOTES:
     - Note 1
     - Note 2
*******************************************************************************/

// include all header files here
#include "built_in.h"
#include "HardwareProfile.h"
#include "CompilerDefinations.h"
#include "PacketStructure.h"
#include "Library/UART-HW.h"
#include "Library/HidToSerial.h"

// Buffers should be in USB RAM, please consult datasheet
HostPacketData hidReadBuff absolute 0x500;
DevicePacketData hidWriteBuff absolute 0x540;

// timer, will increament in interrupt routine
unsigned int Timer_1ms = 0;

/*** Main function of the project ***/
void main()
{
    unsigned char DoBackgroundWork = 0;
    
    // configure start-up settings
    ConfigureIO();
    ConfigureModules();
    ConfigureInterrupts();
    
    // configure RS485 as Transmitter mode
    _OP_RS485_DEnRE = 1;
    
    UART1_Init(9600);
    
    // Enable HID communication
    HID_Enable(&hidReadBuff.Raw.bytes, &hidWriteBuff.Raw.bytes);
    
    while(1)
    {
        _OP_DEBUG_SIG = 1;
        Delay_us(100);
        _OP_DEBUG_SIG = 0;
        Delay_us(100);
    }
    
    // forever loop to continue
    while(1)
    {
        // wait to a hid data packet found
        if(HID_Read())
        {
            if(hidReadBuff.TransmisionType == BAUDRATE_CMD_FROM_HOST)
            {
                SetUartBaudrate(hidReadBuff.BaudRateCommand_FromHost.BaudRateIndex);
                hidReadBuff.TransmisionType = NONE_FROM_HOST;
                DoBackgroundWork = 0;
            }
            else if(hidReadBuff.TransmisionType == SINGLE_QUERY_FROM_HOST)
            {
                WriteQueryAndGetResponseFromUart();
                hidReadBuff.TransmisionType = NONE_FROM_HOST;
                DoBackgroundWork = 0;
            }
            else if(hidReadBuff.TransmisionType == SYNC_OUT_DATA_FROM_HOST)
            {
                WriteSyncOutPacketsToUart();
                hidReadBuff.TransmisionType = NONE_FROM_HOST;
                DoBackgroundWork = 0;
            }
            else if(hidReadBuff.TransmisionType == SYNC_IN_START_FROM_HOST)
            {
                // start reading of uart data asynchronusly
                UART_StartReading();
                Timer_1ms = 0;
                DoBackgroundWork = 1;
                hidReadBuff.TransmisionType = NONE_FROM_HOST;
            }
            else if(hidReadBuff.TransmisionType == SYNC_IN_READ_FROM_HOST)
            {
                // send data packets (if any)
                SendSyncInPacketsFromUart();
                hidReadBuff.TransmisionType = NONE_FROM_HOST;
            }
            else if(hidReadBuff.TransmisionType == ASYNC_OUT_FROM_HOST)
            {
                // send the data packet
                WriteAsyncOutDataToUart();
                hidReadBuff.TransmisionType = NONE_FROM_HOST;
            }
            else if(hidReadBuff.TransmisionType == ASYNC_IN_START_FROM_HOST)
            {
                // start reading of uart data asynchronusly
                UART_StartReading();
                Timer_1ms = 0;
                DoBackgroundWork = 2;
                hidReadBuff.TransmisionType = NONE_FROM_HOST;
            }
            else if(hidReadBuff.TransmisionType == ASYNC_IN_STOP_FROM_HOST)
            {
                // start reading of uart data asynchronusly
                UART_StopReading();
                hidReadBuff.TransmisionType = NONE_FROM_HOST;
                DoBackgroundWork = 0;
            }
            else if(hidReadBuff.TransmisionType == SYNC_IN_ACK_FROM_HOST)
            {
                //do nothing
            }
            else
            {
                if(hidReadBuff.TransmisionType != NONE_FROM_HOST)
                {
                    SendUnknownResponse();
                }
                hidReadBuff.TransmisionType = NONE_FROM_HOST;
                DoBackgroundWork = 0;
            }
        }
        
        // post task for SYNC_IN_START_FROM_HOST
        if(DoBackgroundWork == 1)
        {
            if(hidReadBuff.SyncInStart_FromHost.Timeout > 0)
            {
                if(Timer_1ms >= hidReadBuff.SyncInStart_FromHost.Timeout)
                {
                    // send data packets (if any)
                    SendSyncInPacketsFromUart();
                    DoBackgroundWork = 0;
                }
            }
        }

        // post task for ASYNC_IN_START_FROM_HOST
        if(DoBackgroundWork == 2)
        {
            // check received data length
            if(hidReadBuff.AsyncInStart_FromHost.RequiredDataLength > 0)
            {
                if(UART_Counter >= hidReadBuff.AsyncInStart_FromHost.RequiredDataLength)
                {
                    SendAsyncInSegmentFromUart(1);

                    // re-start reading of uart data stream
                    UART_StartReading();
                    Timer_1ms = 0;
                }
            }

            // check for timeout
            if(hidReadBuff.AsyncInStart_FromHost.Timeout > 0)
            {
                if(Timer_1ms >= hidReadBuff.AsyncInStart_FromHost.Timeout)
                {
                    // send data if any
                    SendAsyncInSegmentFromUart(0);
                    
                    // re-start reading of uart data stream
                    UART_StartReading();
                    Timer_1ms = 0;
                }
            }
       }
    }
}