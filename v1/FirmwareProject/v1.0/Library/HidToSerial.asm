
_SetUartBaudrate:

;HidToSerial.c,20 :: 		void SetUartBaudrate(unsigned char BaudrateIndex)
;HidToSerial.c,22 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,23 :: 		hidWriteBuff.BaudRateResponse_FromDevice.TransmisionType = BAUDRATE_RESP_FROM_DEVICE;
	MOVLW       1
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,24 :: 		switch(BaudrateIndex)
	GOTO        L_SetUartBaudrate0
;HidToSerial.c,26 :: 		case 1:
L_SetUartBaudrate2:
;HidToSerial.c,27 :: 		UART1_Init(1200);
	BSF         BAUDCON+0, 3, 0
	MOVLW       26
	MOVWF       SPBRGH+0 
	MOVLW       10
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,28 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 1200\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_1_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_1_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_1_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,29 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,30 :: 		case 2:
L_SetUartBaudrate3:
;HidToSerial.c,31 :: 		UART1_Init(2400);
	BSF         BAUDCON+0, 3, 0
	MOVLW       13
	MOVWF       SPBRGH+0 
	MOVLW       4
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,32 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 2400\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_2_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_2_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_2_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,33 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,34 :: 		case 4:
L_SetUartBaudrate4:
;HidToSerial.c,35 :: 		UART1_Init(4800);
	BSF         BAUDCON+0, 3, 0
	MOVLW       6
	MOVWF       SPBRGH+0 
	MOVLW       130
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,36 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 4800\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_3_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_3_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_3_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,37 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,38 :: 		case 9:
L_SetUartBaudrate5:
;HidToSerial.c,39 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       3
	MOVWF       SPBRGH+0 
	MOVLW       64
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,40 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 9600\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_4_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_4_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_4_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,41 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,42 :: 		case 14:
L_SetUartBaudrate6:
;HidToSerial.c,43 :: 		UART1_Init(14400);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       43
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,44 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 14400\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_5_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_5_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_5_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,45 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,46 :: 		case 19:
L_SetUartBaudrate7:
;HidToSerial.c,47 :: 		UART1_Init(19200);
	BSF         BAUDCON+0, 3, 0
	MOVLW       1
	MOVWF       SPBRGH+0 
	MOVLW       160
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,48 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 19200\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_6_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_6_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_6_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,49 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,50 :: 		case 38:
L_SetUartBaudrate8:
;HidToSerial.c,51 :: 		UART1_Init(38400);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,52 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 38400\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_7_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_7_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_7_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,53 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,54 :: 		case 56:
L_SetUartBaudrate9:
;HidToSerial.c,55 :: 		UART1_Init(56000);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       142
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,56 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 56000\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_8_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_8_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_8_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,57 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,58 :: 		case 57:
L_SetUartBaudrate10:
;HidToSerial.c,59 :: 		UART1_Init(57600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       138
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,60 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 57600\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_9_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_9_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_9_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,61 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,62 :: 		case 115:
L_SetUartBaudrate11:
;HidToSerial.c,63 :: 		UART1_Init(115200);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       68
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,64 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 115200\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_10_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_10_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_10_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,65 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,66 :: 		case 128:
L_SetUartBaudrate12:
;HidToSerial.c,67 :: 		UART1_Init(128000);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       61
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,68 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 128000\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_11_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_11_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_11_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,69 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,70 :: 		default:
L_SetUartBaudrate13:
;HidToSerial.c,71 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Error : Unknown BaudRate Index\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_12_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_12_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_12_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,72 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,73 :: 		}
L_SetUartBaudrate0:
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate2
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate3
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate4
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate5
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate6
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       19
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate7
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       38
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate8
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate9
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       57
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate10
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       115
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate11
	MOVF        FARG_SetUartBaudrate_BaudrateIndex+0, 0 
	XORLW       128
	BTFSC       STATUS+0, 2 
	GOTO        L_SetUartBaudrate12
	GOTO        L_SetUartBaudrate13
L_SetUartBaudrate1:
;HidToSerial.c,75 :: 		HID_WriteBuffer();
	CALL        _HID_WriteBuffer+0, 0
;HidToSerial.c,76 :: 		}
L_end_SetUartBaudrate:
	RETURN      0
; end of _SetUartBaudrate

_WriteQueryAndGetResponseFromUart:

;HidToSerial.c,78 :: 		void WriteQueryAndGetResponseFromUart()
;HidToSerial.c,84 :: 		if(hidReadBuff.SingleQuery_FromHost.Timeout > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        _hidReadBuff+4, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteQueryAndGetResponseFromUart60
	MOVF        _hidReadBuff+3, 0 
	SUBLW       0
L__WriteQueryAndGetResponseFromUart60:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteQueryAndGetResponseFromUart14
;HidToSerial.c,86 :: 		UART_StartReading();
	CALL        _UART_StartReading+0, 0
;HidToSerial.c,87 :: 		}
L_WriteQueryAndGetResponseFromUart14:
;HidToSerial.c,90 :: 		for(i = 0; i < hidReadBuff.SingleQuery_FromHost.ThisSegmentDataLength; i++)
	CLRF        WriteQueryAndGetResponseFromUart_i_L0+0 
