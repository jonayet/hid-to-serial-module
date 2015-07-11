#include "HidToSerial.h"
#include "PacketStructure.h"
#include "UART-HW.h"
#include "Lib-String.h"
#include "UsbHelper.h"
#include <stdint.h>

void WriteSyncOutSegmentToUart();
unsigned char WaitForUartData(unsigned int Length, unsigned int TimeOut);
unsigned char WaitForHidData();
void SendSyncInFullPacket(unsigned char dataOffset);
void SendSyncInFractionalPacket(unsigned char NofOfFullPacket);
void SendSyncInErrorPacket();
unsigned char CheckSyncInAckFromHost(unsigned char ExpectedAckByte);

// Index=1 > Baudrate : 1200; Index=2 > Baudrate : 2400; index=4 > Baudrate : 4800;
// index=9 > Baudrate : 9600; Index=14 > Baudrate : 14400; index=19 > Baudrate : 19200;
// index=38 > Baudrate : 38400; index=56 > Baudrate : 56000; index=57 > Baudrate : 57600;
// Index=115 > Baudrate : 115200; index=128 > Baudrate : 128000;
void SetUartBaudrate(unsigned char BaudrateIndex)
{
    ClearHidWriteBuffer();
    hidWriteBuff.BaudRateResponse_FromDevice.TransmisionType = BAUDRATE_RESP_FROM_DEVICE;
    switch(BaudrateIndex)
    {
        case 1:
          UART1_Init(1200);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 1200\r\n");
          break;
        case 2:
          UART1_Init(2400);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 2400\r\n");
          break;
        case 4:
          UART1_Init(4800);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 4800\r\n");
          break;
        case 9:
          UART1_Init(9600);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 9600\r\n");
          break;
        case 14:
          UART1_Init(14400);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 14400\r\n");
          break;
        case 19:
          UART1_Init(19200);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 19200\r\n");
          break;
        case 38:
          UART1_Init(38400);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 38400\r\n");
          break;
        case 56:
          UART1_Init(56000);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 56000\r\n");
          break;
        case 57:
          UART1_Init(57600);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 57600\r\n");
          break;
        case 115:
          UART1_Init(115200);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 115200\r\n");
          break;
        case 128:
          UART1_Init(128000);
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 128000\r\n");
          break;
        default:
          GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Error : Unknown BaudRate Index\r\n");
          break;
    }
    // send response to the host
    HID_WriteBuffer();
}

void WriteQueryAndGetResponseFromUart()
{
    unsigned char i;
    unsigned char result;

    // try to read 'BufferBeforeSend' length data from the UART bus within the 'TimeOut' ms time
    if(hidReadBuff.SingleQuery_FromHost.Timeout > 0)
    {
        UART_StartReading();
    }

    // send all bytes through the uart bus
    for(i = 0; i < hidReadBuff.SingleQuery_FromHost.ThisSegmentDataLength; i++)
    {
        UART_WriteByte(hidReadBuff.SingleQuery_FromHost.DataArray[i]);
    }

    // try to read 'BufferBeforeSend' length data from the UART bus within the 'TimeOut' ms time
    result = 0;
    if(hidReadBuff.SingleQuery_FromHost.Timeout > 0)
    {
        result = WaitForUartData(hidReadBuff.SingleQuery_FromHost.ExpectedDataLength, hidReadBuff.SingleQuery_FromHost.Timeout);
        UART_StopReading();
    }

    ClearHidWriteBuffer();
    // build response
    hidWriteBuff.SingleResponse_FromDevice.TransmisionType = SINGLE_RESPONSE_FROM_DEVICE;
    if(result == 0x02)
    {
        hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength = hidReadBuff.SingleQuery_FromHost.ExpectedDataLength;
        memcpy(hidWriteBuff.SingleResponse_FromDevice.DataArray, UART_String, hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength);
    }
    else if(result == 0x01)
    {
        // Timeout but not expected uart data found
        // so, return with SegmentLength = UART_Counter. (SegmentLength = 0 means error flag)
        hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength = UART_Counter;
        memcpy(hidWriteBuff.SingleResponse_FromDevice.DataArray, UART_String, UART_Counter);
    }
    else
    {
        hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength = 0;
    }

    // finally send response to the host
    HID_WriteBuffer();
}

