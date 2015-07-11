#line 1 "E:/Workplace/Projects/Embedded/HidToSerialModule/hid-to-serial-module/v1/FirmwareProject/v1.0/Library/HidToSerial.c"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/library/hidtoserial.h"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/packetstructure.h"



typedef union
{
 unsigned char TransmisionType;

 struct
 {
 unsigned char bytes[64];
 } Raw;

 struct
 {
 unsigned char TransmisionType;
 unsigned char BaudRateIndex;
 } BaudRateCommand_FromHost;

 struct
 {
 unsigned char TransmisionType;
 unsigned char ThisSegmentDataLength;
 unsigned char ExpectedDataLength;
 unsigned int Timeout;
 unsigned char DataArray[59];
 } SingleQuery_FromHost;

 struct
 {
 unsigned char TransmisionType;
 unsigned char ThisSegmentDataLength;
 unsigned int NoOfRemainingPackets;
 unsigned char LastPacketLength;
 unsigned char DeviceAckByte;
 unsigned char DataArray[58];
 } SyncOutData_FromHost;

 struct
 {
 unsigned char TransmisionType;
 unsigned int Timeout;
 } SyncInStart_FromHost;

 struct
 {
 unsigned char TransmisionType;
 } SyncInRead_FromHost;

 struct
 {
 unsigned char TransmisionType;
 unsigned char HostAckByte;
 } SyncInAck_FromHost;

 struct
 {
 unsigned char TransmisionType;
 unsigned char ThisSegmentDataLength;
 unsigned char DataArray[62];
 } AsyncOut_FromHost;

 struct
 {
 unsigned char TransmisionType;
 unsigned char RequiredDataLength;
 unsigned int Timeout;
 } AsyncInStart_FromHost;

 struct
 {
 unsigned char TransmisionType;
 } AsyncInStop_FromHost;
} HostPacketData;

typedef union
{
 struct
 {
 unsigned char bytes[64];
 } Raw;

 struct
 {
 unsigned char TransmisionType;
 unsigned char DataArray[40];
 } BaudRateResponse_FromDevice;

 struct
 {
 unsigned char TransmisionType;
 unsigned char ThisSegmentDataLength;
 unsigned char DataArray[62];
 } SingleResponse_FromDevice;

 struct
 {
 unsigned char TransmisionType;
 unsigned char DeviceAckByte;
 } SyncOutAck_FromDevice;

 struct
 {
 unsigned char TransmisionType;
 unsigned char ThisSegmentDataLength;
 unsigned char NoOfRemainingPackets;
 unsigned char LastPacketLength;
 unsigned char HostAckByte;
 unsigned char DataArray[59];
 } SyncInData_FromDevice;

 struct
 {
 unsigned char TransmisionType;
 unsigned char ThisSegmentDataLength;
 unsigned char DataArray[62];
 } AsyncInData_FromDevice;

 struct
 {
 unsigned char TransmisionType;
 unsigned char DataArray[10];
 } UnknownResponse_FromDevice;
} DevicePacketData;

typedef enum
{
 NONE_FROM_HOST = 0,
 BAUDRATE_CMD_FROM_HOST,
 SINGLE_QUERY_FROM_HOST,
 SYNC_OUT_DATA_FROM_HOST,
 SYNC_IN_START_FROM_HOST,
 SYNC_IN_READ_FROM_HOST,
 SYNC_IN_ACK_FROM_HOST,
 ASYNC_OUT_FROM_HOST,
 ASYNC_IN_START_FROM_HOST,
 ASYNC_IN_STOP_FROM_HOST,
 UNKNOWN_FROM_HOST
} HostTransmisionType;

typedef enum
{
 NONE_FROM_DEVICE = 0,
 BAUDRATE_RESP_FROM_DEVICE,
 SINGLE_RESPONSE_FROM_DEVICE,
 SYNC_OUT_ACK_FROM_DEVICE,
 SYNC_IN_DATA_FROM_DEVICE,
 ASYNC_IN_DATA_FROM_DEVICE,
 UNKNOWN_FROM_DEVICE
} DeviceTransmisionType;
#line 8 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/library/hidtoserial.h"
extern HostPacketData hidReadBuff;
extern DevicePacketData hidWriteBuff;

void ClearHidWriteBuffer();





