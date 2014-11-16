
_UART_WriteByte:

;UART-HW.c,17 :: 		void UART_WriteByte(unsigned char DataByte)
;UART-HW.c,20 :: 		while(TRMT_bit == 0) { }
L_UART_WriteByte0:
	BTFSC       TRMT_bit+0, BitPos(TRMT_bit+0) 
	GOTO        L_UART_WriteByte1
	GOTO        L_UART_WriteByte0
L_UART_WriteByte1:
;UART-HW.c,21 :: 		TXREG = DataByte;
	MOVF        FARG_UART_WriteByte_DataByte+0, 0 
	MOVWF       TXREG+0 
;UART-HW.c,22 :: 		}
L_end_UART_WriteByte:
	RETURN      0
; end of _UART_WriteByte

_UART_WriteConstString:

;UART-HW.c,26 :: 		void UART_WriteConstString(const char* ConstString)
;UART-HW.c,28 :: 		while(*ConstString)
L_UART_WriteConstString2:
	MOVF        FARG_UART_WriteConstString_ConstString+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_UART_WriteConstString_ConstString+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_UART_WriteConstString_ConstString+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UART_WriteConstString3
;UART-HW.c,31 :: 		while(TRMT_bit == 0) { }
L_UART_WriteConstString4:
	BTFSC       TRMT_bit+0, BitPos(TRMT_bit+0) 
	GOTO        L_UART_WriteConstString5
	GOTO        L_UART_WriteConstString4
L_UART_WriteConstString5:
;UART-HW.c,32 :: 		TXREG = *ConstString;
	MOVF        FARG_UART_WriteConstString_ConstString+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_UART_WriteConstString_ConstString+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_UART_WriteConstString_ConstString+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, TXREG+0
;UART-HW.c,35 :: 		ConstString++;
	MOVLW       1
	ADDWF       FARG_UART_WriteConstString_ConstString+0, 1 
	MOVLW       0
	ADDWFC      FARG_UART_WriteConstString_ConstString+1, 1 
	ADDWFC      FARG_UART_WriteConstString_ConstString+2, 1 
;UART-HW.c,36 :: 		}
	GOTO        L_UART_WriteConstString2
L_UART_WriteConstString3:
;UART-HW.c,37 :: 		}
L_end_UART_WriteConstString:
	RETURN      0
; end of _UART_WriteConstString

_UART_WriteString:

;UART-HW.c,40 :: 		void UART_WriteString(char* String)
;UART-HW.c,42 :: 		while(*String)
L_UART_WriteString6:
	MOVFF       FARG_UART_WriteString_String+0, FSR0
	MOVFF       FARG_UART_WriteString_String+1, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_UART_WriteString7
;UART-HW.c,45 :: 		while(TRMT_bit == 0) { }
L_UART_WriteString8:
	BTFSC       TRMT_bit+0, BitPos(TRMT_bit+0) 
	GOTO        L_UART_WriteString9
	GOTO        L_UART_WriteString8
L_UART_WriteString9:
;UART-HW.c,46 :: 		TXREG = *String;
	MOVFF       FARG_UART_WriteString_String+0, FSR0
	MOVFF       FARG_UART_WriteString_String+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       TXREG+0 
;UART-HW.c,49 :: 		String++;
	INFSNZ      FARG_UART_WriteString_String+0, 1 
	INCF        FARG_UART_WriteString_String+1, 1 
;UART-HW.c,50 :: 		}
	GOTO        L_UART_WriteString6
L_UART_WriteString7:
;UART-HW.c,51 :: 		}
L_end_UART_WriteString:
	RETURN      0
; end of _UART_WriteString

_UART_ReadWait:

;UART-HW.c,54 :: 		void UART_ReadWait(unsigned int TimeOut)
;UART-HW.c,57 :: 		UART_String[0] = '\0';
	CLRF        _UART_String+0 
;UART-HW.c,58 :: 		UART_Counter = 0;
	CLRF        _UART_Counter+0 
	CLRF        _UART_Counter+1 
;UART-HW.c,61 :: 		UART_NewReceived = RCREG;
	MOVF        RCREG+0, 0 
	MOVWF       _UART_NewReceived+0 
;UART-HW.c,62 :: 		UART_NewReceived = 0;
	CLRF        _UART_NewReceived+0 
;UART-HW.c,63 :: 		RCIE_bit = 1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;UART-HW.c,66 :: 		while(TimeOut) { Delay_ms(1); TimeOut--; }
L_UART_ReadWait10:
	MOVF        FARG_UART_ReadWait_TimeOut+0, 0 
	IORWF       FARG_UART_ReadWait_TimeOut+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UART_ReadWait11
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_UART_ReadWait12:
	DECFSZ      R13, 1, 1
	BRA         L_UART_ReadWait12
	DECFSZ      R12, 1, 1
	BRA         L_UART_ReadWait12
	NOP
	MOVLW       1
	SUBWF       FARG_UART_ReadWait_TimeOut+0, 1 
	MOVLW       0
	SUBWFB      FARG_UART_ReadWait_TimeOut+1, 1 
	GOTO        L_UART_ReadWait10
L_UART_ReadWait11:
;UART-HW.c,69 :: 		RCIE_bit = 0;
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;UART-HW.c,70 :: 		}
L_end_UART_ReadWait:
	RETURN      0
; end of _UART_ReadWait

_UART_StartReading:

;UART-HW.c,75 :: 		void UART_StartReading()
;UART-HW.c,78 :: 		UART_NewReceived = RCREG;
	MOVF        RCREG+0, 0 
	MOVWF       _UART_NewReceived+0 
;UART-HW.c,79 :: 		UART_NewReceived = 0;
	CLRF        _UART_NewReceived+0 
;UART-HW.c,80 :: 		RCIE_bit = 1;
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;UART-HW.c,83 :: 		UART_String[0] = '\0';
	CLRF        _UART_String+0 
;UART-HW.c,84 :: 		UART_Counter = 0;
	CLRF        _UART_Counter+0 
	CLRF        _UART_Counter+1 
;UART-HW.c,85 :: 		}
L_end_UART_StartReading:
	RETURN      0
; end of _UART_StartReading

_UART_StopReading:

;UART-HW.c,90 :: 		void UART_StopReading()
;UART-HW.c,93 :: 		RCIE_bit = 0;
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;UART-HW.c,94 :: 		}
L_end_UART_StopReading:
	RETURN      0
; end of _UART_StopReading
