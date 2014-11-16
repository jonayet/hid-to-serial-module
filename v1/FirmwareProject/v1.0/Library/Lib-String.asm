
_GetString:

;Lib-String.c,3 :: 		void GetString(char* Destination, const char* ConstString)
;Lib-String.c,5 :: 		while(1)
L_GetString0:
;Lib-String.c,7 :: 		*Destination = *ConstString;
	MOVF        FARG_GetString_ConstString+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_GetString_ConstString+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_GetString_ConstString+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVFF       FARG_GetString_Destination+0, FSR1
	MOVFF       FARG_GetString_Destination+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Lib-String.c,8 :: 		if(*Destination == 0) { return; }
	MOVFF       FARG_GetString_Destination+0, FSR0
	MOVFF       FARG_GetString_Destination+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_GetString2
	GOTO        L_end_GetString
L_GetString2:
;Lib-String.c,9 :: 		Destination++;
	INFSNZ      FARG_GetString_Destination+0, 1 
	INCF        FARG_GetString_Destination+1, 1 
;Lib-String.c,10 :: 		ConstString++;
	MOVLW       1
	ADDWF       FARG_GetString_ConstString+0, 1 
	MOVLW       0
	ADDWFC      FARG_GetString_ConstString+1, 1 
	ADDWFC      FARG_GetString_ConstString+2, 1 
;Lib-String.c,11 :: 		}
	GOTO        L_GetString0
;Lib-String.c,12 :: 		}
L_end_GetString:
	RETURN      0
; end of _GetString

_StrToByte:

;Lib-String.c,15 :: 		unsigned char StrToByte(char* Source, char Length)
;Lib-String.c,17 :: 		char num = 0, count = 0;
	CLRF        StrToByte_num_L0+0 
	CLRF        StrToByte_count_L0+0 
;Lib-String.c,18 :: 		while(1)
L_StrToByte3:
;Lib-String.c,20 :: 		if(*Source >= '0' && *Source <= '9')
	MOVFF       FARG_StrToByte_Source+0, FSR0
	MOVFF       FARG_StrToByte_Source+1, FSR0H
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_StrToByte7
	MOVFF       FARG_StrToByte_Source+0, FSR0
	MOVFF       FARG_StrToByte_Source+1, FSR0H
	MOVF        POSTINC0+0, 0 
	SUBLW       57
	BTFSS       STATUS+0, 0 
	GOTO        L_StrToByte7
L__StrToByte16:
;Lib-String.c,22 :: 		count++;
	INCF        StrToByte_count_L0+0, 1 
;Lib-String.c,23 :: 		if(count == 1) { num = *Source - '0'; } else { num = (num * 10) + (*Source - '0'); }
	MOVF        StrToByte_count_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_StrToByte8
	MOVFF       FARG_StrToByte_Source+0, FSR0
	MOVFF       FARG_StrToByte_Source+1, FSR0H
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       StrToByte_num_L0+0 
	GOTO        L_StrToByte9
L_StrToByte8:
	MOVLW       10
	MULWF       StrToByte_num_L0+0 
	MOVF        PRODL+0, 0 
	MOVWF       StrToByte_num_L0+0 
	MOVFF       FARG_StrToByte_Source+0, FSR0
	MOVFF       FARG_StrToByte_Source+1, FSR0H
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       StrToByte_num_L0+0, 1 
L_StrToByte9:
;Lib-String.c,24 :: 		if(count == 3) { return num; }
	MOVF        StrToByte_count_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_StrToByte10
	MOVF        StrToByte_num_L0+0, 0 
	MOVWF       R0 
	GOTO        L_end_StrToByte
L_StrToByte10:
;Lib-String.c,25 :: 		}
L_StrToByte7:
;Lib-String.c,26 :: 		Source++;
	INFSNZ      FARG_StrToByte_Source+0, 1 
	INCF        FARG_StrToByte_Source+1, 1 
;Lib-String.c,27 :: 		length--;
	DECF        FARG_StrToByte_Length+0, 1 
;Lib-String.c,28 :: 		if(Length == 0) { return num; }
	MOVF        FARG_StrToByte_Length+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_StrToByte11
	MOVF        StrToByte_num_L0+0, 0 
	MOVWF       R0 
	GOTO        L_end_StrToByte
L_StrToByte11:
;Lib-String.c,29 :: 		}
	GOTO        L_StrToByte3
;Lib-String.c,30 :: 		}
L_end_StrToByte:
	RETURN      0
; end of _StrToByte

_GetStringLength:

;Lib-String.c,32 :: 		uint16 GetStringLength(char* String)
;Lib-String.c,34 :: 		uint16 i = 0;
	CLRF        GetStringLength_i_L0+0 
	CLRF        GetStringLength_i_L0+1 
;Lib-String.c,36 :: 		while(*String) { i++; String++; }
L_GetStringLength12:
	MOVFF       FARG_GetStringLength_String+0, FSR0
	MOVFF       FARG_GetStringLength_String+1, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GetStringLength13
	INFSNZ      GetStringLength_i_L0+0, 1 
	INCF        GetStringLength_i_L0+1, 1 
	INFSNZ      FARG_GetStringLength_String+0, 1 
	INCF        FARG_GetStringLength_String+1, 1 
	GOTO        L_GetStringLength12
L_GetStringLength13:
;Lib-String.c,37 :: 		return i;
	MOVF        GetStringLength_i_L0+0, 0 
	MOVWF       R0 
	MOVF        GetStringLength_i_L0+1, 0 
	MOVWF       R1 
;Lib-String.c,38 :: 		}
L_end_GetStringLength:
	RETURN      0
; end of _GetStringLength

_GetConstStringLength:

;Lib-String.c,40 :: 		uint16 GetConstStringLength(const char* String)
;Lib-String.c,42 :: 		uint16 i = 0;
	CLRF        GetConstStringLength_i_L0+0 
	CLRF        GetConstStringLength_i_L0+1 
;Lib-String.c,44 :: 		while(*String) { i++; String++; }
L_GetConstStringLength14:
	MOVF        FARG_GetConstStringLength_String+0, 0 
	MOVWF       TBLPTRL 
	MOVF        FARG_GetConstStringLength_String+1, 0 
	MOVWF       TBLPTRH 
	MOVF        FARG_GetConstStringLength_String+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GetConstStringLength15
	INFSNZ      GetConstStringLength_i_L0+0, 1 
	INCF        GetConstStringLength_i_L0+1, 1 
	MOVLW       1
	ADDWF       FARG_GetConstStringLength_String+0, 1 
	MOVLW       0
	ADDWFC      FARG_GetConstStringLength_String+1, 1 
	ADDWFC      FARG_GetConstStringLength_String+2, 1 
	GOTO        L_GetConstStringLength14
L_GetConstStringLength15:
;Lib-String.c,45 :: 		return i;
	MOVF        GetConstStringLength_i_L0+0, 0 
	MOVWF       R0 
	MOVF        GetConstStringLength_i_L0+1, 0 
	MOVWF       R1 
;Lib-String.c,46 :: 		}
L_end_GetConstStringLength:
	RETURN      0
; end of _GetConstStringLength