L_WriteQueryAndGetResponseFromUart15:
	MOVF        _hidReadBuff+1, 0 
	SUBWF       WriteQueryAndGetResponseFromUart_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteQueryAndGetResponseFromUart16
;HidToSerial.c,92 :: 		UART_WriteByte(hidReadBuff.SingleQuery_FromHost.DataArray[i]);
	MOVLW       _hidReadBuff+5
	MOVWF       FSR0 
	MOVLW       hi_addr(_hidReadBuff+5)
	MOVWF       FSR0H 
	MOVF        WriteQueryAndGetResponseFromUart_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART_WriteByte_DataByte+0 
	CALL        _UART_WriteByte+0, 0
;HidToSerial.c,90 :: 		for(i = 0; i < hidReadBuff.SingleQuery_FromHost.ThisSegmentDataLength; i++)
	INCF        WriteQueryAndGetResponseFromUart_i_L0+0, 1 
;HidToSerial.c,93 :: 		}
	GOTO        L_WriteQueryAndGetResponseFromUart15
L_WriteQueryAndGetResponseFromUart16:
;HidToSerial.c,97 :: 		if(hidReadBuff.SingleQuery_FromHost.Timeout == 0) { return; }
	MOVLW       0
	XORWF       _hidReadBuff+4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteQueryAndGetResponseFromUart61
	MOVLW       0
	XORWF       _hidReadBuff+3, 0 
L__WriteQueryAndGetResponseFromUart61:
	BTFSS       STATUS+0, 2 
	GOTO        L_WriteQueryAndGetResponseFromUart18
	GOTO        L_end_WriteQueryAndGetResponseFromUart
L_WriteQueryAndGetResponseFromUart18:
;HidToSerial.c,100 :: 		result = WaitForUartData(hidReadBuff.SingleQuery_FromHost.ExpectedDataLength, hidReadBuff.SingleQuery_FromHost.Timeout);
	MOVF        _hidReadBuff+2, 0 
	MOVWF       FARG_WaitForUartData_Length+0 
	MOVLW       0
	MOVWF       FARG_WaitForUartData_Length+1 
	MOVF        _hidReadBuff+3, 0 
	MOVWF       FARG_WaitForUartData_TimeOut+0 
	MOVF        _hidReadBuff+4, 0 
	MOVWF       FARG_WaitForUartData_TimeOut+1 
	CALL        _WaitForUartData+0, 0
	MOVF        R0, 0 
	MOVWF       WriteQueryAndGetResponseFromUart_result_L0+0 
;HidToSerial.c,101 :: 		UART_StopReading();
	CALL        _UART_StopReading+0, 0
;HidToSerial.c,103 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,105 :: 		hidWriteBuff.SingleResponse_FromDevice.TransmisionType = SINGLE_RESPONSE_FROM_DEVICE;
	MOVLW       2
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,106 :: 		if(result == 0)
	MOVF        WriteQueryAndGetResponseFromUart_result_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_WriteQueryAndGetResponseFromUart19
;HidToSerial.c,108 :: 		hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength = hidReadBuff.SingleQuery_FromHost.ExpectedDataLength;
	MOVF        _hidReadBuff+2, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,109 :: 		memcpy(hidWriteBuff.SingleResponse_FromDevice.DataArray, UART_String, hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength);
	MOVLW       _hidWriteBuff+2
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(_hidWriteBuff+2)
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       _UART_String+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(_UART_String+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVF        _hidReadBuff+2, 0 
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;HidToSerial.c,110 :: 		}
	GOTO        L_WriteQueryAndGetResponseFromUart20
L_WriteQueryAndGetResponseFromUart19:
;HidToSerial.c,115 :: 		hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength = UART_Counter;
	MOVF        _UART_Counter+0, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,116 :: 		memcpy(hidWriteBuff.SingleResponse_FromDevice.DataArray, UART_String, UART_Counter);
	MOVLW       _hidWriteBuff+2
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(_hidWriteBuff+2)
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       _UART_String+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(_UART_String+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVF        _UART_Counter+0, 0 
	MOVWF       FARG_memcpy_n+0 
	MOVF        _UART_Counter+1, 0 
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;HidToSerial.c,117 :: 		}
L_WriteQueryAndGetResponseFromUart20:
;HidToSerial.c,120 :: 		HID_WriteBuffer();
	CALL        _HID_WriteBuffer+0, 0
;HidToSerial.c,121 :: 		}
L_end_WriteQueryAndGetResponseFromUart:
	RETURN      0
