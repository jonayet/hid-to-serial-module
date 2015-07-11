
_SetUartBaudrate:

;HidToSerial.c,18 :: 		void SetUartBaudrate(unsigned char BaudrateIndex)
;HidToSerial.c,20 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,21 :: 		hidWriteBuff.BaudRateResponse_FromDevice.TransmisionType = BAUDRATE_RESP_FROM_DEVICE;
	MOVLW       1
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,22 :: 		switch(BaudrateIndex)
	GOTO        L_SetUartBaudrate0
;HidToSerial.c,24 :: 		case 1:
L_SetUartBaudrate2:
;HidToSerial.c,25 :: 		UART1_Init(1200);
	BSF         BAUDCON+0, 3, 0
	MOVLW       26
	MOVWF       SPBRGH+0 
	MOVLW       10
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,26 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 1200");
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
;HidToSerial.c,27 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,28 :: 		case 2:
L_SetUartBaudrate3:
;HidToSerial.c,29 :: 		UART1_Init(2400);
	BSF         BAUDCON+0, 3, 0
	MOVLW       13
	MOVWF       SPBRGH+0 
	MOVLW       4
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,30 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 2400");
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
;HidToSerial.c,31 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,32 :: 		case 4:
L_SetUartBaudrate4:
;HidToSerial.c,33 :: 		UART1_Init(4800);
	BSF         BAUDCON+0, 3, 0
	MOVLW       6
	MOVWF       SPBRGH+0 
	MOVLW       130
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,34 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 4800");
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
;HidToSerial.c,35 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,36 :: 		case 9:
L_SetUartBaudrate5:
;HidToSerial.c,37 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       3
	MOVWF       SPBRGH+0 
	MOVLW       64
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,38 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 9600");
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
;HidToSerial.c,39 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,40 :: 		case 14:
L_SetUartBaudrate6:
;HidToSerial.c,41 :: 		UART1_Init(14400);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       43
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,42 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 14400");
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
;HidToSerial.c,43 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,44 :: 		case 19:
L_SetUartBaudrate7:
;HidToSerial.c,45 :: 		UART1_Init(19200);
	BSF         BAUDCON+0, 3, 0
	MOVLW       1
	MOVWF       SPBRGH+0 
	MOVLW       160
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,46 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 19200");
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
;HidToSerial.c,47 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,48 :: 		case 38:
L_SetUartBaudrate8:
;HidToSerial.c,49 :: 		UART1_Init(38400);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,50 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 38400");
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
;HidToSerial.c,51 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,52 :: 		case 56:
L_SetUartBaudrate9:
;HidToSerial.c,53 :: 		UART1_Init(56000);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       142
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,54 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 56000");
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
;HidToSerial.c,55 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,56 :: 		case 57:
L_SetUartBaudrate10:
;HidToSerial.c,57 :: 		UART1_Init(57600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       138
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,58 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 57600");
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
;HidToSerial.c,59 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,60 :: 		case 115:
L_SetUartBaudrate11:
;HidToSerial.c,61 :: 		UART1_Init(115200);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       68
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,62 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 115200");
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
;HidToSerial.c,63 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,64 :: 		case 128:
L_SetUartBaudrate12:
;HidToSerial.c,65 :: 		UART1_Init(128000);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       61
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HidToSerial.c,66 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Success : BaudRate 128000");
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
;HidToSerial.c,67 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,68 :: 		default:
L_SetUartBaudrate13:
;HidToSerial.c,69 :: 		GetString(hidWriteBuff.BaudRateResponse_FromDevice.DataArray, "Error : Unknown BaudRate Index");
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
;HidToSerial.c,70 :: 		break;
	GOTO        L_SetUartBaudrate1
;HidToSerial.c,71 :: 		}
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
;HidToSerial.c,73 :: 		while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
L_SetUartBaudrate14:
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_SetUartBaudrate15
	GOTO        L_SetUartBaudrate14
L_SetUartBaudrate15:
;HidToSerial.c,74 :: 		}
L_end_SetUartBaudrate:
	RETURN      0
; end of _SetUartBaudrate

_WriteQueryAndGetResponseFromUart:

