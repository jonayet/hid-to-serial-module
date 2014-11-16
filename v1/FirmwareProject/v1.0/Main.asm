
_main:

;Main.c,46 :: 		void main()
;Main.c,48 :: 		unsigned char DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,51 :: 		ConfigureIO();
	CALL        _ConfigureIO+0, 0
;Main.c,52 :: 		ConfigureModules();
	CALL        _ConfigureModules+0, 0
;Main.c,53 :: 		ConfigureInterrupts();
	CALL        _ConfigureInterrupts+0, 0
;Main.c,56 :: 		_OP_RS485_DEnRE = 1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;Main.c,58 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       3
	MOVWF       SPBRGH+0 
	MOVLW       64
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Main.c,61 :: 		HID_Enable(&hidReadBuff.Raw.bytes, &hidWriteBuff.Raw.bytes);
	MOVLW       _hidReadBuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_hidReadBuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;Main.c,63 :: 		while(1)
L_main0:
;Main.c,65 :: 		_OP_DEBUG_SIG = 1;
	BSF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;Main.c,66 :: 		Delay_us(100);
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       8
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
;Main.c,67 :: 		_OP_DEBUG_SIG = 0;
	BCF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;Main.c,68 :: 		Delay_us(100);
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       8
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	NOP
;Main.c,69 :: 		}
	GOTO        L_main0
;Main.c,190 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