; end of _WriteQueryAndGetResponseFromUart

_WriteSyncOutPacketsToUart:

;HidToSerial.c,123 :: 		void WriteSyncOutPacketsToUart()
;HidToSerial.c,126 :: 		WriteSyncOutSegmentToUart();
	CALL        _WriteSyncOutSegmentToUart+0, 0
;HidToSerial.c,129 :: 		while(hidReadBuff.SyncOutData_FromHost.NoOfRemainingPackets > 0)
L_WriteSyncOutPacketsToUart21:
	MOVLW       0
	MOVWF       R0 
	MOVF        _hidReadBuff+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteSyncOutPacketsToUart63
	MOVF        _hidReadBuff+2, 0 
	SUBLW       0
L__WriteSyncOutPacketsToUart63:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteSyncOutPacketsToUart22
;HidToSerial.c,132 :: 		if(WaitForHidData() != 0)
	CALL        _WaitForHidData+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_WriteSyncOutPacketsToUart23
;HidToSerial.c,134 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,135 :: 		hidWriteBuff.SyncOutAck_FromDevice.TransmisionType = SYNC_OUT_ACK_FROM_DEVICE;
	MOVLW       3
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,136 :: 		hidWriteBuff.SyncOutAck_FromDevice.DeviceAckByte = 0;
	CLRF        _hidWriteBuff+1 
;HidToSerial.c,137 :: 		HID_WriteBuffer();
	CALL        _HID_WriteBuffer+0, 0
;HidToSerial.c,138 :: 		return;
	GOTO        L_end_WriteSyncOutPacketsToUart
;HidToSerial.c,139 :: 		}
L_WriteSyncOutPacketsToUart23:
;HidToSerial.c,141 :: 		if(hidReadBuff.TransmisionType != SYNC_OUT_DATA_FROM_HOST) { return; }
	MOVF        _hidReadBuff+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_WriteSyncOutPacketsToUart24
	GOTO        L_end_WriteSyncOutPacketsToUart
L_WriteSyncOutPacketsToUart24:
;HidToSerial.c,142 :: 		WriteSyncOutSegmentToUart();
	CALL        _WriteSyncOutSegmentToUart+0, 0
;HidToSerial.c,143 :: 		}
	GOTO        L_WriteSyncOutPacketsToUart21
L_WriteSyncOutPacketsToUart22:
;HidToSerial.c,144 :: 		}
L_end_WriteSyncOutPacketsToUart:
	RETURN      0
; end of _WriteSyncOutPacketsToUart

_SendSyncInPacketsFromUart:

;HidToSerial.c,146 :: 		void SendSyncInPacketsFromUart()
;HidToSerial.c,148 :: 		unsigned char i = 0;
	CLRF        SendSyncInPacketsFromUart_i_L0+0 
	CLRF        SendSyncInPacketsFromUart_NoOfPacket_L0+0 
	CLRF        SendSyncInPacketsFromUart_response_L0+0 
;HidToSerial.c,152 :: 		_StartAgain:
___SendSyncInPacketsFromUart__StartAgain:
;HidToSerial.c,155 :: 		UART_StopReading();
	CALL        _UART_StopReading+0, 0
;HidToSerial.c,158 :: 		if(UART_Counter == 0)
	MOVLW       0
	XORWF       _UART_Counter+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SendSyncInPacketsFromUart65
	MOVLW       0
	XORWF       _UART_Counter+0, 0 
L__SendSyncInPacketsFromUart65:
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInPacketsFromUart25
;HidToSerial.c,160 :: 		SendSyncInErrorPacket();
	CALL        _SendSyncInErrorPacket+0, 0
;HidToSerial.c,161 :: 		return;
	GOTO        L_end_SendSyncInPacketsFromUart
;HidToSerial.c,162 :: 		}
L_SendSyncInPacketsFromUart25:
;HidToSerial.c,165 :: 		NoOfPacket = UART_Counter / sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);;
	MOVLW       59
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _UART_Counter+0, 0 
	MOVWF       R0 
	MOVF        _UART_Counter+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       SendSyncInPacketsFromUart_NoOfPacket_L0+0 
;HidToSerial.c,168 :: 		for(i = 0; i < NoOfPacket; i++)
	CLRF        SendSyncInPacketsFromUart_i_L0+0 
L_SendSyncInPacketsFromUart26:
	MOVF        SendSyncInPacketsFromUart_NoOfPacket_L0+0, 0 
	SUBWF       SendSyncInPacketsFromUart_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SendSyncInPacketsFromUart27
;HidToSerial.c,170 :: 		SendSyncInFullPacket(i);
	MOVF        SendSyncInPacketsFromUart_i_L0+0, 0 
	MOVWF       FARG_SendSyncInFullPacket_dataOffset+0 
	CALL        _SendSyncInFullPacket+0, 0