void WriteSyncOutPacketsToUart()
{
    // send 1st segment
    WriteSyncOutSegmentToUart();

    // send rest of the segments
    while(hidReadBuff.SyncOutData_FromHost.NoOfRemainingPackets > 0)
    {
        // wait for next hid data packet, timeout SYNC_OUT_TIMEOUT
        if(WaitForHidData() != 0)
        {
            ClearHidWriteBuffer();
            hidWriteBuff.SyncOutAck_FromDevice.TransmisionType = SYNC_OUT_ACK_FROM_DEVICE;
            hidWriteBuff.SyncOutAck_FromDevice.DeviceAckByte = 0;
            HID_WriteBuffer();
            return;
        }

        if(hidReadBuff.TransmisionType != SYNC_OUT_DATA_FROM_HOST) { return; }
        WriteSyncOutSegmentToUart();
    }
}

void SendSyncInPacketsFromUart()
{
    unsigned char i = 0;
    unsigned char NoOfPacket = 0;
    unsigned char response = 0;

_StartAgain:
    // uart data was stared reading in last command
    // so, stop reading and send read data
    UART_StopReading();

    // check if any data was read successfully
    if(UART_Counter == 0)
    {
        SendSyncInErrorPacket();
        return;
    }

    // valid data are was read
    NoOfPacket = UART_Counter / sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);;

    // send full length data segments (if any)
    for(i = 0; i < NoOfPacket; i++)
    {
        SendSyncInFullPacket(i);
        response = CheckSyncInAckFromHost(hidWriteBuff.SyncInData_FromDevice.HostAckByte);

        // if other transmission command sent, abrot this operation
        if(response == 0x03) { goto _StartAgain; }

        // incorrect response was found, send error flag(HostAckByte = 0) and abroat operation
        if(response != 0)
        {
            hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
            hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0;
            HID_WriteBuffer();
            return;
        }
    }

    // send the fractional data segment
    SendSyncInFractionalPacket(NoOfPacket);
}

void WriteAsyncOutDataToUart()
{
    unsigned char i;

    // send all bytes through the uart bus
    for(i = 0; i < hidReadBuff.AsyncOut_FromHost.ThisSegmentDataLength; i++)
    {
        UART_WriteByte(hidReadBuff.AsyncOut_FromHost.DataArray[i]);
    }
}

void SendAsyncInSegmentFromUart(unsigned char FullLength)
{
    ClearHidWriteBuffer();

    // set header
    hidWriteBuff.AsyncInData_FromDevice.TransmisionType = ASYNC_IN_DATA_FROM_DEVICE;
    if(FullLength)
    {
        hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength = hidReadBuff.AsyncInStart_FromHost.RequiredDataLength;
    }
    else
    {
        hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength = UART_Counter;
    }

    // set data
    memcpy(hidWriteBuff.AsyncInData_FromDevice.DataArray, UART_String, hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength);

    // send response to the host
    HID_WriteBuffer();
}

void SendUnknownResponse()
{
    ClearHidWriteBuffer();

    // set header
    hidWriteBuff.UnknownResponse_FromDevice.TransmisionType = UNKNOWN_FROM_DEVICE;

    // set data
    GetString(hidWriteBuff.UnknownResponse_FromDevice.DataArray, "Unknown!\r\n");

    // send response to the host
    HID_WriteBuffer();
}

void SendSyncInFullPacket(unsigned char PacketIndex)
{
    unsigned char dataArrayLength;
    unsigned char NoOfPacket;
    unsigned char LengthOfLastSegment;
    unsigned int dataOffset;

    // calculate number of full packet and length of last segment
    dataArrayLength = sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);
    NoOfPacket = UART_Counter / dataArrayLength;
    LengthOfLastSegment = UART_Counter % dataArrayLength;

    // send nothing if no full length data packet
    if(NoOfPacket == 0) { return; }

    ClearHidWriteBuffer();

    // set header
    hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
    hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = dataArrayLength;
    hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = NoOfPacket - PacketIndex - 1;
    hidWriteBuff.SyncInData_FromDevice.LastPacketLength = LengthOfLastSegment;
    hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0x1A;

    // calculate dataOffset
    dataOffset = dataArrayLength * PacketIndex;

    // set data
    memcpy(hidWriteBuff.SyncInData_FromDevice.DataArray, (UART_String + dataOffset), hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength);

    // send response to the host
    HID_WriteBuffer();
}