;HidToSerial.c,76 :: 		void WriteQueryAndGetResponseFromUart()
;HidToSerial.c,82 :: 		if(hidReadBuff.SingleQuery_FromHost.Timeout > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        _hidReadBuff+4, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteQueryAndGetResponseFromUart80
	MOVF        _hidReadBuff+3, 0 
	SUBLW       0
L__WriteQueryAndGetResponseFromUart80:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteQueryAndGetResponseFromUart16
;HidToSerial.c,84 :: 		UART_StartReading();
	CALL        _UART_StartReading+0, 0
;HidToSerial.c,85 :: 		}
L_WriteQueryAndGetResponseFromUart16:
;HidToSerial.c,88 :: 		for(i = 0; i < hidReadBuff.SingleQuery_FromHost.ThisSegmentDataLength; i++)
	CLRF        WriteQueryAndGetResponseFromUart_i_L0+0 
L_WriteQueryAndGetResponseFromUart17:
	MOVF        _hidReadBuff+1, 0 
	SUBWF       WriteQueryAndGetResponseFromUart_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteQueryAndGetResponseFromUart18
;HidToSerial.c,90 :: 		UART_WriteByte(hidReadBuff.SingleQuery_FromHost.DataArray[i]);
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
;HidToSerial.c,88 :: 		for(i = 0; i < hidReadBuff.SingleQuery_FromHost.ThisSegmentDataLength; i++)
	INCF        WriteQueryAndGetResponseFromUart_i_L0+0, 1 
;HidToSerial.c,91 :: 		}
	GOTO        L_WriteQueryAndGetResponseFromUart17
L_WriteQueryAndGetResponseFromUart18:
;HidToSerial.c,95 :: 		if(hidReadBuff.SingleQuery_FromHost.Timeout == 0) { return; }
	MOVLW       0
	XORWF       _hidReadBuff+4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteQueryAndGetResponseFromUart81
	MOVLW       0
	XORWF       _hidReadBuff+3, 0 
L__WriteQueryAndGetResponseFromUart81:
	BTFSS       STATUS+0, 2 
	GOTO        L_WriteQueryAndGetResponseFromUart20
	GOTO        L_end_WriteQueryAndGetResponseFromUart
L_WriteQueryAndGetResponseFromUart20:
;HidToSerial.c,98 :: 		result = WaitForUartData(hidReadBuff.SingleQuery_FromHost.ExpectedDataLength, hidReadBuff.SingleQuery_FromHost.Timeout);
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
;HidToSerial.c,99 :: 		UART_StopReading();
	CALL        _UART_StopReading+0, 0
;HidToSerial.c,101 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,103 :: 		hidWriteBuff.SingleResponse_FromDevice.TransmisionType = SINGLE_RESPONSE_FROM_DEVICE;
	MOVLW       2
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,104 :: 		if(result == 0)
	MOVF        WriteQueryAndGetResponseFromUart_result_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_WriteQueryAndGetResponseFromUart21
;HidToSerial.c,106 :: 		hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength = hidReadBuff.SingleQuery_FromHost.ExpectedDataLength;
	MOVF        _hidReadBuff+2, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,107 :: 		memcpy(hidWriteBuff.SingleResponse_FromDevice.DataArray, UART_String, hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength);
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
;HidToSerial.c,108 :: 		}
	GOTO        L_WriteQueryAndGetResponseFromUart22
L_WriteQueryAndGetResponseFromUart21:
;HidToSerial.c,113 :: 		hidWriteBuff.SingleResponse_FromDevice.ThisSegmentDataLength = UART_Counter;
	MOVF        _UART_Counter+0, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,114 :: 		memcpy(hidWriteBuff.SingleResponse_FromDevice.DataArray, UART_String, UART_Counter);
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
;HidToSerial.c,115 :: 		}
L_WriteQueryAndGetResponseFromUart22:
;HidToSerial.c,118 :: 		while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
L_WriteQueryAndGetResponseFromUart23:
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_WriteQueryAndGetResponseFromUart24
	GOTO        L_WriteQueryAndGetResponseFromUart23
L_WriteQueryAndGetResponseFromUart24:
;HidToSerial.c,119 :: 		}
L_end_WriteQueryAndGetResponseFromUart:
	RETURN      0
; end of _WriteQueryAndGetResponseFromUart

_WriteSyncOutPacketsToUart:

;HidToSerial.c,121 :: 		void WriteSyncOutPacketsToUart()
;HidToSerial.c,124 :: 		WriteSyncOutSegmentToUart();
	CALL        _WriteSyncOutSegmentToUart+0, 0
;HidToSerial.c,127 :: 		while(hidReadBuff.SyncOutData_FromHost.NoOfRemainingPackets > 0)
L_WriteSyncOutPacketsToUart25:
	MOVLW       0
	MOVWF       R0 
	MOVF        _hidReadBuff+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteSyncOutPacketsToUart83
	MOVF        _hidReadBuff+2, 0 
	SUBLW       0