;HidToSerial.c,171 :: 		response = CheckSyncInAckFromHost(hidWriteBuff.SyncInData_FromDevice.HostAckByte);
	MOVF        _hidWriteBuff+4, 0 
	MOVWF       FARG_CheckSyncInAckFromHost_ExpectedAckByte+0 
	CALL        _CheckSyncInAckFromHost+0, 0
	MOVF        R0, 0 
	MOVWF       SendSyncInPacketsFromUart_response_L0+0 
;HidToSerial.c,174 :: 		if(response == 0x03) { goto _StartAgain; }
	MOVF        R0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInPacketsFromUart29
	GOTO        ___SendSyncInPacketsFromUart__StartAgain
L_SendSyncInPacketsFromUart29:
;HidToSerial.c,177 :: 		if(response != 0)
	MOVF        SendSyncInPacketsFromUart_response_L0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_SendSyncInPacketsFromUart30
;HidToSerial.c,179 :: 		hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
	MOVLW       4
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,180 :: 		hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0;
	CLRF        _hidWriteBuff+4 
;HidToSerial.c,181 :: 		HID_WriteBuffer();
	CALL        _HID_WriteBuffer+0, 0
;HidToSerial.c,182 :: 		return;
	GOTO        L_end_SendSyncInPacketsFromUart
;HidToSerial.c,183 :: 		}
L_SendSyncInPacketsFromUart30:
;HidToSerial.c,168 :: 		for(i = 0; i < NoOfPacket; i++)
	INCF        SendSyncInPacketsFromUart_i_L0+0, 1 
;HidToSerial.c,184 :: 		}
	GOTO        L_SendSyncInPacketsFromUart26
L_SendSyncInPacketsFromUart27:
;HidToSerial.c,187 :: 		SendSyncInFractionalPacket(NoOfPacket);
	MOVF        SendSyncInPacketsFromUart_NoOfPacket_L0+0, 0 
	MOVWF       FARG_SendSyncInFractionalPacket_NofOfFullPacket+0 
	CALL        _SendSyncInFractionalPacket+0, 0
;HidToSerial.c,188 :: 		}
L_end_SendSyncInPacketsFromUart:
	RETURN      0
; end of _SendSyncInPacketsFromUart

_WriteAsyncOutDataToUart:

;HidToSerial.c,190 :: 		void WriteAsyncOutDataToUart()
;HidToSerial.c,195 :: 		for(i = 0; i < hidReadBuff.AsyncOut_FromHost.ThisSegmentDataLength; i++)
	CLRF        WriteAsyncOutDataToUart_i_L0+0 
L_WriteAsyncOutDataToUart31:
	MOVF        _hidReadBuff+1, 0 
	SUBWF       WriteAsyncOutDataToUart_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteAsyncOutDataToUart32
;HidToSerial.c,197 :: 		UART_WriteByte(hidReadBuff.AsyncOut_FromHost.DataArray[i]);
	MOVLW       _hidReadBuff+2
	MOVWF       FSR0 
	MOVLW       hi_addr(_hidReadBuff+2)
	MOVWF       FSR0H 
	MOVF        WriteAsyncOutDataToUart_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART_WriteByte_DataByte+0 
	CALL        _UART_WriteByte+0, 0
;HidToSerial.c,195 :: 		for(i = 0; i < hidReadBuff.AsyncOut_FromHost.ThisSegmentDataLength; i++)
	INCF        WriteAsyncOutDataToUart_i_L0+0, 1 
;HidToSerial.c,198 :: 		}
	GOTO        L_WriteAsyncOutDataToUart31
L_WriteAsyncOutDataToUart32:
;HidToSerial.c,199 :: 		}
L_end_WriteAsyncOutDataToUart:
	RETURN      0
; end of _WriteAsyncOutDataToUart

_SendAsyncInSegmentFromUart:

;HidToSerial.c,201 :: 		void SendAsyncInSegmentFromUart(unsigned char FullLength)
;HidToSerial.c,203 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,206 :: 		hidWriteBuff.AsyncInData_FromDevice.TransmisionType = ASYNC_IN_DATA_FROM_DEVICE;
	MOVLW       5
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,207 :: 		if(FullLength)
	MOVF        FARG_SendAsyncInSegmentFromUart_FullLength+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SendAsyncInSegmentFromUart34
;HidToSerial.c,209 :: 		hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength = hidReadBuff.AsyncInStart_FromHost.RequiredDataLength;
	MOVF        _hidReadBuff+1, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,210 :: 		}
	GOTO        L_SendAsyncInSegmentFromUart35
L_SendAsyncInSegmentFromUart34:
;HidToSerial.c,213 :: 		hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength = UART_Counter;
	MOVF        _UART_Counter+0, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,214 :: 		}