void SetUartBaudrate(unsigned char BaudrateIndex);
void WriteQueryAndGetResponseFromUart();
void WriteSyncOutPacketsToUart();
void SendSyncInPacketsFromUart();
void WriteAsyncOutDataToUart();
void SendAsyncInSegmentFromUart(unsigned char FullLength);
void SendUnknownResponse();
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/packetstructure.h"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/library/uart-hw.h"





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
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/library/lib-string.h"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/compilerdefinations.h"
#line 5 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/library/lib-string.h"
void GetString(char* Destination, const char* ConstString);
 unsigned int  GetStringLength(char* String);
 unsigned int  GetConstStringLength(const char* String);
unsigned char StrToByte(char* Source, char Length);
#line 6 "E:/Workplace/Projects/Embedded/HidToSerialModule/hid-to-serial-module/v1/FirmwareProject/v1.0/Library/HidToSerial.c"
void WriteSyncOutSegmentToUart();
unsigned char WaitForUartData(unsigned int Length, unsigned int TimeOut);
unsigned char WaitForHidData();
void SendSyncInFullPacket(unsigned char dataOffset);
void SendSyncInFractionalPacket(unsigned char NofOfFullPacket);
void SendSyncInErrorPacket();
unsigned char CheckSyncInAckFromHost(unsigned char ExpectedAckByte);





void SetUartBaudrate(unsigned char BaudrateIndex)
{
 ClearHidWriteBuffer();
 hidWriteBuff.BaudRateResponse_FromDevice.TransmisionType = BAUDRATE_RESP_FROM_DEVICE;
 switch(BaudrateIndex)
 {
 case 1:
 UART1_Init(1200);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 1200");
 break;
 case 2:
 UART1_Init(2400);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 2400");
 break;
 case 4:
 UART1_Init(4800);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 4800");
 break;
 case 9:
 UART1_Init(9600);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 9600");
 break;
 case 14:
 UART1_Init(14400);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 14400");
 break;
 case 19:
 UART1_Init(19200);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 19200");
 break;
 case 38:
 UART1_Init(38400);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 38400");
 break;
 case 56:
 UART1_Init(56000);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 56000");
 break;
 case 57:
 UART1_Init(57600);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 57600");
 break;
 case 115:
 UART1_Init(115200);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 115200");
 break;
 case 128:
 UART1_Init(128000);
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 128000");
 break;
 default:
 GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Error : Unknown BaudRate Index");
 break;
 }

 while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
}

void WriteQueryAndGetResponseFromUart()
{
 unsigned char i;
 unsigned char result;


 if(hidReadBuff.SingleQuery_FromHost.Timeout > 0)
 {
 UART_StartReading();
 }


 for(i = 0; i < hidReadBuff.SingleQuery_FromHost.ThisSegmentDataLength; i++)
 {
 UART_WriteByte(hidReadBuff.SingleQuery_FromHost.DataArray[i]);
 }



 if(hidReadBuff.SingleQuery_FromHost.Timeout == 0) { return; }


 result = WaitForUartData(hidReadBuff.SingleQuery_FromHost.ExpectedDataLength, hidReadBuff.SingleQuery_FromHost.Timeout);
 UART_StopReading();

 ClearHidWriteBuffer();

 hidWriteBuff.SingleResponse_FromDevice.TransmisionType = SINGLE_RESPONSE_FROM_DEVICE;
 if(result == 0)
 {
 hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength = hidReadBuff.SingleQuery_FromHost.ExpectedDataLength;
 memcpy(hidWriteBuff.SingleResponse_FromDevice.DataArray, UART_String, hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength);
 }
 else
 {


 hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength = UART_Counter;
 memcpy(hidWriteBuff.SingleResponse_FromDevice.DataArray, UART_String, UART_Counter);
 }


 while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
}