L__WriteSyncOutPacketsToUart83:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteSyncOutPacketsToUart26
;HidToSerial.c,130 :: 		if(WaitForHidData() != 0)
	CALL        _WaitForHidData+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_WriteSyncOutPacketsToUart27
;HidToSerial.c,132 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,133 :: 		hidWriteBuff.SyncOutAck_FromDevice.TransmisionType = SYNC_OUT_ACK_FROM_DEVICE;
	MOVLW       3
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,134 :: 		hidWriteBuff.SyncOutAck_FromDevice.DeviceAckByte = 0;
	CLRF        _hidWriteBuff+1 
;HidToSerial.c,135 :: 		while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
L_WriteSyncOutPacketsToUart28:
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_WriteSyncOutPacketsToUart29
	GOTO        L_WriteSyncOutPacketsToUart28
L_WriteSyncOutPacketsToUart29:
;HidToSerial.c,136 :: 		return;
	GOTO        L_end_WriteSyncOutPacketsToUart
;HidToSerial.c,137 :: 		}
L_WriteSyncOutPacketsToUart27:
;HidToSerial.c,139 :: 		if(hidReadBuff.TransmisionType != SYNC_OUT_DATA_FROM_HOST) { return; }
	MOVF        _hidReadBuff+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_WriteSyncOutPacketsToUart30
	GOTO        L_end_WriteSyncOutPacketsToUart
L_WriteSyncOutPacketsToUart30:
;HidToSerial.c,140 :: 		WriteSyncOutSegmentToUart();
	CALL        _WriteSyncOutSegmentToUart+0, 0
;HidToSerial.c,141 :: 		}
	GOTO        L_WriteSyncOutPacketsToUart25
L_WriteSyncOutPacketsToUart26:
;HidToSerial.c,142 :: 		}
L_end_WriteSyncOutPacketsToUart:
	RETURN      0
; end of _WriteSyncOutPacketsToUart

_SendSyncInPacketsFromUart:

;HidToSerial.c,144 :: 		void SendSyncInPacketsFromUart()
;HidToSerial.c,146 :: 		unsigned char i = 0;
	CLRF        SendSyncInPacketsFromUart_i_L0+0 
	CLRF        SendSyncInPacketsFromUart_NoOfPacket_L0+0 
	CLRF        SendSyncInPacketsFromUart_response_L0+0 
;HidToSerial.c,150 :: 		_StartAgain:
___SendSyncInPacketsFromUart__StartAgain:
;HidToSerial.c,153 :: 		UART_StopReading();
	CALL        _UART_StopReading+0, 0
;HidToSerial.c,156 :: 		if(UART_Counter == 0)
	MOVLW       0
	XORWF       _UART_Counter+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SendSyncInPacketsFromUart85
	MOVLW       0
	XORWF       _UART_Counter+0, 0 
L__SendSyncInPacketsFromUart85:
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInPacketsFromUart31
;HidToSerial.c,158 :: 		SendSyncInErrorPacket();
	CALL        _SendSyncInErrorPacket+0, 0
;HidToSerial.c,159 :: 		return;
	GOTO        L_end_SendSyncInPacketsFromUart
;HidToSerial.c,160 :: 		}
L_SendSyncInPacketsFromUart31:
;HidToSerial.c,163 :: 		NoOfPacket = UART_Counter / sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);;
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
;HidToSerial.c,166 :: 		for(i = 0; i < NoOfPacket; i++)
	CLRF        SendSyncInPacketsFromUart_i_L0+0 
L_SendSyncInPacketsFromUart32:
	MOVF        SendSyncInPacketsFromUart_NoOfPacket_L0+0, 0 
	SUBWF       SendSyncInPacketsFromUart_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SendSyncInPacketsFromUart33
;HidToSerial.c,168 :: 		SendSyncInFullPacket(i);
	MOVF        SendSyncInPacketsFromUart_i_L0+0, 0 
	MOVWF       FARG_SendSyncInFullPacket_dataOffset+0 
	CALL        _SendSyncInFullPacket+0, 0
;HidToSerial.c,169 :: 		response = CheckSyncInAckFromHost(hidWriteBuff.SyncInData_FromDevice.HostAckByte);
	MOVF        _hidWriteBuff+4, 0 
	MOVWF       FARG_CheckSyncInAckFromHost_ExpectedAckByte+0 
	CALL        _CheckSyncInAckFromHost+0, 0
	MOVF        R0, 0 
	MOVWF       SendSyncInPacketsFromUart_response_L0+0 
