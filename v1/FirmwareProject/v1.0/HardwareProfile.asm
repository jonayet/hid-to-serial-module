
_ConfigureIO:

;HardwareProfile.c,5 :: 		void ConfigureIO()
;HardwareProfile.c,8 :: 		PORTA = 0;
	CLRF        PORTA+0 
;HardwareProfile.c,9 :: 		PORtB = 0;
	CLRF        PORTB+0 
;HardwareProfile.c,10 :: 		PORTC = 0;
	CLRF        PORTC+0 
;HardwareProfile.c,13 :: 		_OP_RS485_DEnRE = 0;
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;HardwareProfile.c,14 :: 		_DR_RS485_DEnRE = 0;
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;HardwareProfile.c,17 :: 		_OP_DEBUG_SIG = 0;
	BCF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;HardwareProfile.c,18 :: 		_DR_DEBUG_SIG = 0;
	BCF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;HardwareProfile.c,19 :: 		}
L_end_ConfigureIO:
	RETURN      0
; end of _ConfigureIO

_ConfigureModules:

;HardwareProfile.c,22 :: 		void ConfigureModules()
;HardwareProfile.c,25 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;HardwareProfile.c,28 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;HardwareProfile.c,31 :: 		T08BIT_bit = 1;         // use as 8 bit mode
	BSF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;HardwareProfile.c,32 :: 		T0CS_bit = 0;           // clock source: instruction cycle
	BCF         T0CS_bit+0, BitPos(T0CS_bit+0) 
;HardwareProfile.c,33 :: 		PSA_bit = 0;            // assign pre-scaler
	BCF         PSA_bit+0, BitPos(PSA_bit+0) 
;HardwareProfile.c,34 :: 		T0PS2_bit = 1;          // presacler value 1:64
	BSF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;HardwareProfile.c,35 :: 		T0PS1_bit = 0;          // 000 - 1:2,  001 - 1:4,  010 - 1:8,   011 - 1:16
	BCF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;HardwareProfile.c,36 :: 		T0PS0_bit = 1;          // 100 - 1:32, 101 - 1:64, 110 - 1:128, 111 - 1:256
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;HardwareProfile.c,37 :: 		TMR0H = 0;              // clear register value
	CLRF        TMR0H+0 
;HardwareProfile.c,38 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;HardwareProfile.c,39 :: 		TMR0ON_bit = 1;           // start the TMR0 module
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;HardwareProfile.c,40 :: 		}
L_end_ConfigureModules:
	RETURN      0
; end of _ConfigureModules

_ConfigureInterrupts:

;HardwareProfile.c,43 :: 		void ConfigureInterrupts()
;HardwareProfile.c,46 :: 		IPEN_bit = 1;
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;HardwareProfile.c,47 :: 		PEIE_bit = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;HardwareProfile.c,50 :: 		TMR0IP_bit = 0;
	BCF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;HardwareProfile.c,51 :: 		RCIP_bit = 0;
	BCF         RCIP_bit+0, BitPos(RCIP_bit+0) 
;HardwareProfile.c,54 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;HardwareProfile.c,55 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;HardwareProfile.c,58 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;HardwareProfile.c,59 :: 		}
L_end_ConfigureInterrupts:
	RETURN      0
; end of _ConfigureInterrupts
