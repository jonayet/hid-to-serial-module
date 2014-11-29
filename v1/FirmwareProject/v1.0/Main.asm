
_main:

;Main.c,48 :: 		void main()
;Main.c,50 :: 		unsigned char DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,53 :: 		ConfigureIO();
	CALL        _ConfigureIO+0, 0
;Main.c,54 :: 		ConfigureModules();
	CALL        _ConfigureModules+0, 0
;Main.c,55 :: 		ConfigureInterrupts();
	CALL        _ConfigureInterrupts+0, 0
;Main.c,58 :: 		_OP_RS485_DEnRE = 1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;Main.c,60 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       3
	MOVWF       SPBRGH+0 
	MOVLW       64
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Main.c,63 :: 		USBDev_HIDInit();
	CALL        _USBDev_HIDInit+0, 0
;Main.c,66 :: 		USBDev_Init();
	CALL        _USBDev_Init+0, 0
;Main.c,69 :: 		IPEN_bit = 1;
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;Main.c,70 :: 		USBIP_bit = 1;
	BSF         USBIP_bit+0, BitPos(USBIP_bit+0) 
;Main.c,71 :: 		USBIE_bit = 1;
	BSF         USBIE_bit+0, BitPos(USBIE_bit+0) 
;Main.c,72 :: 		GIEH_bit = 1;
	BSF         GIEH_bit+0, BitPos(GIEH_bit+0) 
;Main.c,75 :: 		while(USBDev_GetDeviceState() != _USB_DEV_STATE_CONFIGURED) { }
L_main0:
	CALL        _USBDev_GetDeviceState+0, 0
	MOVF        R0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_main1
	GOTO        L_main0
L_main1:
;Main.c,88 :: 		while(1)
L_main2:
;Main.c,91 :: 		if(UsbNewPacketReceived)
	MOVF        _UsbNewPacketReceived+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;Main.c,93 :: 		if(hidReadBuff.TransmisionType == BAUDRATE_CMD_FROM_HOST)
	MOVF        1280, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Main.c,95 :: 		SetUartBaudrate(hidReadBuff.BaudRateCommand_FromHost.BaudRateIndex);
	MOVF        1281, 0 
	MOVWF       FARG_SetUartBaudrate_BaudrateIndex+0 
	CALL        _SetUartBaudrate+0, 0
;Main.c,96 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,97 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,98 :: 		}
	GOTO        L_main6
L_main5:
;Main.c,99 :: 		else if(hidReadBuff.TransmisionType == SINGLE_QUERY_FROM_HOST)
	MOVF        1280, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;Main.c,101 :: 		WriteQueryAndGetResponseFromUart();
	CALL        _WriteQueryAndGetResponseFromUart+0, 0
;Main.c,102 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,103 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,104 :: 		}
	GOTO        L_main8
L_main7:
;Main.c,105 :: 		else if(hidReadBuff.TransmisionType == SYNC_OUT_DATA_FROM_HOST)
	MOVF        1280, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;Main.c,107 :: 		WriteSyncOutPacketsToUart();
	CALL        _WriteSyncOutPacketsToUart+0, 0
;Main.c,108 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,109 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,110 :: 		}
	GOTO        L_main10
L_main9:
;Main.c,111 :: 		else if(hidReadBuff.TransmisionType == SYNC_IN_START_FROM_HOST)
	MOVF        1280, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;Main.c,114 :: 		UART_StartReading();
	CALL        _UART_StartReading+0, 0
;Main.c,115 :: 		Timer_1ms = 0;
	CLRF        _Timer_1ms+0 
	CLRF        _Timer_1ms+1 
;Main.c,116 :: 		DoBackgroundWork = 1;
	MOVLW       1
	MOVWF       main_DoBackgroundWork_L0+0 
;Main.c,117 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,118 :: 		}
	GOTO        L_main12
L_main11:
;Main.c,119 :: 		else if(hidReadBuff.TransmisionType == SYNC_IN_READ_FROM_HOST)
	MOVF        1280, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;Main.c,122 :: 		SendSyncInPacketsFromUart();
	CALL        _SendSyncInPacketsFromUart+0, 0
;Main.c,123 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,124 :: 		}
	GOTO        L_main14
L_main13:
;Main.c,125 :: 		else if(hidReadBuff.TransmisionType == ASYNC_OUT_FROM_HOST)
	MOVF        1280, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;Main.c,128 :: 		WriteAsyncOutDataToUart();
	CALL        _WriteAsyncOutDataToUart+0, 0
;Main.c,129 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,130 :: 		}
	GOTO        L_main16
L_main15:
;Main.c,131 :: 		else if(hidReadBuff.TransmisionType == ASYNC_IN_START_FROM_HOST)
	MOVF        1280, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;Main.c,134 :: 		UART_StartReading();
	CALL        _UART_StartReading+0, 0
;Main.c,135 :: 		Timer_1ms = 0;
	CLRF        _Timer_1ms+0 
	CLRF        _Timer_1ms+1 
;Main.c,136 :: 		DoBackgroundWork = 2;
	MOVLW       2
	MOVWF       main_DoBackgroundWork_L0+0 
;Main.c,137 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,138 :: 		}
	GOTO        L_main18