;HidToSerial.c,172 :: 		if(response == 0x03) { goto _StartAgain; }
	MOVF        R0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInPacketsFromUart35
	GOTO        ___SendSyncInPacketsFromUart__StartAgain
L_SendSyncInPacketsFromUart35:
;HidToSerial.c,175 :: 		if(response != 0)
	MOVF        SendSyncInPacketsFromUart_response_L0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_SendSyncInPacketsFromUart36
;HidToSerial.c,177 :: 		hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
	MOVLW       4
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,178 :: 		hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0;
	CLRF        _hidWriteBuff+4 
;HidToSerial.c,179 :: 		while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
L_SendSyncInPacketsFromUart37:
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInPacketsFromUart38
	GOTO        L_SendSyncInPacketsFromUart37
L_SendSyncInPacketsFromUart38:
;HidToSerial.c,180 :: 		return;
	GOTO        L_end_SendSyncInPacketsFromUart
;HidToSerial.c,181 :: 		}
L_SendSyncInPacketsFromUart36:
;HidToSerial.c,166 :: 		for(i = 0; i < NoOfPacket; i++)
	INCF        SendSyncInPacketsFromUart_i_L0+0, 1 
;HidToSerial.c,182 :: 		}
	GOTO        L_SendSyncInPacketsFromUart32
L_SendSyncInPacketsFromUart33:
;HidToSerial.c,185 :: 		SendSyncInFractionalPacket(NoOfPacket);
	MOVF        SendSyncInPacketsFromUart_NoOfPacket_L0+0, 0 
	MOVWF       FARG_SendSyncInFractionalPacket_NofOfFullPacket+0 
	CALL        _SendSyncInFractionalPacket+0, 0
;HidToSerial.c,186 :: 		}
L_end_SendSyncInPacketsFromUart:
	RETURN      0
; end of _SendSyncInPacketsFromUart

_WriteAsyncOutDataToUart:

;HidToSerial.c,188 :: 		void WriteAsyncOutDataToUart()
;HidToSerial.c,193 :: 		for(i = 0; i < hidReadBuff.AsyncOut_FromHost.ThisSegmentDataLength; i++)
	CLRF        WriteAsyncOutDataToUart_i_L0+0 
L_WriteAsyncOutDataToUart39:
	MOVF        _hidReadBuff+1, 0 
	SUBWF       WriteAsyncOutDataToUart_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteAsyncOutDataToUart40
;HidToSerial.c,195 :: 		UART_WriteByte(hidReadBuff.AsyncOut_FromHost.DataArray[i]);
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
;HidToSerial.c,193 :: 		for(i = 0; i < hidReadBuff.AsyncOut_FromHost.ThisSegmentDataLength; i++)
	INCF        WriteAsyncOutDataToUart_i_L0+0, 1 
;HidToSerial.c,196 :: 		}
	GOTO        L_WriteAsyncOutDataToUart39
L_WriteAsyncOutDataToUart40:
;HidToSerial.c,197 :: 		}
L_end_WriteAsyncOutDataToUart:
	RETURN      0
; end of _WriteAsyncOutDataToUart

_SendAsyncInSegmentFromUart:

;HidToSerial.c,199 :: 		void SendAsyncInSegmentFromUart(unsigned char FullLength)
;HidToSerial.c,201 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,204 :: 		hidWriteBuff.AsyncInData_FromDevice.TransmisionType = ASYNC_IN_DATA_FROM_DEVICE;
	MOVLW       5
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,205 :: 		if(FullLength)
	MOVF        FARG_SendAsyncInSegmentFromUart_FullLength+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SendAsyncInSegmentFromUart42
;HidToSerial.c,207 :: 		hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength = hidReadBuff.AsyncInStart_FromHost.RequiredDataLength;
	MOVF        _hidReadBuff+1, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,208 :: 		}
	GOTO        L_SendAsyncInSegmentFromUart43
L_SendAsyncInSegmentFromUart42:
;HidToSerial.c,211 :: 		hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength = UART_Counter;
	MOVF        _UART_Counter+0, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,212 :: 		}
L_SendAsyncInSegmentFromUart43:
;HidToSerial.c,215 :: 		memcpy(hidWriteBuff.AsyncInData_FromDevice.DataArray, UART_String, hidWriteBuff.AsyncInData_FromDevice.ThisSegmentDataLength);
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
;HidToSerial.c,218 :: 		while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
L_SendAsyncInSegmentFromUart44:
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_SendAsyncInSegmentFromUart45
	GOTO        L_SendAsyncInSegmentFromUart44
L_SendAsyncInSegmentFromUart45:
;HidToSerial.c,219 :: 		}
L_end_SendAsyncInSegmentFromUart:
	RETURN      0