void SendSyncInFractionalPacket(unsigned char NofOfFullPacket)
{
    unsigned char dataArrayLength;
    unsigned int dataOffset;
    unsigned char LengthOfLastSegment;

    if(LengthOfLastSegment == 0) {  return; }

    // calculate length of last segment
    dataArrayLength = sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);
    LengthOfLastSegment = UART_Counter % dataArrayLength;

    ClearHidWriteBuffer();
    // set header
    hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
    hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = LengthOfLastSegment;
    hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = 0;
    hidWriteBuff.SyncInData_FromDevice.LastPacketLength = LengthOfLastSegment;
    hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0x1A;

    // calculate dataOffset
    dataOffset = dataArrayLength * NofOfFullPacket;

    // set data
    memcpy(hidWriteBuff.SyncInData_FromDevice.DataArray, (UART_String + dataOffset), hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength);

    // send response to the host
    HID_WriteBuffer();
}

void SendSyncInErrorPacket()
{
    ClearHidWriteBuffer();
    hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;

    // no uart data read
    // so, return with SegmentLength = 0 (error flag)
    hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = 0;
    hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = 0;
    hidWriteBuff.SyncInData_FromDevice.LastPacketLength = 0;
    hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0;

    // send response to the host
    HID_WriteBuffer();
}

void WriteSyncOutSegmentToUart()
{
    unsigned char i;
    unsigned char devAck = 0;

    // send all bytes through the uart bus
    for(i = 0; i < hidReadBuff.SyncOutData_FromHost.ThisSegmentDataLength; i++)
    {
        UART_WriteByte(hidReadBuff.SyncOutData_FromHost.DataArray[i]);
    }

    ClearHidWriteBuffer();
    // give ack to host
    hidWriteBuff.SyncOutAck_FromDevice.TransmisionType = SYNC_OUT_ACK_FROM_DEVICE;
    devAck = hidReadBuff.SyncOutData_FromHost.DeviceAckByte;
    hidWriteBuff.SyncOutAck_FromDevice.DeviceAckByte = devAck;
    HID_WriteBuffer();
}

// Timeout: 0x01
// Data Found: 0x00
unsigned char WaitForHidData()
{
    unsigned int TimeOut;

    TimeOut = SYNC_OUT_TIMEOUT;
    while(!UsbNewPacketReceived)
    {
        TimeOut--;
        if(TimeOut == 0)
        {
            return 0x01;
        }
        Delay_1ms();
    }

    return 0;
}

// Timeout without any data: 0
// Timeout with data received: 0x01
// Data of Expected Length found: 0x02
unsigned char WaitForUartData(unsigned int ExpectedLength, unsigned int TimeOut)
{
    unsigned int i;
    if(TimeOut == 0) { return 0; }
    if(ExpectedLength != 0)
    {
        for(i = 0; i < TimeOut; i++)
        {
            if(UART_Counter >= ExpectedLength)
            {
                return 2;
            }
            Delay_1ms();
        }
    }
    else
    {
        for(i = 0; i < TimeOut; i++)
        {
            Delay_1ms();
        }
    }

    // incorrect length
    if(UART_Counter > 0)
    {
        return 1;
    }

    // timeout
    return 0;
}

// Timeout: 0x01
// Incorrect Response: 0x02
// Other TransmisionType: 0x03
// Correct Response: 0x00
unsigned char CheckSyncInAckFromHost(unsigned char ExpectedAckByte)
{
    unsigned int TimeOut;

    // wait host response, timeout SYNC_OUT_TIMEOUT
    TimeOut = SYNC_IN_TIMEOUT;
    while(!UsbNewPacketReceived)
    {
        TimeOut--;
        if(TimeOut == 0)
        {
            return 0x01;
        }
        Delay_1ms();
    }

    if(hidReadBuff.TransmisionType == SYNC_IN_ACK_FROM_HOST)
    {
        if(hidReadBuff.SyncInAck_FromHost.HostAckByte == ExpectedAckByte)
        {
            return 0;
        }
        return 0x02;
    }

    return 0x03;
}

void ClearHidWriteBuffer()
{
    unsigned char i;
    for(i = 0; i < sizeof(hidWriteBuff.Raw.bytes); i++)
    {
        hidWriteBuff.Raw.bytes[i] = 0;
    }
}