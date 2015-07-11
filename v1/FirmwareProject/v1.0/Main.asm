
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
;Main.c,64 :: 		while(1)
L_main0:
;Main.c,67 :: 		if(HID_Read())
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;Main.c,69 :: 		if(hidReadBuff.TransmisionType == BAUDRATE_CMD_FROM_HOST)
	MOVF        1280, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;Main.c,71 :: 		SetUartBaudrate(hidReadBuff.BaudRateCommand_FromHost.BaudRateIndex);
	MOVF        1281, 0 
	MOVWF       FARG_SetUartBaudrate_BaudrateIndex+0 
	CALL        _SetUartBaudrate+0, 0
;Main.c,72 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,73 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,74 :: 		}
	GOTO        L_main4
L_main3:
;Main.c,75 :: 		else if(hidReadBuff.TransmisionType == SINGLE_QUERY_FROM_HOST)
	MOVF        1280, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Main.c,77 :: 		WriteQueryAndGetResponseFromUart();
	CALL        _WriteQueryAndGetResponseFromUart+0, 0
;Main.c,78 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,79 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,80 :: 		}
	GOTO        L_main6
L_main5:
;Main.c,81 :: 		else if(hidReadBuff.TransmisionType == SYNC_OUT_DATA_FROM_HOST)
	MOVF        1280, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;Main.c,83 :: 		WriteSyncOutPacketsToUart();
	CALL        _WriteSyncOutPacketsToUart+0, 0
;Main.c,84 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,85 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,86 :: 		}
	GOTO        L_main8
L_main7:
;Main.c,87 :: 		else if(hidReadBuff.TransmisionType == SYNC_IN_START_FROM_HOST)
	MOVF        1280, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;Main.c,90 :: 		UART_StartReading();
	CALL        _UART_StartReading+0, 0
;Main.c,91 :: 		Timer_1ms = 0;
	CLRF        _Timer_1ms+0 
	CLRF        _Timer_1ms+1 
;Main.c,92 :: 		DoBackgroundWork = 1;
	MOVLW       1
	MOVWF       main_DoBackgroundWork_L0+0 
;Main.c,93 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,94 :: 		}
	GOTO        L_main10
L_main9:
;Main.c,95 :: 		else if(hidReadBuff.TransmisionType == SYNC_IN_READ_FROM_HOST)
	MOVF        1280, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;Main.c,98 :: 		SendSyncInPacketsFromUart();
	CALL        _SendSyncInPacketsFromUart+0, 0
;Main.c,99 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,100 :: 		}
	GOTO        L_main12
L_main11:
;Main.c,101 :: 		else if(hidReadBuff.TransmisionType == ASYNC_OUT_FROM_HOST)
	MOVF        1280, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;Main.c,104 :: 		WriteAsyncOutDataToUart();
	CALL        _WriteAsyncOutDataToUart+0, 0
;Main.c,105 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,106 :: 		}
	GOTO        L_main14
L_main13:
;Main.c,107 :: 		else if(hidReadBuff.TransmisionType == ASYNC_IN_START_FROM_HOST)
	MOVF        1280, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;Main.c,110 :: 		UART_StartReading();
	CALL        _UART_StartReading+0, 0
;Main.c,111 :: 		Timer_1ms = 0;
	CLRF        _Timer_1ms+0 
	CLRF        _Timer_1ms+1 
;Main.c,112 :: 		DoBackgroundWork = 2;
	MOVLW       2
	MOVWF       main_DoBackgroundWork_L0+0 
;Main.c,113 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,114 :: 		}
	GOTO        L_main16
L_main15:
;Main.c,115 :: 		else if(hidReadBuff.TransmisionType == ASYNC_IN_STOP_FROM_HOST)
	MOVF        1280, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;Main.c,118 :: 		UART_StopReading();
	CALL        _UART_StopReading+0, 0
;Main.c,119 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,120 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,121 :: 		}
	GOTO        L_main18
L_main17:
;Main.c,122 :: 		else if(hidReadBuff.TransmisionType == SYNC_IN_ACK_FROM_HOST)
	MOVF        1280, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
;Main.c,125 :: 		}
	GOTO        L_main20