; end of _SendAsyncInSegmentFromUart

_SendUnknownResponse:

;HidToSerial.c,221 :: 		void SendUnknownResponse()
;HidToSerial.c,223 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,226 :: 		hidWriteBuff.UnknownResponse_FromDevice.TransmisionType = UNKNOWN_FROM_DEVICE;
	MOVLW       6
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,229 :: 		GetString(hidWriteBuff.UnknownResponse_FromDevice.DataArray, "Unknown!");
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
;HidToSerial.c,232 :: 		while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
L_SendUnknownResponse46:
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_SendUnknownResponse47
	GOTO        L_SendUnknownResponse46
L_SendUnknownResponse47:
;HidToSerial.c,233 :: 		}
L_end_SendUnknownResponse:
	RETURN      0
; end of _SendUnknownResponse

_SendSyncInFullPacket:

;HidToSerial.c,235 :: 		void SendSyncInFullPacket(unsigned char PacketIndex)
;HidToSerial.c,243 :: 		dataArrayLength = sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);
	MOVLW       59
	MOVWF       SendSyncInFullPacket_dataArrayLength_L0+0 
;HidToSerial.c,244 :: 		NoOfPacket = UART_Counter / dataArrayLength;
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
;HidToSerial.c,245 :: 		LengthOfLastSegment = UART_Counter % dataArrayLength;
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
;HidToSerial.c,248 :: 		if(NoOfPacket == 0) { return; }
	MOVF        SendSyncInFullPacket_NoOfPacket_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInFullPacket48
	GOTO        L_end_SendSyncInFullPacket
L_SendSyncInFullPacket48:
;HidToSerial.c,250 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,253 :: 		hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
	MOVLW       4
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,254 :: 		hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = dataArrayLength;
	MOVF        SendSyncInFullPacket_dataArrayLength_L0+0, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,255 :: 		hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = NoOfPacket - PacketIndex - 1;
	MOVF        FARG_SendSyncInFullPacket_PacketIndex+0, 0 
	SUBWF       SendSyncInFullPacket_NoOfPacket_L0+0, 0 
	MOVWF       R0 
	DECF        R0, 1 
	MOVF        R0, 0 
	MOVWF       _hidWriteBuff+2 
;HidToSerial.c,256 :: 		hidWriteBuff.SyncInData_FromDevice.LastPacketLength = LengthOfLastSegment;
	MOVF        SendSyncInFullPacket_LengthOfLastSegment_L0+0, 0 
	MOVWF       _hidWriteBuff+3 
;HidToSerial.c,257 :: 		hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0x1A;
	MOVLW       26
	MOVWF       _hidWriteBuff+4 
;HidToSerial.c,260 :: 		dataOffset = dataArrayLength * PacketIndex;
	MOVF        SendSyncInFullPacket_dataArrayLength_L0+0, 0 
	MULWF       FARG_SendSyncInFullPacket_PacketIndex+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
;HidToSerial.c,263 :: 		memcpy(hidWriteBuff.SyncInData_FromDevice.DataArray, (UART_String + dataOffset), hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength);
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
;HidToSerial.c,266 :: 		while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
L_SendSyncInFullPacket49:
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInFullPacket50
	GOTO        L_SendSyncInFullPacket49
L_SendSyncInFullPacket50:
;HidToSerial.c,267 :: 		}
L_end_SendSyncInFullPacket:
	RETURN      0
; end of _SendSyncInFullPacket

_SendSyncInFractionalPacket:

;HidToSerial.c,269 :: 		void SendSyncInFractionalPacket(unsigned char NofOfFullPacket)
;HidToSerial.c,275 :: 		if(LengthOfLastSegment == 0) {  return; }
	MOVF        SendSyncInFractionalPacket_LengthOfLastSegment_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInFractionalPacket51
	GOTO        L_end_SendSyncInFractionalPacket
L_SendSyncInFractionalPacket51:
;HidToSerial.c,278 :: 		dataArrayLength = sizeof(hidWriteBuff.SyncInData_FromDevice.DataArray);
	MOVLW       59
	MOVWF       SendSyncInFractionalPacket_dataArrayLength_L0+0 
;HidToSerial.c,279 :: 		LengthOfLastSegment = UART_Counter % dataArrayLength;
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
;HidToSerial.c,281 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,283 :: 		hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
	MOVLW       4
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,284 :: 		hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = LengthOfLastSegment;
	MOVF        SendSyncInFractionalPacket_LengthOfLastSegment_L0+0, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,285 :: 		hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = 0;
	CLRF        _hidWriteBuff+2 
