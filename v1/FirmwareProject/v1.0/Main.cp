#line 1 "E:/Workplace/Projects/Embedded/HidToSerialModule/hid-to-serial-module/v1/FirmwareProject/v1.0/Main.c"
#line 1 "c:/users/jonayet/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/hardwareprofile.h"
#line 17 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/hardwareprofile.h"
extern unsigned int Timer_1ms;


void ConfigureIO();
void ConfigureModules();
void ConfigureInterrupts();
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/compilerdefinations.h"
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
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/library/hidtoserial.h"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/packetstructure.h"
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
#line 39 "E:/Workplace/Projects/Embedded/HidToSerialModule/hid-to-serial-module/v1/FirmwareProject/v1.0/Main.c"
HostPacketData hidReadBuff absolute 0x500;
DevicePacketData hidWriteBuff absolute 0x540;


unsigned int Timer_1ms = 0;


void main()
{
 unsigned char DoBackgroundWork = 0;


 ConfigureIO();
 ConfigureModules();
 ConfigureInterrupts();


  LATC2_bit  = 1;

 UART1_Init(9600);


 HID_Enable(&hidReadBuff.Raw.bytes, &hidWriteBuff.Raw.bytes);

 while(1)
 {
  LATA0_bit  = 1;
 Delay_us(100);
  LATA0_bit  = 0;
 Delay_us(100);
 }


 while(1)
 {

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

 UART_StartReading();
 Timer_1ms = 0;
 DoBackgroundWork = 1;
 hidReadBuff.TransmisionType = NONE_FROM_HOST;
 }
 else if(hidReadBuff.TransmisionType == SYNC_IN_READ_FROM_HOST)
 {

 SendSyncInPacketsFromUart();
 hidReadBuff.TransmisionType = NONE_FROM_HOST;
 }
 else if(hidReadBuff.TransmisionType == ASYNC_OUT_FROM_HOST)
 {

 WriteAsyncOutDataToUart();
 hidReadBuff.TransmisionType = NONE_FROM_HOST;
 }
 else if(hidReadBuff.TransmisionType == ASYNC_IN_START_FROM_HOST)
 {

 UART_StartReading();
 Timer_1ms = 0;
 DoBackgroundWork = 2;
 hidReadBuff.TransmisionType = NONE_FROM_HOST;
 }
 else if(hidReadBuff.TransmisionType == ASYNC_IN_STOP_FROM_HOST)
 {

 UART_StopReading();
 hidReadBuff.TransmisionType = NONE_FROM_HOST;
 DoBackgroundWork = 0;
 }
 else if(hidReadBuff.TransmisionType == SYNC_IN_ACK_FROM_HOST)
 {

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


 if(DoBackgroundWork == 1)
 {
 if(hidReadBuff.SyncInStart_FromHost.Timeout > 0)
 {
 if(Timer_1ms >= hidReadBuff.SyncInStart_FromHost.Timeout)
 {

 SendSyncInPacketsFromUart();
 DoBackgroundWork = 0;
 }
 }
 }


 if(DoBackgroundWork == 2)
 {

 if(hidReadBuff.AsyncInStart_FromHost.RequiredDataLength > 0)
 {
 if(UART_Counter >= hidReadBuff.AsyncInStart_FromHost.RequiredDataLength)
 {
 SendAsyncInSegmentFromUart(1);


 UART_StartReading();
 Timer_1ms = 0;
 }
 }


 if(hidReadBuff.AsyncInStart_FromHost.Timeout > 0)
 {
 if(Timer_1ms >= hidReadBuff.AsyncInStart_FromHost.Timeout)
 {

 SendAsyncInSegmentFromUart(0);


 UART_StartReading();
 Timer_1ms = 0;
 }
 }
 }
 }
}
