#include <stdint.h>
#include "HidToSerial.h"

#define USB_READ_BUFFER hidReadBuff.Raw.bytes
#define USB_WRITE_BUFFER hidWriteBuff.Raw.bytes
#define USB_WRITE_TIMEOUT 1000

extern uint8_t UsbNewPacketReceived;
extern uint8_t UsbPacketSentComplete;

uint8_t HID_WriteBuffer();