L_SendAsyncInSegmentFromUart35:
;HidToSerial.c,217 :: 		memcpy(hidWriteBuff.AsyncInData_FromDevice.DataArray, UART_String, hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength);
	MOVLW       _hidWriteBuff+2
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(_hidWriteBuff+2)
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       _UART_String+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(_UART_String+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVF        _hidWriteBuff+1, 0 
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;HidToSerial.c,220 :: 		HID_WriteBuffer();
	CALL        _HID_WriteBuffer+0, 0
;HidToSerial.c,221 :: 		}
L_end_SendAsyncInSegmentFromUart:
	RETURN      0
; end of _SendAsyncInSegmentFromUart

_SendUnknownResponse:

;HidToSerial.c,223 :: 		void SendUnknownResponse()
;HidToSerial.c,225 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,228 :: 		hidWriteBuff.UnknownResponse_FromDevice.TransmisionType = UNKNOWN_FROM_DEVICE;
	MOVLW       6
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,231 :: 		GetString(hidWriteBuff.UnknownResponse_FromDevice.DataArray, "Unknown!\r\n");
	MOVLW       _hidWriteBuff+1
	MOVWF       FARG_GetString_Destination+0 
	MOVLW       hi_addr(_hidWriteBuff+1)
	MOVWF       FARG_GetString_Destination+1 
	MOVLW       ?lstr_13_HidToSerial+0
	MOVWF       FARG_GetString_ConstString+0 
	MOVLW       hi_addr(?lstr_13_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+1 
	MOVLW       higher_addr(?lstr_13_HidToSerial+0)
	MOVWF       FARG_GetString_ConstString+2 
	CALL        _GetString+0, 0
;HidToSerial.c,234 :: 		HID_WriteBuffer();
	CALL        _HID_WriteBuffer+0, 0
;HidToSerial.c,235 :: 		}
L_end_SendUnknownResponse:
	RETURN      0
; end of _SendUnknownResponse

_SendSyncInFullPacket:

;HidToSerial.c,237 :: 		void SendSyncInFullPacket(unsigned char PacketIndex)
;HidToSerial.c,245 :: 		dataArrayLength = sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);
	MOVLW       59
	MOVWF       SendSyncInFullPacket_dataArrayLength_L0+0 
;HidToSerial.c,246 :: 		NoOfPacket = UART_Counter / dataArrayLength;
	MOVLW       59
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _UART_Counter+0, 0 
	MOVWF       R0 
	MOVF        _UART_Counter+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       SendSyncInFullPacket_NoOfPacket_L0+0 
;HidToSerial.c,247 :: 		LengthOfLastSegment = UART_Counter % dataArrayLength;
	MOVLW       59
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _UART_Counter+0, 0 
	MOVWF       R0 
	MOVF        _UART_Counter+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SendSyncInFullPacket_LengthOfLastSegment_L0+0 
;HidToSerial.c,250 :: 		if(NoOfPacket == 0) { return; }
	MOVF        SendSyncInFullPacket_NoOfPacket_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInFullPacket36
	GOTO        L_end_SendSyncInFullPacket
L_SendSyncInFullPacket36:
;HidToSerial.c,252 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,255 :: 		hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
	MOVLW       4
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,256 :: 		hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = dataArrayLength;
	MOVF        SendSyncInFullPacket_dataArrayLength_L0+0, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,257 :: 		hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = NoOfPacket - PacketIndex - 1;
	MOVF        FARG_SendSyncInFullPacket_PacketIndex+0, 0 
	SUBWF       SendSyncInFullPacket_NoOfPacket_L0+0, 0 
	MOVWF       R0 
	DECF        R0, 1 
	MOVF        R0, 0 
	MOVWF       _hidWriteBuff+2 
;HidToSerial.c,258 :: 		hidWriteBuff.SyncInData_FromDevice.LastPacketLength = LengthOfLastSegment;
	MOVF        SendSyncInFullPacket_LengthOfLastSegment_L0+0, 0 
	MOVWF       _hidWriteBuff+3 
;HidToSerial.c,259 :: 		hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0x1A;
	MOVLW       26
	MOVWF       _hidWriteBuff+4 
;HidToSerial.c,262 :: 		dataOffset = dataArrayLength * PacketIndex;
	MOVF        SendSyncInFullPacket_dataArrayLength_L0+0, 0 
	MULWF       FARG_SendSyncInFullPacket_PacketIndex+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
;HidToSerial.c,265 :: 		memcpy(hidWriteBuff.SyncInData_FromDevice.DataArray, (UART_String + dataOffset), hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength);
	MOVLW       _hidWriteBuff+5
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(_hidWriteBuff+5)
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       _UART_String+0
	ADDWF       R0, 0 
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(_UART_String+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_memcpy_s1+1 
	MOVF        _hidWriteBuff+1, 0 
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;HidToSerial.c,268 :: 		HID_WriteBuffer();
	CALL        _HID_WriteBuffer+0, 0
;HidToSerial.c,269 :: 		}
L_end_SendSyncInFullPacket:
	RETURN      0
