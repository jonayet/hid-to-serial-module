#ifndef _HIDTOSERIAL_H_
#define _HIDTOSERIAL_H_
#include "PacketStructure.h"

#define SYNC_OUT_TIMEOUT 5000
#define SYNC_IN_TIMEOUT 5000

extern HostPacketData hidReadBuff;
extern DevicePacketData hidWriteBuff;

void ClearHidWriteBuffer();

// Index=1 > Baudrate : 1200; Index=2 > Baudrate : 2400; index=4 > Baudrate : 4800;
// index=9 > Baudrate : 9600; Index=14 > Baudrate : 14400; index=19 > Baudrate : 19200;
// index=38 > Baudrate : 38400; index=56 > Baudrate : 56000; index=57 > Baudrate : 57600;
// Index=115 > Baudrate : 115200; index=128 > Baudrate : 128000;
void SetUartBaudrate(unsigned char BaudrateIndex);
void WriteQueryAndGetResponseFromUart();
void WriteSyncOutPacketsToUart();
void SendSyncInPacketsFromUart();
void WriteAsyncOutDataToUart();
void SendAsyncInSegmentFromUart(unsigned char FullLength);
void SendUnknownResponse();


#endif