;HidToSerial.c,286 :: 		hidWriteBuff.SyncInData_FromDevice.LastPacketLength = LengthOfLastSegment;
	MOVF        SendSyncInFractionalPacket_LengthOfLastSegment_L0+0, 0 
	MOVWF       _hidWriteBuff+3 
;HidToSerial.c,287 :: 		hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0x1A;
	MOVLW       26
	MOVWF       _hidWriteBuff+4 
;HidToSerial.c,290 :: 		dataOffset = dataArrayLength * NofOfFullPacket;
	MOVF        SendSyncInFractionalPacket_dataArrayLength_L0+0, 0 
	MULWF       FARG_SendSyncInFractionalPacket_NofOfFullPacket+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
;HidToSerial.c,293 :: 		memcpy(hidWriteBuff.SyncInData_FromDevice.DataArray, (UART_String + dataOffset), hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength);
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
;HidToSerial.c,296 :: 		while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
L_SendSyncInFractionalPacket52:
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInFractionalPacket53
	GOTO        L_SendSyncInFractionalPacket52
L_SendSyncInFractionalPacket53:
;HidToSerial.c,297 :: 		}
L_end_SendSyncInFractionalPacket:
	RETURN      0
; end of _SendSyncInFractionalPacket

_SendSyncInErrorPacket:

;HidToSerial.c,299 :: 		void SendSyncInErrorPacket()
;HidToSerial.c,301 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,302 :: 		hidWriteBuff.SyncInData_FromDevice.TransmisionType = SYNC_IN_DATA_FROM_DEVICE;
	MOVLW       4
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,306 :: 		hidWriteBuff.SyncInData_FromDevice.ThisSegmentDataLength = 0;
	CLRF        _hidWriteBuff+1 
;HidToSerial.c,307 :: 		hidWriteBuff.SyncInData_FromDevice.NoOfRemainingPackets = 0;
	CLRF        _hidWriteBuff+2 
;HidToSerial.c,308 :: 		hidWriteBuff.SyncInData_FromDevice.LastPacketLength = 0;
	CLRF        _hidWriteBuff+3 
;HidToSerial.c,309 :: 		hidWriteBuff.SyncInData_FromDevice.HostAckByte = 0;
	CLRF        _hidWriteBuff+4 
;HidToSerial.c,312 :: 		while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
L_SendSyncInErrorPacket54:
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_SendSyncInErrorPacket55
	GOTO        L_SendSyncInErrorPacket54
L_SendSyncInErrorPacket55:
;HidToSerial.c,313 :: 		}
L_end_SendSyncInErrorPacket:
	RETURN      0
; end of _SendSyncInErrorPacket

_WriteSyncOutSegmentToUart:

;HidToSerial.c,315 :: 		void WriteSyncOutSegmentToUart()
;HidToSerial.c,318 :: 		unsigned char devAck = 0;
;HidToSerial.c,321 :: 		for(i = 0; i < hidReadBuff.SyncOutData_FromHost.ThisSegmentDataLength; i++)
	CLRF        WriteSyncOutSegmentToUart_i_L0+0 
L_WriteSyncOutSegmentToUart56:
	MOVF        _hidReadBuff+1, 0 
	SUBWF       WriteSyncOutSegmentToUart_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteSyncOutSegmentToUart57
;HidToSerial.c,323 :: 		UART_WriteByte(hidReadBuff.SyncOutData_FromHost.DataArray[i]);
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
;HidToSerial.c,321 :: 		for(i = 0; i < hidReadBuff.SyncOutData_FromHost.ThisSegmentDataLength; i++)
	INCF        WriteSyncOutSegmentToUart_i_L0+0, 1 
;HidToSerial.c,324 :: 		}
	GOTO        L_WriteSyncOutSegmentToUart56
L_WriteSyncOutSegmentToUart57:
;HidToSerial.c,326 :: 		ClearHidWriteBuffer();
	CALL        _ClearHidWriteBuffer+0, 0
;HidToSerial.c,328 :: 		hidWriteBuff.SyncOutAck_FromDevice.TransmisionType = SYNC_OUT_ACK_FROM_DEVICE;
	MOVLW       3
	MOVWF       _hidWriteBuff+0 
;HidToSerial.c,330 :: 		hidWriteBuff.SyncOutAck_FromDevice.DeviceAckByte = devAck;
	MOVF        _hidReadBuff+5, 0 
	MOVWF       _hidWriteBuff+1 