; end of _SendSyncInFullPacket

_SendSyncInFractionalPacket:

;HidToSerial.c,271 :: 		void SendSyncInFractionalPacket(unsigned char NofOfFullPacket)
;HidToSerial.c,277 :: 		if(LengthOfLastSegment == 0) {  return; }
	MOVF        SendSyncInFractionalPacket_LengthOfLastSegment_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInFractionalPacket37
	GOTO        L_end_SendSyncInFractionalPacket
L_SendSyncInFractionalPacket37:
;HidToSerial.c,280 :: 		dataArrayLength = sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);
	MOVLW       59
	MOVWF       SendSyncInFractionalPacket_dataArrayLength_L0+0 
;HidToSerial.c,281 :: 		LengthOfLastSegment = UART_Counter % dataArrayLength;
	MOVLW       59
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _UART_Counter+0, 0 
	MOVWF       R0 
	MOVF        _UART_Counter+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SendSyncInFractionalPacket_LengthOfLastSegment_L0+0 
;HidToSerial.c,283 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,285 :: 		hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
	MOVLW       4
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,286 :: 		hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = LengthOfLastSegment;
	MOVF        SendSyncInFractionalPacket_LengthOfLastSegment_L0+0, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,287 :: 		hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = 0;
	CLRF        _hidWriteBuff+2 
;HidToSerial.c,288 :: 		hidWriteBuff.SyncInData_FromDevice.LastPacketLength = LengthOfLastSegment;
	MOVF        SendSyncInFractionalPacket_LengthOfLastSegment_L0+0, 0 
	MOVWF       _hidWriteBuff+3 
;HidToSerial.c,289 :: 		hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0x1A;
	MOVLW       26
	MOVWF       _hidWriteBuff+4 
;HidToSerial.c,292 :: 		dataOffset = dataArrayLength * NofOfFullPacket;
	MOVF        SendSyncInFractionalPacket_dataArrayLength_L0+0, 0 
	MULWF       FARG_SendSyncInFractionalPacket_NofOfFullPacket+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
;HidToSerial.c,295 :: 		memcpy(hidWriteBuff.SyncInData_FromDevice.DataArray, (UART_String + dataOffset), hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength);
	MOVLW       _hidWriteBuff+5
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(_hidWriteBuff+5)
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       _UART_String+0
	ADDWF       R0, 0 
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(_UART_String+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_memcpy_s1+1 
	MOVF        _hidWriteBuff+1, 0 
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;HidToSerial.c,298 :: 		HID_WriteBuffer();
	CALL        _HID_WriteBuffer+0, 0
;HidToSerial.c,299 :: 		}
L_end_SendSyncInFractionalPacket:
	RETURN      0
; end of _SendSyncInFractionalPacket

_SendSyncInErrorPacket:

;HidToSerial.c,301 :: 		void SendSyncInErrorPacket()
;HidToSerial.c,303 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,304 :: 		hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
	MOVLW       4
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,308 :: 		hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = 0;
	CLRF        _hidWriteBuff+1 
;HidToSerial.c,309 :: 		hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = 0;
	CLRF        _hidWriteBuff+2 
;HidToSerial.c,310 :: 		hidWriteBuff.SyncInData_FromDevice.LastPacketLength = 0;
	CLRF        _hidWriteBuff+3 
;HidToSerial.c,311 :: 		hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0;
	CLRF        _hidWriteBuff+4 
;HidToSerial.c,314 :: 		HID_WriteBuffer();
	CALL        _HID_WriteBuffer+0, 0
;HidToSerial.c,315 :: 		}
L_end_SendSyncInErrorPacket:
	RETURN      0
; end of _SendSyncInErrorPacket

_WriteSyncOutSegmentToUart:

;HidToSerial.c,317 :: 		void WriteSyncOutSegmentToUart()
;HidToSerial.c,320 :: 		unsigned char devAck = 0;
;HidToSerial.c,323 :: 		for(i = 0; i < hidReadBuff.SyncOutData_FromHost.ThisSegmentDataLength; i++)
	CLRF        WriteSyncOutSegmentToUart_i_L0+0 
L_WriteSyncOutSegmentToUart38:
	MOVF        _hidReadBuff+1, 0 
	SUBWF       WriteSyncOutSegmentToUart_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteSyncOutSegmentToUart39
;HidToSerial.c,325 :: 		UART_WriteByte(hidReadBuff.SyncOutData_FromHost.DataArray[i]);
	MOVLW       _hidReadBuff+6
	MOVWF       FSR0 
	MOVLW       hi_addr(_hidReadBuff+6)
	MOVWF       FSR0H 
	MOVF        WriteSyncOutSegmentToUart_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART_WriteByte_DataByte+0 
	CALL        _UART_WriteByte+0, 0