void WriteSyncOutPacketsToUart()
{

 WriteSyncOutSegmentToUart();


 while(hidReadBuff.SyncOutData_FromHost.NoOfRemainingPackets > 0)
 {

 if(WaitForHidData() != 0)
 {
 ClearHidWriteBuffer();
 hidWriteBuff.SyncOutAck_FromDevice.TransmisionType = SYNC_OUT_ACK_FROM_DEVICE;
 hidWriteBuff.SyncOutAck_FromDevice.DeviceAckByte = 0;
 while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
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


 UART_StopReading();


 if(UART_Counter == 0)
 {
 SendSyncInErrorPacket();
 return;
 }


 NoOfPacket = UART_Counter / sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);;


 for(i = 0; i < NoOfPacket; i++)
 {
 SendSyncInFullPacket(i);
 response = CheckSyncInAckFromHost(hidWriteBuff.SyncInData_FromDevice.HostAckByte);


 if(response == 0x03) { goto _StartAgain; }


 if(response != 0)
 {
 hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
 hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0;
 while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
 return;
 }
 }


 SendSyncInFractionalPacket(NoOfPacket);
}

void WriteAsyncOutDataToUart()
{
 unsigned char i;


 for(i = 0; i < hidReadBuff.AsyncOut_FromHost.ThisSegmentDataLength; i++)
 {
 UART_WriteByte(hidReadBuff.AsyncOut_FromHost.DataArray[i]);
 }
}

void SendAsyncInSegmentFromUart(unsigned char FullLength)
{
 ClearHidWriteBuffer();


 hidWriteBuff.AsyncInData_FromDevice.TransmisionType = ASYNC_IN_DATA_FROM_DEVICE;
 if(FullLength)
 {
 hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength = hidReadBuff.AsyncInStart_FromHost.RequiredDataLength;
 }
 else
 {
 hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength = UART_Counter;
 }


 memcpy(hidWriteBuff.AsyncInData_FromDevice.DataArray, UART_String, hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength);


 while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
}

void SendUnknownResponse()
{
 ClearHidWriteBuffer();


 hidWriteBuff.UnknownResponse_FromDevice.TransmisionType = UNKNOWN_FROM_DEVICE;


 GetString(hidWriteBuff.UnknownResponse_FromDevice.DataArray, "Unknown!");


 while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
}

void SendSyncInFullPacket(unsigned char PacketIndex)
{
 unsigned char dataArrayLength;
 unsigned char NoOfPacket;
 unsigned char LengthOfLastSegment;
 unsigned int dataOffset;


 dataArrayLength = sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);
 NoOfPacket = UART_Counter / dataArrayLength;
 LengthOfLastSegment = UART_Counter % dataArrayLength;


 if(NoOfPacket == 0) { return; }

 ClearHidWriteBuffer();


 hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
 hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = dataArrayLength;
 hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = NoOfPacket - PacketIndex - 1;
 hidWriteBuff.SyncInData_FromDevice.LastPacketLength = LengthOfLastSegment;
 hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0x1A;


 dataOffset = dataArrayLength * PacketIndex;


 memcpy(hidWriteBuff.SyncInData_FromDevice.DataArray, (UART_String + dataOffset), hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength);


 while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
}

void SendSyncInFractionalPacket(unsigned char NofOfFullPacket)
{
 unsigned char dataArrayLength;
 unsigned int dataOffset;
 unsigned char LengthOfLastSegment;

 if(LengthOfLastSegment == 0) { return; }


 dataArrayLength = sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);
 LengthOfLastSegment = UART_Counter % dataArrayLength;

 ClearHidWriteBuffer();

 hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
 hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = LengthOfLastSegment;
 hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = 0;
 hidWriteBuff.SyncInData_FromDevice.LastPacketLength = LengthOfLastSegment;
 hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0x1A;


 dataOffset = dataArrayLength * NofOfFullPacket;


 memcpy(hidWriteBuff.SyncInData_FromDevice.DataArray, (UART_String + dataOffset), hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength);


 while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
}

void SendSyncInErrorPacket()
{
 ClearHidWriteBuffer();
 hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;



 hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = 0;
 hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = 0;
 hidWriteBuff.SyncInData_FromDevice.LastPacketLength = 0;
 hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0;


 while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
}

void WriteSyncOutSegmentToUart()
{
 unsigned char i;
 unsigned char devAck = 0;


 for(i = 0; i < hidReadBuff.SyncOutData_FromHost.ThisSegmentDataLength; i++)
 {
 UART_WriteByte(hidReadBuff.SyncOutData_FromHost.DataArray[i]);
 }

 ClearHidWriteBuffer();

 hidWriteBuff.SyncOutAck_FromDevice.TransmisionType = SYNC_OUT_ACK_FROM_DEVICE;
 devAck = hidReadBuff.SyncOutData_FromHost.DeviceAckByte;
 hidWriteBuff.SyncOutAck_FromDevice.DeviceAckByte = devAck;
 while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
}



unsigned char WaitForHidData()
{
 unsigned int TimeOut;

 TimeOut =  5000 ;
 while(!HID_Read())
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




unsigned char WaitForUartData(unsigned int Length, unsigned int TimeOut)
{
 unsigned int i;

 for(i = 0; i < TimeOut; i++)
 {
 if(Length > 0)
 {
 if(UART_Counter >= Length)
 {
 return 0;
 }
 }
 Delay_1ms();
 }


 if(UART_Counter > 0)
 {
 return 0x02;
 }


 return 0x01;
}





unsigned char CheckSyncInAckFromHost(unsigned char ExpectedAckByte)
{
 unsigned int TimeOut;


 TimeOut =  5000 ;
 while(!HID_Read())
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