;HidToSerial.c,331 :: 		while(!HID_Write(&hidWriteBuff.Raw.bytes, 64)) { }
L_WriteSyncOutSegmentToUart59:
	MOVLW       _hidWriteBuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_WriteSyncOutSegmentToUart60
	GOTO        L_WriteSyncOutSegmentToUart59
L_WriteSyncOutSegmentToUart60:
;HidToSerial.c,332 :: 		}
L_end_WriteSyncOutSegmentToUart:
	RETURN      0
; end of _WriteSyncOutSegmentToUart

_WaitForHidData:

;HidToSerial.c,336 :: 		unsigned char WaitForHidData()
;HidToSerial.c,340 :: 		TimeOut = SYNC_OUT_TIMEOUT;
	MOVLW       136
	MOVWF       WaitForHidData_TimeOut_L0+0 
	MOVLW       19
	MOVWF       WaitForHidData_TimeOut_L0+1 
;HidToSerial.c,341 :: 		while(!HID_Read())
L_WaitForHidData61:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_WaitForHidData62
;HidToSerial.c,343 :: 		TimeOut--;
	MOVLW       1
	SUBWF       WaitForHidData_TimeOut_L0+0, 1 
	MOVLW       0
	SUBWFB      WaitForHidData_TimeOut_L0+1, 1 
;HidToSerial.c,344 :: 		if(TimeOut == 0)
	MOVLW       0
	XORWF       WaitForHidData_TimeOut_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WaitForHidData94
	MOVLW       0
	XORWF       WaitForHidData_TimeOut_L0+0, 0 
L__WaitForHidData94:
	BTFSS       STATUS+0, 2 
	GOTO        L_WaitForHidData63
;HidToSerial.c,346 :: 		return 0x01;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_WaitForHidData
;HidToSerial.c,347 :: 		}
L_WaitForHidData63:
;HidToSerial.c,348 :: 		Delay_1ms();
	CALL        _Delay_1ms+0, 0
;HidToSerial.c,349 :: 		}
	GOTO        L_WaitForHidData61
L_WaitForHidData62:
;HidToSerial.c,351 :: 		return 0;
	CLRF        R0 
;HidToSerial.c,352 :: 		}
L_end_WaitForHidData:
	RETURN      0
; end of _WaitForHidData

_WaitForUartData:

;HidToSerial.c,357 :: 		unsigned char WaitForUartData(unsigned int Length, unsigned int TimeOut)
;HidToSerial.c,361 :: 		for(i = 0; i < TimeOut; i++)
	CLRF        WaitForUartData_i_L0+0 
	CLRF        WaitForUartData_i_L0+1 
L_WaitForUartData64:
	MOVF        FARG_WaitForUartData_TimeOut+1, 0 
	SUBWF       WaitForUartData_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WaitForUartData96
	MOVF        FARG_WaitForUartData_TimeOut+0, 0 
	SUBWF       WaitForUartData_i_L0+0, 0 
L__WaitForUartData96:
	BTFSC       STATUS+0, 0 
	GOTO        L_WaitForUartData65
;HidToSerial.c,363 :: 		if(Length > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        FARG_WaitForUartData_Length+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WaitForUartData97
	MOVF        FARG_WaitForUartData_Length+0, 0 
	SUBLW       0
L__WaitForUartData97:
	BTFSC       STATUS+0, 0 
	GOTO        L_WaitForUartData67
;HidToSerial.c,365 :: 		if(UART_Counter >= Length)
	MOVF        FARG_WaitForUartData_Length+1, 0 
	SUBWF       _UART_Counter+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WaitForUartData98
	MOVF        FARG_WaitForUartData_Length+0, 0 
	SUBWF       _UART_Counter+0, 0 
L__WaitForUartData98:
	BTFSS       STATUS+0, 0 
	GOTO        L_WaitForUartData68
;HidToSerial.c,367 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_WaitForUartData
;HidToSerial.c,368 :: 		}
L_WaitForUartData68:
;HidToSerial.c,369 :: 		}
L_WaitForUartData67:
;HidToSerial.c,370 :: 		Delay_1ms();
	CALL        _Delay_1ms+0, 0
;HidToSerial.c,361 :: 		for(i = 0; i < TimeOut; i++)
	INFSNZ      WaitForUartData_i_L0+0, 1 
	INCF        WaitForUartData_i_L0+1, 1 
;HidToSerial.c,371 :: 		}
	GOTO        L_WaitForUartData64
L_WaitForUartData65:
;HidToSerial.c,374 :: 		if(UART_Counter > 0)
	MOVLW       0
	MOVWF       R0 
	MOVF        _UART_Counter+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WaitForUartData99
	MOVF        _UART_Counter+0, 0 
	SUBLW       0