;HidToSerial.c,323 :: 		for(i = 0; i < hidReadBuff.SyncOutData_FromHost.ThisSegmentDataLength; i++)
	INCF        WriteSyncOutSegmentToUart_i_L0+0, 1 
;HidToSerial.c,326 :: 		}
	GOTO        L_WriteSyncOutSegmentToUart38
L_WriteSyncOutSegmentToUart39:
;HidToSerial.c,328 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,330 :: 		hidWriteBuff.SyncOutAck_FromDevice.TransmisionType = SYNC_OUT_ACK_FROM_DEVICE;
	MOVLW       3
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,332 :: 		hidWriteBuff.SyncOutAck_FromDevice.DeviceAckByte = devAck;
	MOVF        _hidReadBuff+5, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,333 :: 		HID_WriteBuffer();
	CALL        _HID_WriteBuffer+0, 0
;HidToSerial.c,334 :: 		}
L_end_WriteSyncOutSegmentToUart:
	RETURN      0
; end of _WriteSyncOutSegmentToUart

_WaitForHidData:

;HidToSerial.c,338 :: 		unsigned char WaitForHidData()
;HidToSerial.c,342 :: 		TimeOut = SYNC_OUT_TIMEOUT;
	MOVLW       136
	MOVWF       WaitForHidData_TimeOut_L0+0 
	MOVLW       19
	MOVWF       WaitForHidData_TimeOut_L0+1 
;HidToSerial.c,343 :: 		while(!UsbNewPacketReceived)
L_WaitForHidData41:
	MOVF        _UsbNewPacketReceived+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_WaitForHidData42
;HidToSerial.c,345 :: 		TimeOut--;
	MOVLW       1
	SUBWF       WaitForHidData_TimeOut_L0+0, 1 
	MOVLW       0
	SUBWFB      WaitForHidData_TimeOut_L0+1, 1 
;HidToSerial.c,346 :: 		if(TimeOut == 0)
	MOVLW       0
	XORWF       WaitForHidData_TimeOut_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WaitForHidData74
	MOVLW       0
	XORWF       WaitForHidData_TimeOut_L0+0, 0 
L__WaitForHidData74:
	BTFSS       STATUS+0, 2 
	GOTO        L_WaitForHidData43
;HidToSerial.c,348 :: 		return 0x01;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_WaitForHidData
;HidToSerial.c,349 :: 		}
L_WaitForHidData43:
;HidToSerial.c,350 :: 		Delay_1ms();
	CALL        _Delay_1ms+0, 0
;HidToSerial.c,351 :: 		}
	GOTO        L_WaitForHidData41
L_WaitForHidData42:
;HidToSerial.c,353 :: 		return 0;
	CLRF        R0 
;HidToSerial.c,354 :: 		}
L_end_WaitForHidData:
	RETURN      0
; end of _WaitForHidData

_WaitForUartData:

;HidToSerial.c,359 :: 		unsigned char WaitForUartData(unsigned int Length, unsigned int TimeOut)
;HidToSerial.c,363 :: 		for(i = 0; i < TimeOut; i++)
	CLRF        WaitForUartData_i_L0+0 
	CLRF        WaitForUartData_i_L0+1 
L_WaitForUartData44:
	MOVF        FARG_WaitForUartData_TimeOut+1, 0 
	SUBWF       WaitForUartData_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WaitForUartData76
	MOVF        FARG_WaitForUartData_TimeOut+0, 0 
	SUBWF       WaitForUartData_i_L0+0, 0 
L__WaitForUartData76:
	BTFSC       STATUS+0, 0 
	GOTO        L_WaitForUartData45
;HidToSerial.c,365 :: 		if(Length > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        FARG_WaitForUartData_Length+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WaitForUartData77
	MOVF        FARG_WaitForUartData_Length+0, 0 
	SUBLW       0
L__WaitForUartData77:
	BTFSC       STATUS+0, 0 
	GOTO        L_WaitForUartData47
;HidToSerial.c,367 :: 		if(UART_Counter >= Length)
	MOVF        FARG_WaitForUartData_Length+1, 0 
	SUBWF       _UART_Counter+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WaitForUartData78
	MOVF        FARG_WaitForUartData_Length+0, 0 
	SUBWF       _UART_Counter+0, 0 
L__WaitForUartData78:
	BTFSS       STATUS+0, 0 
	GOTO        L_WaitForUartData48
;HidToSerial.c,369 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_WaitForUartData
;HidToSerial.c,370 :: 		}
L_WaitForUartData48:
;HidToSerial.c,371 :: 		}
L_WaitForUartData47:
;HidToSerial.c,372 :: 		Delay_1ms();
	CALL        _Delay_1ms+0, 0
;HidToSerial.c,363 :: 		for(i = 0; i < TimeOut; i++)
	INFSNZ      WaitForUartData_i_L0+0, 1 
	INCF        WaitForUartData_i_L0+1, 1 