L_main17:
;Main.c,139 :: 		else if(hidReadBuff.TransmisionType == ASYNC_IN_STOP_FROM_HOST)
	MOVF        1280, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
;Main.c,142 :: 		UART_StopReading();
	CALL        _UART_StopReading+0, 0
;Main.c,143 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,144 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,145 :: 		}
	GOTO        L_main20
L_main19:
;Main.c,146 :: 		else if(hidReadBuff.TransmisionType == SYNC_IN_ACK_FROM_HOST)
	MOVF        1280, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;Main.c,149 :: 		}
	GOTO        L_main22
L_main21:
;Main.c,152 :: 		if(hidReadBuff.TransmisionType != NONE_FROM_HOST)
	MOVF        1280, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main23
;Main.c,154 :: 		SendUnknownResponse();
	CALL        _SendUnknownResponse+0, 0
;Main.c,155 :: 		}
L_main23:
;Main.c,156 :: 		hidReadBuff.TransmisionType = NONE_FROM_HOST;
	CLRF        1280 
;Main.c,157 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,158 :: 		}
L_main22:
L_main20:
L_main18:
L_main16:
L_main14:
L_main12:
L_main10:
L_main8:
L_main6:
;Main.c,159 :: 		UsbNewPacketReceived = 0;
	CLRF        _UsbNewPacketReceived+0 
;Main.c,160 :: 		}
L_main4:
;Main.c,163 :: 		if(DoBackgroundWork == 1)
	MOVF        main_DoBackgroundWork_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
;Main.c,165 :: 		if(hidReadBuff.SyncInStart_FromHost.Timeout > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        1282, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main33
	MOVF        1281, 0 
	SUBLW       0
L__main33:
	BTFSC       STATUS+0, 0 
	GOTO        L_main25
;Main.c,167 :: 		if(Timer_1ms >= hidReadBuff.SyncInStart_FromHost.Timeout)
	MOVF        1282, 0 
	SUBWF       _Timer_1ms+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main34
	MOVF        1281, 0 
	SUBWF       _Timer_1ms+0, 0 
L__main34:
	BTFSS       STATUS+0, 0 
	GOTO        L_main26
;Main.c,170 :: 		SendSyncInPacketsFromUart();
	CALL        _SendSyncInPacketsFromUart+0, 0
;Main.c,171 :: 		DoBackgroundWork = 0;
	CLRF        main_DoBackgroundWork_L0+0 
;Main.c,172 :: 		}
L_main26:
;Main.c,173 :: 		}
L_main25:
;Main.c,174 :: 		}
L_main24:
;Main.c,177 :: 		if(DoBackgroundWork == 2)
	MOVF        main_DoBackgroundWork_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main27
;Main.c,180 :: 		if(hidReadBuff.AsyncInStart_FromHost.RequiredDataLength > 0)
	MOVF        1281, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main28
;Main.c,182 :: 		if(UART_Counter >= hidReadBuff.AsyncInStart_FromHost.RequiredDataLength)
	MOVLW       0
	SUBWF       _UART_Counter+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main35
	MOVF        1281, 0 
	SUBWF       _UART_Counter+0, 0 
L__main35:
	BTFSS       STATUS+0, 0 
	GOTO        L_main29
;Main.c,184 :: 		SendAsyncInSegmentFromUart(1);
	MOVLW       1
	MOVWF       FARG_SendAsyncInSegmentFromUart_FullLength+0 
	CALL        _SendAsyncInSegmentFromUart+0, 0
;Main.c,187 :: 		UART_StartReading();
	CALL        _UART_StartReading+0, 0
;Main.c,188 :: 		Timer_1ms = 0;
	CLRF        _Timer_1ms+0 
	CLRF        _Timer_1ms+1 
;Main.c,189 :: 		}
L_main29:
;Main.c,190 :: 		}
L_main28:
;Main.c,193 :: 		if(hidReadBuff.AsyncInStart_FromHost.Timeout > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        1283, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main36
	MOVF        1282, 0 
	SUBLW       0
L__main36:
	BTFSC       STATUS+0, 0 
	GOTO        L_main30
;Main.c,195 :: 		if(Timer_1ms >= hidReadBuff.AsyncInStart_FromHost.Timeout)
	MOVF        1283, 0 
	SUBWF       _Timer_1ms+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main37
	MOVF        1282, 0 
	SUBWF       _Timer_1ms+0, 0 
L__main37:
	BTFSS       STATUS+0, 0 
	GOTO        L_main31
;Main.c,198 :: 		SendAsyncInSegmentFromUart(0);
	CLRF        FARG_SendAsyncInSegmentFromUart_FullLength+0 
	CALL        _SendAsyncInSegmentFromUart+0, 0
;Main.c,201 :: 		UART_StartReading();
	CALL        _UART_StartReading+0, 0
;Main.c,202 :: 		Timer_1ms = 0;
	CLRF        _Timer_1ms+0 
	CLRF        _Timer_1ms+1 
;Main.c,203 :: 		}
L_main31:
;Main.c,204 :: 		}
L_main30:
;Main.c,205 :: 		}
L_main27:
;Main.c,206 :: 		}
	GOTO        L_main2
;Main.c,207 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
