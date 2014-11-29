#line 1 "E:/Workplace/Projects/Embedded/HidToSerialModule/hid-to-serial-module/v1/FirmwareProject/v1.0/Library/UsbHelper.c"
#line 1 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/library/usbhelper.h"
#line 1 "c:/users/jonayet new/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
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
#line 8 "e:/workplace/projects/embedded/hidtoserialmodule/hid-to-serial-module/v1/firmwareproject/v1.0/library/usbhelper.h"
extern uint8_t UsbNewPacketReceived;
extern uint8_t UsbPacketSentComplete;

uint8_t HID_WriteBuffer();
#line 1 "c:/users/jonayet new/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 4 "E:/Workplace/Projects/Embedded/HidToSerialModule/hid-to-serial-module/v1/FirmwareProject/v1.0/Library/UsbHelper.c"
volatile uint8_t UsbNewPacketReceived = 0;
volatile uint8_t UsbPacketSentComplete = 0;
uint16_t usbWriteTimeoutCounter;

uint8_t HID_WriteBuffer()
{

 UsbPacketSentComplete = 0;
 USBDev_SendPacket(1,  hidWriteBuff.Raw.bytes , 64);


 usbWriteTimeoutCounter =  1000 ;
 while(!UsbPacketSentComplete)
 {
 if(usbWriteTimeoutCounter == 0) { return 0; }
 usbWriteTimeoutCounter--;
 }
 return 0xFF;
}


void USBDev_EventHandler(uint8_t event)
{
 switch(event)
 {

 case _USB_DEV_EVENT_CONFIGURED:

 USBDev_SetReceiveBuffer(1,  hidReadBuff.Raw.bytes );
 break;
 }
}


void USBDev_DataReceivedHandler(uint8_t ep, uint16_t size)
{
 if(ep == 1) { UsbNewPacketReceived = 1; }
}


void USBDev_DataSentHandler(uint8_t ep)
{
 if(ep == 1)
 {
 UsbPacketSentComplete = 1;


 USBDev_SetReceiveBuffer(1,  hidReadBuff.Raw.bytes );
 }
}