;HidToSerial.c,373 :: 		}
	GOTO        L_WaitForUartData44
L_WaitForUartData45:
;HidToSerial.c,376 :: 		if(UART_Counter > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        _UART_Counter+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WaitForUartData79
	MOVF        _UART_Counter+0, 0 
	SUBLW       0
L__WaitForUartData79:
	BTFSC       STATUS+0, 0 
	GOTO        L_WaitForUartData49
;HidToSerial.c,378 :: 		return 0x02;
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_WaitForUartData
;HidToSerial.c,379 :: 		}
L_WaitForUartData49:
;HidToSerial.c,382 :: 		return 0x01;
	MOVLW       1
	MOVWF       R0 
;HidToSerial.c,383 :: 		}
L_end_WaitForUartData:
	RETURN      0
; end of _WaitForUartData

_CheckSyncInAckFromHost:

;HidToSerial.c,389 :: 		unsigned char CheckSyncInAckFromHost(unsigned char ExpectedAckByte)
;HidToSerial.c,394 :: 		TimeOut = SYNC_IN_TIMEOUT;
	MOVLW       136
	MOVWF       CheckSyncInAckFromHost_TimeOut_L0+0 
	MOVLW       19
	MOVWF       CheckSyncInAckFromHost_TimeOut_L0+1 
;HidToSerial.c,395 :: 		while(!UsbNewPacketReceived)
L_CheckSyncInAckFromHost50:
	MOVF        _UsbNewPacketReceived+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckSyncInAckFromHost51
;HidToSerial.c,397 :: 		TimeOut--;
	MOVLW       1
	SUBWF       CheckSyncInAckFromHost_TimeOut_L0+0, 1 
	MOVLW       0
	SUBWFB      CheckSyncInAckFromHost_TimeOut_L0+1, 1 
;HidToSerial.c,398 :: 		if(TimeOut == 0)
	MOVLW       0
	XORWF       CheckSyncInAckFromHost_TimeOut_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckSyncInAckFromHost81
	MOVLW       0
	XORWF       CheckSyncInAckFromHost_TimeOut_L0+0, 0 
L__CheckSyncInAckFromHost81:
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckSyncInAckFromHost52
;HidToSerial.c,400 :: 		return 0x01;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_CheckSyncInAckFromHost
;HidToSerial.c,401 :: 		}
L_CheckSyncInAckFromHost52:
;HidToSerial.c,402 :: 		Delay_1ms();
	CALL        _Delay_1ms+0, 0
;HidToSerial.c,403 :: 		}
	GOTO        L_CheckSyncInAckFromHost50
L_CheckSyncInAckFromHost51:
;HidToSerial.c,405 :: 		if(hidReadBuff.TransmisionType == SYNC_IN_ACK_FROM_HOST)
	MOVF        _hidReadBuff+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckSyncInAckFromHost53
;HidToSerial.c,407 :: 		if(hidReadBuff.SyncInAck_FromHost.HostAckByte == ExpectedAckByte)
	MOVF        _hidReadBuff+1, 0 
	XORWF       FARG_CheckSyncInAckFromHost_ExpectedAckByte+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckSyncInAckFromHost54
;HidToSerial.c,409 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_CheckSyncInAckFromHost
;HidToSerial.c,410 :: 		}
L_CheckSyncInAckFromHost54:
;HidToSerial.c,411 :: 		return 0x02;
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_CheckSyncInAckFromHost
;HidToSerial.c,412 :: 		}
L_CheckSyncInAckFromHost53:
;HidToSerial.c,414 :: 		return 0x03;
	MOVLW       3
	MOVWF       R0 
;HidToSerial.c,415 :: 		}
L_end_CheckSyncInAckFromHost:
	RETURN      0
; end of _CheckSyncInAckFromHost

_ClearHidWriteBuffer:

;HidToSerial.c,417 :: 		void ClearHidWriteBuffer()
;HidToSerial.c,420 :: 		for(i = 0; i < sizeof(hidWriteBuff.Raw.bytes); i++)
	CLRF        R1 
L_ClearHidWriteBuffer55:
	MOVLW       64
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ClearHidWriteBuffer56
;HidToSerial.c,422 :: 		hidWriteBuff.Raw.bytes[i] = 0;
	MOVLW       _hidWriteBuff+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FSR1H 
	MOVF        R1, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
;HidToSerial.c,420 :: 		for(i = 0; i < sizeof(hidWriteBuff.Raw.bytes); i++)
	INCF        R1, 1 
;HidToSerial.c,423 :: 		}
	GOTO        L_ClearHidWriteBuffer55
L_ClearHidWriteBuffer56:
;HidToSerial.c,424 :: 		}
L_end_ClearHidWriteBuffer:
	RETURN      0
; end of _ClearHidWriteBuffer
