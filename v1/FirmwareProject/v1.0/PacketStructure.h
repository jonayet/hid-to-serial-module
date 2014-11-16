#ifndef _PACKETSTRUCTURE_H_
#define _PACKETSTRUCTURE_H_

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

#endif