L_main19:
;Main.c,128 :: 		if(hidReadBuff.TransmisionType != NONE_FROM_HOST)
	MOVF        1280, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main21
;Main.c,130 :: 		SendUnknownResponse();
	CALL        _SendUnknownResponse+0, 0
;Main.c,131 :: 		}
L_main21:
;Main.c,132 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,133 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,134 :: 		}
L_main20:
L_main18:
L_main16:
L_main14:
L_main12:
L_main10:
L_main8:
L_main6:
L_main4:
;Main.c,135 :: 		}
L_main2:
;Main.c,138 :: 		if(DoBackgroundWork == 1)
	MOVF        main_DoBackgroundWork_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
;Main.c,140 :: 		if(hidReadBuff.SyncInStart_FromHost.Timeout > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        1282, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main31
	MOVF        1281, 0 
	SUBLW       0
L__main31:
	BTFSC       STATUS+0, 0 
	GOTO        L_main23
;Main.c,142 :: 		if(Timer_1ms >= hidReadBuff.SyncInStart_FromHost.Timeout)
	MOVF        1282, 0 
	SUBWF       _Timer_1ms+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main32
	MOVF        1281, 0 
	SUBWF       _Timer_1ms+0, 0 
L__main32:
	BTFSS       STATUS+0, 0 
	GOTO        L_main24
;Main.c,145 :: 		SendSyncInPacketsFromUart();
	CALL        _SendSyncInPacketsFromUart+0, 0
;Main.c,146 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,147 :: 		}
L_main24:
;Main.c,148 :: 		}
L_main23:
;Main.c,149 :: 		}
L_main22:
;Main.c,152 :: 		if(DoBackgroundWork == 2)
	MOVF        main_DoBackgroundWork_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main25
;Main.c,155 :: 		if(hidReadBuff.AsyncInStart_FromHost.RequiredDataLength > 0)
	MOVF        1281, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main26
;Main.c,157 :: 		if(UART_Counter >= hidReadBuff.AsyncInStart_FromHost.RequiredDataLength)
	MOVLW       0
	SUBWF       _UART_Counter+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main33
	MOVF        1281, 0 
	SUBWF       _UART_Counter+0, 0 
L__main33:
	BTFSS       STATUS+0, 0 
	GOTO        L_main27
;Main.c,159 :: 		SendAsyncInSegmentFromUart(1);
	MOVLW       1
	MOVWF       FARG_SendAsyncInSegmentFromUart_FullLength+0 
	CALL        _SendAsyncInSegmentFromUart+0, 0
;Main.c,162 :: 		UART_StartReading();
	CALL        _UART_StartReading+0, 0
;Main.c,163 :: 		Timer_1ms = 0;
	CLRF        _Timer_1ms+0 
	CLRF        _Timer_1ms+1 
;Main.c,164 :: 		}
L_main27:
;Main.c,165 :: 		}
L_main26:
;Main.c,168 :: 		if(hidReadBuff.AsyncInStart_FromHost.Timeout > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        1283, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main34
	MOVF        1282, 0 
	SUBLW       0
L__main34:
	BTFSC       STATUS+0, 0 
	GOTO        L_main28
;Main.c,170 :: 		if(Timer_1ms >= hidReadBuff.AsyncInStart_FromHost.Timeout)
	MOVF        1283, 0 
	SUBWF       _Timer_1ms+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main35
	MOVF        1282, 0 
	SUBWF       _Timer_1ms+0, 0 
L__main35:
	BTFSS       STATUS+0, 0 
	GOTO        L_main29
;Main.c,173 :: 		SendAsyncInSegmentFromUart(0);
	CLRF        FARG_SendAsyncInSegmentFromUart_FullLength+0 
	CALL        _SendAsyncInSegmentFromUart+0, 0
;Main.c,176 :: 		UART_StartReading();
	CALL        _UART_StartReading+0, 0
;Main.c,177 :: 		Timer_1ms = 0;
	CLRF        _Timer_1ms+0 
	CLRF        _Timer_1ms+1 
;Main.c,178 :: 		}
L_main29:
;Main.c,179 :: 		}
L_main28:
;Main.c,180 :: 		}
L_main25:
;Main.c,181 :: 		}
	GOTO        L_main0
;Main.c,182 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