L__WaitForUartData99:
	BTFSC       STATUS+0, 0 
	GOTO        L_WaitForUartData69
;HidToSerial.c,376 :: 		return 0x02;
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_WaitForUartData
;HidToSerial.c,377 :: 		}
L_WaitForUartData69:
;HidToSerial.c,380 :: 		return 0x01;
	MOVLW       1
	MOVWF       R0 
;HidToSerial.c,381 :: 		}
L_end_WaitForUartData:
	RETURN      0
; end of _WaitForUartData

_CheckSyncInAckFromHost:

;HidToSerial.c,387 :: 		unsigned char CheckSyncInAckFromHost(unsigned char ExpectedAckByte)
;HidToSerial.c,392 :: 		TimeOut = SYNC_IN_TIMEOUT;
	MOVLW       136
	MOVWF       CheckSyncInAckFromHost_TimeOut_L0+0 
	MOVLW       19
	MOVWF       CheckSyncInAckFromHost_TimeOut_L0+1 
;HidToSerial.c,393 :: 		while(!HID_Read())
L_CheckSyncInAckFromHost70:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckSyncInAckFromHost71
;HidToSerial.c,395 :: 		TimeOut--;
	MOVLW       1
	SUBWF       CheckSyncInAckFromHost_TimeOut_L0+0, 1 
	MOVLW       0
	SUBWFB      CheckSyncInAckFromHost_TimeOut_L0+1, 1 
;HidToSerial.c,396 :: 		if(TimeOut == 0)
	MOVLW       0
	XORWF       CheckSyncInAckFromHost_TimeOut_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckSyncInAckFromHost101
	MOVLW       0
	XORWF       CheckSyncInAckFromHost_TimeOut_L0+0, 0 
L__CheckSyncInAckFromHost101:
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckSyncInAckFromHost72
;HidToSerial.c,398 :: 		return 0x01;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_CheckSyncInAckFromHost
;HidToSerial.c,399 :: 		}
L_CheckSyncInAckFromHost72:
;HidToSerial.c,400 :: 		Delay_1ms();
	CALL        _Delay_1ms+0, 0
;HidToSerial.c,401 :: 		}
	GOTO        L_CheckSyncInAckFromHost70
L_CheckSyncInAckFromHost71:
;HidToSerial.c,403 :: 		if(hidReadBuff.TransmisionType == SYNC_IN_ACK_FROM_HOST)
	MOVF        _hidReadBuff+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckSyncInAckFromHost73
;HidToSerial.c,405 :: 		if(hidReadBuff.SyncInAck_FromHost.HostAckByte == ExpectedAckByte)
	MOVF        _hidReadBuff+1, 0 
	XORWF       FARG_CheckSyncInAckFromHost_ExpectedAckByte+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckSyncInAckFromHost74
;HidToSerial.c,407 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_CheckSyncInAckFromHost
;HidToSerial.c,408 :: 		}
L_CheckSyncInAckFromHost74:
;HidToSerial.c,409 :: 		return 0x02;
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_CheckSyncInAckFromHost
;HidToSerial.c,410 :: 		}
L_CheckSyncInAckFromHost73:
;HidToSerial.c,412 :: 		return 0x03;
	MOVLW       3
	MOVWF       R0 
;HidToSerial.c,413 :: 		}
L_end_CheckSyncInAckFromHost:
	RETURN      0
; end of _CheckSyncInAckFromHost

_ClearHidWriteBuffer:

;HidToSerial.c,415 :: 		void ClearHidWriteBuffer()
;HidToSerial.c,418 :: 		for(i = 0; i < sizeof(hidWriteBuff.Raw.bytes); i++)
	CLRF        R1 
L_ClearHidWriteBuffer75:
	MOVLW       64
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ClearHidWriteBuffer76
;HidToSerial.c,420 :: 		hidWriteBuff.Raw.bytes[i] = 0;
	MOVLW       _hidWriteBuff+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_hidWriteBuff+0)
	MOVWF       FSR1H 
	MOVF        R1, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
;HidToSerial.c,418 :: 		for(i = 0; i < sizeof(hidWriteBuff.Raw.bytes); i++)
	INCF        R1, 1 
;HidToSerial.c,421 :: 		}
	GOTO        L_ClearHidWriteBuffer75
L_ClearHidWriteBuffer76:
;HidToSerial.c,422 :: 		}
L_end_ClearHidWriteBuffer:
	RETURN      0
; end of _ClearHidWriteBuffer
