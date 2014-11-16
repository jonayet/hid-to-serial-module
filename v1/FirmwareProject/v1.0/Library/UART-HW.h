
//--- Settings ---
#define UART_BUFFER_SIZE 900

//--- Global Variables ---
extern char UART_String[UART_BUFFER_SIZE];
extern unsigned char UART_NewReceived;
extern unsigned char UART_Timer;
extern unsigned int UART_Counter;
extern unsigned int FSR_Backup;


//--- Function Prototypes ---
void UART_WriteByte(unsigned char DataByte);
void UART_WriteConstString(const char *ConstString);
void UART_WriteString(char *String);
void UART_ReadWait(unsigned int TimeOut);
void UART_StartReading();
void UART_StopReading();
void UART_InterruptService();


/*
 *Initialize UART Module with specified baud rate
 */
#define UART_Init(BaudRate)             \
{                                       \
    SPBRG = ((Clock_kHz() * 1000 / BaudRate) / 64) - 1;         \
    /* configure TXSTA */               \
    TXSTA = 0;                          \
    /* configure RCSTA */               \
    RCSTA = 0;                          \
    /* configure BAUDCON */             \
    BAUDCON = 0;                        \
    SPEN_bit = 1;                       \
    TXEN_bit = 1;                       \
    CREN_bit = 1;                       \
}


/*
 *        Interrupt service for UART background service, will clear RCIF_bit flag
 */
#define UART_InterruptService()         \
{                                       \
    /* keep backup of FSR */            \
    FSR_Backup = FSR0;                  \
    /* address UART_String */           \
    FSR0 = &UART_String[UART_Counter];  \
    /* if Over Run Error occured, re-enable Continue Receive mode */                \
    if(OERR_bit) { CREN_bit = 0; CREN_bit = 1; }                                    \
    while(1)                            \
    {                                   \
        /* read current UART byte and append it as string(will clear RCIF_bit) */   \
        INDF0 = RCREG;                  \
        PREINC0 = '\0';                 \
        UART_Counter++;                 \
        /* wait until new byte received, break if timeout occured */                \
        UART_Timer = 0x20;              \
        while(UART_Timer) { if(RCIF_bit == 1) { break; } UART_Timer--; }            \
        /* is timeout occured? */       \
        if(!UART_Timer) { break; }      \
    }                                   \
    /* restore FSR */                   \
    FSR0 = FSR_Backup;                  \
    /* set NewReceived flag */          \
    UART_NewReceived = 0xFF;            \
}

///*
// *        Interrupt service for UART background service
// */
//void UART_InterruptService()
//{
//    if(RCIE_bit == 1 && RCIF_bit == 1)
//    {
//        // keep backup of FSR
//        FSR_Backup = FSR0;

//        // address UART_String
//        FSR0 = &UART_String[UART_Counter];
//        UART_Counter++;

//        // read current UART byte and append it as string(will clear RCIF_bit)
//        UART_LastByte = RCREG;
//        INDF0 = UART_LastByte;
//        PREINC0 = '\0';

//        // restore FSR
//        FSR0 = FSR_Backup;

//        // if Over Run Error occured, re-enable Continue Receive mode
//        if(OERR_bit) { CREN_bit = 0; CREN_bit = 1; }

//        // set NewReceived flag
//        UART_NewReceived = 0xFF;
//    }
//}