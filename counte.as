opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F684
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_System_init
	FNCALL	_main,_GPIO_Init
	FNCALL	_main,_printTM1617
	FNCALL	_main,_isKeyPressed
	FNCALL	_main,_Delay_xms
	FNCALL	_main,_resetCounter
	FNCALL	_main,_checkCounter
	FNCALL	_main,_getCounter
	FNCALL	_main,_sprintf
	FNCALL	_checkCounter,_Delay_xms
	FNCALL	_checkCounter,_doCount
	FNCALL	_printTM1617,_encodeTM1617
	FNCALL	_printTM1617,_DisplayTM1617
	FNCALL	_DisplayTM1617,_WriteTM1617
	FNCALL	_sprintf,_isdigit
	FNCALL	_sprintf,___wmul
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_dpowers
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
	line	350
_dpowers:
	retlw	01h
	retlw	0

	retlw	0Ah
	retlw	0

	retlw	064h
	retlw	0

	retlw	0E8h
	retlw	03h

	retlw	010h
	retlw	027h

	global	_dpowers
	global	_lastValue
	global	_localCounter
	global	_value
	global	my_itoa@s
	global	_buffer
	global	_FSR
_FSR	set	4
	DABS	1,4,1	;_FSR

	global	_INDF
_INDF	set	0
	DABS	1,0,1	;_INDF

	global	_PCL
_PCL	set	2
	DABS	1,2,1	;_PCL

	global	_PCLATH
_PCLATH	set	10
	DABS	1,10,1	;_PCLATH

	global	_PORTA
_PORTA	set	5
	DABS	1,5,1	;_PORTA

	global	_SFR06
_SFR06	set	6
	DABS	1,6,1	;_SFR06

	global	_SFR07
_SFR07	set	7
	DABS	1,7,1	;_SFR07

	global	_SFR08
_SFR08	set	8
	DABS	1,8,1	;_SFR08

	global	_SFR09
_SFR09	set	9
	DABS	1,9,1	;_SFR09

	global	_STATUS
_STATUS	set	3
	DABS	1,3,1	;_STATUS

	global	_TMR0
_TMR0	set	1
	DABS	1,1,1	;_TMR0

	global	_CCPR1
_CCPR1	set	19
	DABS	1,19,2	;_CCPR1

	global	_TMR1
_TMR1	set	14
	DABS	1,14,2	;_TMR1

	global	_ADCON0
_ADCON0	set	31
	DABS	1,31,1	;_ADCON0

	global	_ADRESH
_ADRESH	set	30
	DABS	1,30,1	;_ADRESH

	global	_CCP1CON
_CCP1CON	set	21
	DABS	1,21,1	;_CCP1CON

	global	_CCPR1H
_CCPR1H	set	20
	DABS	1,20,1	;_CCPR1H

	global	_CCPR1L
_CCPR1L	set	19
	DABS	1,19,1	;_CCPR1L

	global	_CMCON0
_CMCON0	set	25
	DABS	1,25,1	;_CMCON0

	global	_CMCON1
_CMCON1	set	26
	DABS	1,26,1	;_CMCON1

	global	_ECCPAS
_ECCPAS	set	23
	DABS	1,23,1	;_ECCPAS

	global	_INTCONbits
_INTCONbits	set	11
	DABS	1,11,1	;_INTCONbits

	global	_MSCKCONbits
_MSCKCONbits	set	27
	DABS	1,27,1	;_MSCKCONbits

	global	_PCLATHbits
_PCLATHbits	set	10
	DABS	1,10,1	;_PCLATHbits

	global	_PIR1bits
_PIR1bits	set	12
	DABS	1,12,1	;_PIR1bits

	global	_PORTAbits
_PORTAbits	set	5
	DABS	1,5,1	;_PORTAbits

	global	_PORTC
_PORTC	set	7
	DABS	1,7,1	;_PORTC

	global	_PWM1CON
_PWM1CON	set	22
	DABS	1,22,1	;_PWM1CON

	global	_SFR00
_SFR00	set	0
	DABS	1,0,1	;_SFR00

	global	_SFR01
_SFR01	set	1
	DABS	1,1,1	;_SFR01

	global	_SFR02
_SFR02	set	2
	DABS	1,2,1	;_SFR02

	global	_SFR03
_SFR03	set	3
	DABS	1,3,1	;_SFR03

	global	_SFR04
_SFR04	set	4
	DABS	1,4,1	;_SFR04

	global	_SFR05
_SFR05	set	5
	DABS	1,5,1	;_SFR05

	global	_SFR0A
_SFR0A	set	10
	DABS	1,10,1	;_SFR0A

	global	_SFR0B
_SFR0B	set	11
	DABS	1,11,1	;_SFR0B

	global	_SFR0C
_SFR0C	set	12
	DABS	1,12,1	;_SFR0C

	global	_SFR11
_SFR11	set	17
	DABS	1,17,1	;_SFR11

	global	_SFR12
_SFR12	set	18
	DABS	1,18,1	;_SFR12

	global	_SFR18
_SFR18	set	24
	DABS	1,24,1	;_SFR18

	global	_SFR1B
_SFR1B	set	27
	DABS	1,27,1	;_SFR1B

	global	_SFR1C
_SFR1C	set	28
	DABS	1,28,1	;_SFR1C

	global	_SFR1D
_SFR1D	set	29
	DABS	1,29,1	;_SFR1D

	global	_SOSCPRHbits
_SOSCPRHbits	set	29
	DABS	1,29,1	;_SOSCPRHbits

	global	_STATUSbits
_STATUSbits	set	3
	DABS	1,3,1	;_STATUSbits

	global	_T1CON
_T1CON	set	16
	DABS	1,16,1	;_T1CON

	global	_T2CONbits
_T2CONbits	set	18
	DABS	1,18,1	;_T2CONbits

	global	_TMR1H
_TMR1H	set	15
	DABS	1,15,1	;_TMR1H

	global	_TMR1L
_TMR1L	set	14
	DABS	1,14,1	;_TMR1L

	global	_WDTCONbits
_WDTCONbits	set	24
	DABS	1,24,1	;_WDTCONbits

	global	_ADFM
_ADFM	set	255
	DABS	1,31,1	;_ADFM

	global	_ADIF
_ADIF	set	102
	DABS	1,12,1	;_ADIF

	global	_ADON
_ADON	set	248
	DABS	1,31,1	;_ADON

	global	_C
_C	set	24
	DABS	1,3,1	;_C

	global	_C1IF
_C1IF	set	99
	DABS	1,12,1	;_C1IF

	global	_C1INV
_C1INV	set	204
	DABS	1,25,1	;_C1INV

	global	_C1OUT
_C1OUT	set	206
	DABS	1,25,1	;_C1OUT

	global	_C2IF
_C2IF	set	100
	DABS	1,12,1	;_C2IF

	global	_C2INV
_C2INV	set	205
	DABS	1,25,1	;_C2INV

	global	_C2OUT
_C2OUT	set	207
	DABS	1,25,1	;_C2OUT

	global	_C2SYNC
_C2SYNC	set	208
	DABS	1,26,1	;_C2SYNC

	global	_CARRY
_CARRY	set	24
	DABS	1,3,1	;_CARRY

	global	_CCP1IF
_CCP1IF	set	101
	DABS	1,12,1	;_CCP1IF

	global	_CCP1M0
_CCP1M0	set	168
	DABS	1,21,1	;_CCP1M0

	global	_CCP1M1
_CCP1M1	set	169
	DABS	1,21,1	;_CCP1M1

	global	_CCP1M2
_CCP1M2	set	170
	DABS	1,21,1	;_CCP1M2

	global	_CCP1M3
_CCP1M3	set	171
	DABS	1,21,1	;_CCP1M3

	global	_CHS0
_CHS0	set	250
	DABS	1,31,1	;_CHS0

	global	_CHS1
_CHS1	set	251
	DABS	1,31,1	;_CHS1

	global	_CHS2
_CHS2	set	252
	DABS	1,31,1	;_CHS2

	global	_CIS
_CIS	set	203
	DABS	1,25,1	;_CIS

	global	_CKCNTI
_CKCNTI	set	217
	DABS	1,27,1	;_CKCNTI

	global	_CKMAVG
_CKMAVG	set	218
	DABS	1,27,1	;_CKMAVG

	global	_CKMEAIF
_CKMEAIF	set	102
	DABS	1,12,1	;_CKMEAIF

	global	_CM0
_CM0	set	200
	DABS	1,25,1	;_CM0

	global	_CM1
_CM1	set	201
	DABS	1,25,1	;_CM1

	global	_CM2
_CM2	set	202
	DABS	1,25,1	;_CM2

	global	_DC
_DC	set	25
	DABS	1,3,1	;_DC

	global	_DC1B0
_DC1B0	set	172
	DABS	1,21,1	;_DC1B0

	global	_DC1B1
_DC1B1	set	173
	DABS	1,21,1	;_DC1B1

	global	_ECCPAS0
_ECCPAS0	set	188
	DABS	1,23,1	;_ECCPAS0

	global	_ECCPAS1
_ECCPAS1	set	189
	DABS	1,23,1	;_ECCPAS1

	global	_ECCPAS2
_ECCPAS2	set	190
	DABS	1,23,1	;_ECCPAS2

	global	_ECCPASE
_ECCPASE	set	191
	DABS	1,23,1	;_ECCPASE

	global	_ECCPIF
_ECCPIF	set	101
	DABS	1,12,1	;_ECCPIF

	global	_EEIF
_EEIF	set	103
	DABS	1,12,1	;_EEIF

	global	_GIE
_GIE	set	95
	DABS	1,11,1	;_GIE

	global	_GO
_GO	set	249
	DABS	1,31,1	;_GO

	global	_GO_DONE
_GO_DONE	set	249
	DABS	1,31,1	;_GO_DONE

	global	_GO_nDONE
_GO_nDONE	set	249
	DABS	1,31,1	;_GO_nDONE

	global	_HC
_HC	set	25
	DABS	1,3,1	;_HC

	global	_INTE
_INTE	set	92
	DABS	1,11,1	;_INTE

	global	_INTF
_INTF	set	89
	DABS	1,11,1	;_INTF

	global	_IRP
_IRP	set	31
	DABS	1,3,1	;_IRP

	global	_OSFIF
_OSFIF	set	98
	DABS	1,12,1	;_OSFIF

	global	_P1M0
_P1M0	set	174
	DABS	1,21,1	;_P1M0

	global	_P1M1
_P1M1	set	175
	DABS	1,21,1	;_P1M1

	global	_PA0
_PA0	set	40
	DABS	1,5,1	;_PA0

	global	_PA1
_PA1	set	41
	DABS	1,5,1	;_PA1

	global	_PA2
_PA2	set	42
	DABS	1,5,1	;_PA2

	global	_PA3
_PA3	set	43
	DABS	1,5,1	;_PA3

	global	_PA4
_PA4	set	44
	DABS	1,5,1	;_PA4

	global	_PA5
_PA5	set	45
	DABS	1,5,1	;_PA5

	global	_PAGE
_PAGE	set	29
	DABS	1,3,1	;_PAGE

	global	_PAIE
_PAIE	set	91
	DABS	1,11,1	;_PAIE

	global	_PAIF
_PAIF	set	88
	DABS	1,11,1	;_PAIF

	global	_PDC0
_PDC0	set	176
	DABS	1,22,1	;_PDC0

	global	_PDC1
_PDC1	set	177
	DABS	1,22,1	;_PDC1

	global	_PDC2
_PDC2	set	178
	DABS	1,22,1	;_PDC2

	global	_PDC3
_PDC3	set	179
	DABS	1,22,1	;_PDC3

	global	_PDC4
_PDC4	set	180
	DABS	1,22,1	;_PDC4

	global	_PDC5
_PDC5	set	181
	DABS	1,22,1	;_PDC5

	global	_PDC6
_PDC6	set	182
	DABS	1,22,1	;_PDC6

	global	_PEIE
_PEIE	set	94
	DABS	1,11,1	;_PEIE

	global	_PRSEN
_PRSEN	set	183
	DABS	1,22,1	;_PRSEN

	global	_PSSAC0
_PSSAC0	set	186
	DABS	1,23,1	;_PSSAC0

	global	_PSSAC1
_PSSAC1	set	187
	DABS	1,23,1	;_PSSAC1

	global	_PSSBD0
_PSSBD0	set	184
	DABS	1,23,1	;_PSSBD0

	global	_PSSBD1
_PSSBD1	set	185
	DABS	1,23,1	;_PSSBD1

	global	_RA0
_RA0	set	40
	DABS	1,5,1	;_RA0

	global	_RA1
_RA1	set	41
	DABS	1,5,1	;_RA1

	global	_RA2
_RA2	set	42
	DABS	1,5,1	;_RA2

	global	_RA3
_RA3	set	43
	DABS	1,5,1	;_RA3

	global	_RA4
_RA4	set	44
	DABS	1,5,1	;_RA4

	global	_RA5
_RA5	set	45
	DABS	1,5,1	;_RA5

	global	_RAIE
_RAIE	set	91
	DABS	1,11,1	;_RAIE

	global	_RAIF
_RAIF	set	88
	DABS	1,11,1	;_RAIF

	global	_RC0
_RC0	set	56
	DABS	1,7,1	;_RC0

	global	_RC1
_RC1	set	57
	DABS	1,7,1	;_RC1

	global	_RC2
_RC2	set	58
	DABS	1,7,1	;_RC2

	global	_RC3
_RC3	set	59
	DABS	1,7,1	;_RC3

	global	_RC4
_RC4	set	60
	DABS	1,7,1	;_RC4

	global	_RC5
_RC5	set	61
	DABS	1,7,1	;_RC5

	global	_RP
_RP	set	29
	DABS	1,3,1	;_RP

	global	_RP0
_RP0	set	29
	DABS	1,3,1	;_RP0

	global	_RP1
_RP1	set	30
	DABS	1,3,1	;_RP1

	global	_SLVREN
_SLVREN	set	220
	DABS	1,27,1	;_SLVREN

	global	_SWDTEN
_SWDTEN	set	192
	DABS	1,24,1	;_SWDTEN

	global	_T0IE
_T0IE	set	93
	DABS	1,11,1	;_T0IE

	global	_T0IF
_T0IF	set	90
	DABS	1,11,1	;_T0IF

	global	_T1CKPS0
_T1CKPS0	set	132
	DABS	1,16,1	;_T1CKPS0

	global	_T1CKPS1
_T1CKPS1	set	133
	DABS	1,16,1	;_T1CKPS1

	global	_T1GINV
_T1GINV	set	135
	DABS	1,16,1	;_T1GINV

	global	_T1GSS
_T1GSS	set	209
	DABS	1,26,1	;_T1GSS

	global	_T1IF
_T1IF	set	96
	DABS	1,12,1	;_T1IF

	global	_T1OSCEN
_T1OSCEN	set	131
	DABS	1,16,1	;_T1OSCEN

	global	_T2CKPS0
_T2CKPS0	set	144
	DABS	1,18,1	;_T2CKPS0

	global	_T2CKPS1
_T2CKPS1	set	145
	DABS	1,18,1	;_T2CKPS1

	global	_T2IF
_T2IF	set	97
	DABS	1,12,1	;_T2IF

	global	_TMR0IE
_TMR0IE	set	93
	DABS	1,11,1	;_TMR0IE

	global	_TMR0IF
_TMR0IF	set	90
	DABS	1,11,1	;_TMR0IF

	global	_TMR1CS
_TMR1CS	set	129
	DABS	1,16,1	;_TMR1CS

	global	_TMR1GE
_TMR1GE	set	134
	DABS	1,16,1	;_TMR1GE

	global	_TMR1IF
_TMR1IF	set	96
	DABS	1,12,1	;_TMR1IF

	global	_TMR1ON
_TMR1ON	set	128
	DABS	1,16,1	;_TMR1ON

	global	_TMR2IF
_TMR2IF	set	97
	DABS	1,12,1	;_TMR2IF

	global	_TMR2ON
_TMR2ON	set	146
	DABS	1,18,1	;_TMR2ON

	global	_TOUTPS0
_TOUTPS0	set	147
	DABS	1,18,1	;_TOUTPS0

	global	_TOUTPS1
_TOUTPS1	set	148
	DABS	1,18,1	;_TOUTPS1

	global	_TOUTPS2
_TOUTPS2	set	149
	DABS	1,18,1	;_TOUTPS2

	global	_TOUTPS3
_TOUTPS3	set	150
	DABS	1,18,1	;_TOUTPS3

	global	_VCFG
_VCFG	set	254
	DABS	1,31,1	;_VCFG

	global	_WDTPS0
_WDTPS0	set	193
	DABS	1,24,1	;_WDTPS0

	global	_WDTPS1
_WDTPS1	set	194
	DABS	1,24,1	;_WDTPS1

	global	_WDTPS2
_WDTPS2	set	195
	DABS	1,24,1	;_WDTPS2

	global	_WDTPS3
_WDTPS3	set	196
	DABS	1,24,1	;_WDTPS3

	global	_Z
_Z	set	26
	DABS	1,3,1	;_Z

	global	_ZERO
_ZERO	set	26
	DABS	1,3,1	;_ZERO

	global	_nDONE
_nDONE	set	249
	DABS	1,31,1	;_nDONE

	global	_nPD
_nPD	set	27
	DABS	1,3,1	;_nPD

	global	_nPF
_nPF	set	27
	DABS	1,3,1	;_nPF

	global	_nT1SYNC
_nT1SYNC	set	130
	DABS	1,16,1	;_nT1SYNC

	global	_nTF
_nTF	set	28
	DABS	1,3,1	;_nTF

	global	_nTO
_nTO	set	28
	DABS	1,3,1	;_nTO

	global	_OPTION
_OPTION	set	129
	DABS	1,129,1	;_OPTION

	global	_SFR80
_SFR80	set	128
	DABS	1,128,1	;_SFR80

	global	_ADCON1
_ADCON1	set	159
	DABS	1,159,1	;_ADCON1

	global	_ADRESL
_ADRESL	set	158
	DABS	1,158,1	;_ADRESL

	global	_ANSEL
_ANSEL	set	145
	DABS	1,145,1	;_ANSEL

	global	_EECON1bits
_EECON1bits	set	156
	DABS	1,156,1	;_EECON1bits

	global	_EECON2bits
_EECON2bits	set	157
	DABS	1,157,1	;_EECON2bits

	global	_EEDATA
_EEDATA	set	154
	DABS	1,154,1	;_EEDATA

	global	_IOC
_IOC	set	150
	DABS	1,150,1	;_IOC

	global	_IOCAbits
_IOCAbits	set	150
	DABS	1,150,1	;_IOCAbits

	global	_OPTION_REG
_OPTION_REG	set	129
	DABS	1,129,1	;_OPTION_REG

	global	_OPTIONbits
_OPTIONbits	set	129
	DABS	1,129,1	;_OPTIONbits

	global	_OSCCONbits
_OSCCONbits	set	143
	DABS	1,143,1	;_OSCCONbits

	global	_OSCTUNE
_OSCTUNE	set	144
	DABS	1,144,1	;_OSCTUNE

	global	_PCONbits
_PCONbits	set	142
	DABS	1,142,1	;_PCONbits

	global	_PIE1bits
_PIE1bits	set	140
	DABS	1,140,1	;_PIE1bits

	global	_SFR81
_SFR81	set	129
	DABS	1,129,1	;_SFR81

	global	_SFR85
_SFR85	set	133
	DABS	1,133,1	;_SFR85

	global	_SFR8C
_SFR8C	set	140
	DABS	1,140,1	;_SFR8C

	global	_SFR8E
_SFR8E	set	142
	DABS	1,142,1	;_SFR8E

	global	_SFR8F
_SFR8F	set	143
	DABS	1,143,1	;_SFR8F

	global	_SFR92
_SFR92	set	146
	DABS	1,146,1	;_SFR92

	global	_SFR95
_SFR95	set	149
	DABS	1,149,1	;_SFR95

	global	_SFR96
_SFR96	set	150
	DABS	1,150,1	;_SFR96

	global	_SFR9A
_SFR9A	set	154
	DABS	1,154,1	;_SFR9A

	global	_SFR9B
_SFR9B	set	155
	DABS	1,155,1	;_SFR9B

	global	_SFR9C
_SFR9C	set	156
	DABS	1,156,1	;_SFR9C

	global	_SFR9D
_SFR9D	set	157
	DABS	1,157,1	;_SFR9D

	global	_TRISAbits
_TRISAbits	set	133
	DABS	1,133,1	;_TRISAbits

	global	_TRISC
_TRISC	set	135
	DABS	1,135,1	;_TRISC

	global	_VRCON
_VRCON	set	153
	DABS	1,153,1	;_VRCON

	global	_WPU
_WPU	set	149
	DABS	1,149,1	;_WPU

	global	_WPUAbits
_WPUAbits	set	149
	DABS	1,149,1	;_WPUAbits

	global	_ADCS0
_ADCS0	set	1276
	DABS	1,159,1	;_ADCS0

	global	_ADCS1
_ADCS1	set	1277
	DABS	1,159,1	;_ADCS1

	global	_ADCS2
_ADCS2	set	1278
	DABS	1,159,1	;_ADCS2

	global	_ADIE
_ADIE	set	1126
	DABS	1,140,1	;_ADIE

	global	_ANS0
_ANS0	set	1160
	DABS	1,145,1	;_ANS0

	global	_ANS1
_ANS1	set	1161
	DABS	1,145,1	;_ANS1

	global	_ANS2
_ANS2	set	1162
	DABS	1,145,1	;_ANS2

	global	_ANS3
_ANS3	set	1163
	DABS	1,145,1	;_ANS3

	global	_ANS4
_ANS4	set	1164
	DABS	1,145,1	;_ANS4

	global	_ANS5
_ANS5	set	1165
	DABS	1,145,1	;_ANS5

	global	_ANS6
_ANS6	set	1166
	DABS	1,145,1	;_ANS6

	global	_ANS7
_ANS7	set	1167
	DABS	1,145,1	;_ANS7

	global	_C1IE
_C1IE	set	1123
	DABS	1,140,1	;_C1IE

	global	_C2IE
_C2IE	set	1124
	DABS	1,140,1	;_C2IE

	global	_CCP1IE
_CCP1IE	set	1125
	DABS	1,140,1	;_CCP1IE

	global	_CKMEAIE
_CKMEAIE	set	1126
	DABS	1,140,1	;_CKMEAIE

	global	_ECCPIE
_ECCPIE	set	1125
	DABS	1,140,1	;_ECCPIE

	global	_EEIE
_EEIE	set	1127
	DABS	1,140,1	;_EEIE

	global	_HFIOFR
_HFIOFR	set	1146
	DABS	1,143,1	;_HFIOFR

	global	_HTS
_HTS	set	1146
	DABS	1,143,1	;_HTS

	global	_INTEDG
_INTEDG	set	1038
	DABS	1,129,1	;_INTEDG

	global	_IOC0
_IOC0	set	1200
	DABS	1,150,1	;_IOC0

	global	_IOC1
_IOC1	set	1201
	DABS	1,150,1	;_IOC1

	global	_IOC2
_IOC2	set	1202
	DABS	1,150,1	;_IOC2

	global	_IOC3
_IOC3	set	1203
	DABS	1,150,1	;_IOC3

	global	_IOC4
_IOC4	set	1204
	DABS	1,150,1	;_IOC4

	global	_IOC5
_IOC5	set	1205
	DABS	1,150,1	;_IOC5

	global	_IOCA0
_IOCA0	set	1200
	DABS	1,150,1	;_IOCA0

	global	_IOCA1
_IOCA1	set	1201
	DABS	1,150,1	;_IOCA1

	global	_IOCA2
_IOCA2	set	1202
	DABS	1,150,1	;_IOCA2

	global	_IOCA3
_IOCA3	set	1203
	DABS	1,150,1	;_IOCA3

	global	_IOCA4
_IOCA4	set	1204
	DABS	1,150,1	;_IOCA4

	global	_IOCA5
_IOCA5	set	1205
	DABS	1,150,1	;_IOCA5

	global	_IRCF0
_IRCF0	set	1148
	DABS	1,143,1	;_IRCF0

	global	_IRCF1
_IRCF1	set	1149
	DABS	1,143,1	;_IRCF1

	global	_IRCF2
_IRCF2	set	1150
	DABS	1,143,1	;_IRCF2

	global	_LFIOFR
_LFIOFR	set	1145
	DABS	1,143,1	;_LFIOFR

	global	_LFMOD
_LFMOD	set	1151
	DABS	1,143,1	;_LFMOD

	global	_LTS
_LTS	set	1145
	DABS	1,143,1	;_LTS

	global	_OSFIE
_OSFIE	set	1122
	DABS	1,140,1	;_OSFIE

	global	_OSTS
_OSTS	set	1147
	DABS	1,143,1	;_OSTS

	global	_PS0
_PS0	set	1032
	DABS	1,129,1	;_PS0

	global	_PS1
_PS1	set	1033
	DABS	1,129,1	;_PS1

	global	_PS2
_PS2	set	1034
	DABS	1,129,1	;_PS2

	global	_PSA
_PSA	set	1035
	DABS	1,129,1	;_PSA

	global	_RD
_RD	set	1248
	DABS	1,156,1	;_RD

	global	_SBODEN
_SBODEN	set	1140
	DABS	1,142,1	;_SBODEN

	global	_SBOREN
_SBOREN	set	1140
	DABS	1,142,1	;_SBOREN

	global	_SCS
_SCS	set	1144
	DABS	1,143,1	;_SCS

	global	_T0CS
_T0CS	set	1037
	DABS	1,129,1	;_T0CS

	global	_T0SE
_T0SE	set	1036
	DABS	1,129,1	;_T0SE

	global	_T1IE
_T1IE	set	1120
	DABS	1,140,1	;_T1IE

	global	_T2IE
_T2IE	set	1121
	DABS	1,140,1	;_T2IE

	global	_TMR1IE
_TMR1IE	set	1120
	DABS	1,140,1	;_TMR1IE

	global	_TMR2IE
_TMR2IE	set	1121
	DABS	1,140,1	;_TMR2IE

	global	_TRISA0
_TRISA0	set	1064
	DABS	1,133,1	;_TRISA0

	global	_TRISA1
_TRISA1	set	1065
	DABS	1,133,1	;_TRISA1

	global	_TRISA2
_TRISA2	set	1066
	DABS	1,133,1	;_TRISA2

	global	_TRISA3
_TRISA3	set	1067
	DABS	1,133,1	;_TRISA3

	global	_TRISA4
_TRISA4	set	1068
	DABS	1,133,1	;_TRISA4

	global	_TRISA5
_TRISA5	set	1069
	DABS	1,133,1	;_TRISA5

	global	_TRISC0
_TRISC0	set	1080
	DABS	1,135,1	;_TRISC0

	global	_TRISC1
_TRISC1	set	1081
	DABS	1,135,1	;_TRISC1

	global	_TRISC2
_TRISC2	set	1082
	DABS	1,135,1	;_TRISC2

	global	_TRISC3
_TRISC3	set	1083
	DABS	1,135,1	;_TRISC3

	global	_TRISC4
_TRISC4	set	1084
	DABS	1,135,1	;_TRISC4

	global	_TRISC5
_TRISC5	set	1085
	DABS	1,135,1	;_TRISC5

	global	_TUN0
_TUN0	set	1152
	DABS	1,144,1	;_TUN0

	global	_TUN1
_TUN1	set	1153
	DABS	1,144,1	;_TUN1

	global	_TUN2
_TUN2	set	1154
	DABS	1,144,1	;_TUN2

	global	_TUN3
_TUN3	set	1155
	DABS	1,144,1	;_TUN3

	global	_TUN4
_TUN4	set	1156
	DABS	1,144,1	;_TUN4

	global	_ULPWUE
_ULPWUE	set	1141
	DABS	1,142,1	;_ULPWUE

	global	_VR0
_VR0	set	1224
	DABS	1,153,1	;_VR0

	global	_VR1
_VR1	set	1225
	DABS	1,153,1	;_VR1

	global	_VR2
_VR2	set	1226
	DABS	1,153,1	;_VR2

	global	_VR3
_VR3	set	1227
	DABS	1,153,1	;_VR3

	global	_VREN
_VREN	set	1231
	DABS	1,153,1	;_VREN

	global	_VRR
_VRR	set	1229
	DABS	1,153,1	;_VRR

	global	_WPU0
_WPU0	set	1192
	DABS	1,149,1	;_WPU0

	global	_WPU1
_WPU1	set	1193
	DABS	1,149,1	;_WPU1

	global	_WPU2
_WPU2	set	1194
	DABS	1,149,1	;_WPU2

	global	_WPU4
_WPU4	set	1196
	DABS	1,149,1	;_WPU4

	global	_WPU5
_WPU5	set	1197
	DABS	1,149,1	;_WPU5

	global	_WPUA0
_WPUA0	set	1192
	DABS	1,149,1	;_WPUA0

	global	_WPUA1
_WPUA1	set	1193
	DABS	1,149,1	;_WPUA1

	global	_WPUA2
_WPUA2	set	1194
	DABS	1,149,1	;_WPUA2

	global	_WPUA4
_WPUA4	set	1196
	DABS	1,149,1	;_WPUA4

	global	_WPUA5
_WPUA5	set	1197
	DABS	1,149,1	;_WPUA5

	global	_WR
_WR	set	1256
	DABS	1,157,1	;_WR

	global	_WREN
_WREN	set	1250
	DABS	1,156,1	;_WREN

	global	_WREN1
_WREN1	set	1250
	DABS	1,156,1	;_WREN1

	global	_WREN2
_WREN2	set	1252
	DABS	1,156,1	;_WREN2

	global	_WREN3
_WREN3	set	1253
	DABS	1,156,1	;_WREN3

	global	_WRERR
_WRERR	set	1251
	DABS	1,156,1	;_WRERR

	global	_nBOD
_nBOD	set	1136
	DABS	1,142,1	;_nBOD

	global	_nBOR
_nBOR	set	1136
	DABS	1,142,1	;_nBOR

	global	_nPAPU
_nPAPU	set	1039
	DABS	1,129,1	;_nPAPU

	global	_nPOR
_nPOR	set	1137
	DABS	1,142,1	;_nPOR

	global	_nRAPU
_nRAPU	set	1039
	DABS	1,129,1	;_nRAPU

	global	_INTCON
_INTCON	set	11
	DABS	1,11,1	;_INTCON

	global	_PIR1
_PIR1	set	12
	DABS	1,12,1	;_PIR1

	global	_SFR0D
_SFR0D	set	13
	DABS	1,13,1	;_SFR0D

	global	_SFR0E
_SFR0E	set	14
	DABS	1,14,1	;_SFR0E

	global	_SFR0F
_SFR0F	set	15
	DABS	1,15,1	;_SFR0F

	global	_SFR10
_SFR10	set	16
	DABS	1,16,1	;_SFR10

	global	_TMR2
_TMR2	set	17
	DABS	1,17,1	;_TMR2

	global	_SFR13
_SFR13	set	19
	DABS	1,19,1	;_SFR13

	global	_SFR14
_SFR14	set	20
	DABS	1,20,1	;_SFR14

	global	_SFR15
_SFR15	set	21
	DABS	1,21,1	;_SFR15

	global	_SFR16
_SFR16	set	22
	DABS	1,22,1	;_SFR16

	global	_SFR17
_SFR17	set	23
	DABS	1,23,1	;_SFR17

	global	_T2CON
_T2CON	set	18
	DABS	1,18,1	;_T2CON

	global	_WDTCON
_WDTCON	set	24
	DABS	1,24,1	;_WDTCON

	global	_MSCKCON
_MSCKCON	set	27
	DABS	1,27,1	;_MSCKCON

	global	_SFR19
_SFR19	set	25
	DABS	1,25,1	;_SFR19

	global	_SFR1A
_SFR1A	set	26
	DABS	1,26,1	;_SFR1A

	global	_SFR1E
_SFR1E	set	30
	DABS	1,30,1	;_SFR1E

	global	_SFR1F
_SFR1F	set	31
	DABS	1,31,1	;_SFR1F

	global	_SOSCPRH
_SOSCPRH	set	29
	DABS	1,29,1	;_SOSCPRH

	global	_SOSCPRL
_SOSCPRL	set	28
	DABS	1,28,1	;_SOSCPRL

	global	_SFR82
_SFR82	set	130
	DABS	1,130,1	;_SFR82

	global	_SFR83
_SFR83	set	131
	DABS	1,131,1	;_SFR83

	global	_SFR84
_SFR84	set	132
	DABS	1,132,1	;_SFR84

	global	_TRISA
_TRISA	set	133
	DABS	1,133,1	;_TRISA

	global	_PIE1
_PIE1	set	140
	DABS	1,140,1	;_PIE1

	global	_SFR86
_SFR86	set	134
	DABS	1,134,1	;_SFR86

	global	_SFR87
_SFR87	set	135
	DABS	1,135,1	;_SFR87

	global	_SFR88
_SFR88	set	136
	DABS	1,136,1	;_SFR88

	global	_SFR89
_SFR89	set	137
	DABS	1,137,1	;_SFR89

	global	_SFR8A
_SFR8A	set	138
	DABS	1,138,1	;_SFR8A

	global	_SFR8B
_SFR8B	set	139
	DABS	1,139,1	;_SFR8B

	global	_PCON
_PCON	set	142
	DABS	1,142,1	;_PCON

	global	_SFR8D
_SFR8D	set	141
	DABS	1,141,1	;_SFR8D

	global	_OSCCON
_OSCCON	set	143
	DABS	1,143,1	;_OSCCON

	global	_PR2
_PR2	set	146
	DABS	1,146,1	;_PR2

	global	_SFR90
_SFR90	set	144
	DABS	1,144,1	;_SFR90

	global	_SFR91
_SFR91	set	145
	DABS	1,145,1	;_SFR91

	global	_SFR93
_SFR93	set	147
	DABS	1,147,1	;_SFR93

	global	_SFR94
_SFR94	set	148
	DABS	1,148,1	;_SFR94

	global	_WPUA
_WPUA	set	149
	DABS	1,149,1	;_WPUA

	global	_EEDAT
_EEDAT	set	154
	DABS	1,154,1	;_EEDAT

	global	_IOCA
_IOCA	set	150
	DABS	1,150,1	;_IOCA

	global	_SFR97
_SFR97	set	151
	DABS	1,151,1	;_SFR97

	global	_SFR98
_SFR98	set	152
	DABS	1,152,1	;_SFR98

	global	_SFR99
_SFR99	set	153
	DABS	1,153,1	;_SFR99

	global	_EEADR
_EEADR	set	155
	DABS	1,155,1	;_EEADR

	global	_EECON1
_EECON1	set	156
	DABS	1,156,1	;_EECON1

	global	_EECON2
_EECON2	set	157
	DABS	1,157,1	;_EECON2

	global	_SFR9E
_SFR9E	set	158
	DABS	1,158,1	;_SFR9E

	global	_SFR9F
_SFR9F	set	159
	DABS	1,159,1	;_SFR9F

	
STR_4:	
	retlw	37	;'%'
	retlw	48	;'0'
	retlw	51	;'3'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_2:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_1:	
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	0
psect	strings
STR_3	equ	STR_1+0
	file	"counte.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_lastValue:
       ds      2

_localCounter:
       ds      2

_value:
       ds      2

my_itoa@s:
       ds      10

_buffer:
       ds      8

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	movlw	low(__pbssCOMMON)
	movwf	fsr
	movlw	low((__pbssCOMMON)+018h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_System_init
?_System_init:	; 0 bytes @ 0x0
	global	?_GPIO_Init
?_GPIO_Init:	; 0 bytes @ 0x0
	global	?_resetCounter
?_resetCounter:	; 0 bytes @ 0x0
	global	?_checkCounter
?_checkCounter:	; 0 bytes @ 0x0
	global	?_isdigit
?_isdigit:	; 1 bit 
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_WriteTM1617
?_WriteTM1617:	; 0 bytes @ 0x0
	global	?_DisplayTM1617
?_DisplayTM1617:	; 0 bytes @ 0x0
	global	?_doCount
?_doCount:	; 0 bytes @ 0x0
	global	?_isKeyPressed
?_isKeyPressed:	; 1 bytes @ 0x0
	ds	2
	global	??_System_init
??_System_init:	; 0 bytes @ 0x2
	global	??_GPIO_Init
??_GPIO_Init:	; 0 bytes @ 0x2
	global	??_isKeyPressed
??_isKeyPressed:	; 0 bytes @ 0x2
	global	?_Delay_xms
?_Delay_xms:	; 0 bytes @ 0x2
	global	??_resetCounter
??_resetCounter:	; 0 bytes @ 0x2
	global	??_isdigit
??_isdigit:	; 0 bytes @ 0x2
	global	??_WriteTM1617
??_WriteTM1617:	; 0 bytes @ 0x2
	global	??_doCount
??_doCount:	; 0 bytes @ 0x2
	global	?_getCounter
?_getCounter:	; 2 bytes @ 0x2
	global	?_encodeTM1617
?_encodeTM1617:	; 2 bytes @ 0x2
	global	?___wmul
?___wmul:	; 2 bytes @ 0x2
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x2
	global	WriteTM1617@value
WriteTM1617@value:	; 1 bytes @ 0x2
	global	_isdigit$2235
_isdigit$2235:	; 1 bytes @ 0x2
	global	Delay_xms@x
Delay_xms@x:	; 2 bytes @ 0x2
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x2
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x2
	ds	1
	global	WriteTM1617@i
WriteTM1617@i:	; 1 bytes @ 0x3
	global	isdigit@c
isdigit@c:	; 1 bytes @ 0x3
	ds	1
	global	??_Delay_xms
??_Delay_xms:	; 0 bytes @ 0x4
	global	??_getCounter
??_getCounter:	; 0 bytes @ 0x4
	global	??_DisplayTM1617
??_DisplayTM1617:	; 0 bytes @ 0x4
	global	??_encodeTM1617
??_encodeTM1617:	; 0 bytes @ 0x4
	global	encodeTM1617@value
encodeTM1617@value:	; 1 bytes @ 0x4
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x4
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x4
	ds	1
	global	Delay_xms@i
Delay_xms@i:	; 2 bytes @ 0x5
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x6
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x6
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x6
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x6
	ds	1
	global	??_checkCounter
??_checkCounter:	; 0 bytes @ 0x7
	global	DisplayTM1617@value
DisplayTM1617@value:	; 1 bytes @ 0x7
	ds	1
	global	DisplayTM1617@i
DisplayTM1617@i:	; 1 bytes @ 0x8
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x8
	ds	1
	global	?_printTM1617
?_printTM1617:	; 0 bytes @ 0x9
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x9
	global	printTM1617@string
printTM1617@string:	; 2 bytes @ 0x9
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x9
	ds	2
	global	??_printTM1617
??_printTM1617:	; 0 bytes @ 0xB
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xB
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xD
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xD
	ds	1
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0xE
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0xE
	global	printTM1617@vector
printTM1617@vector:	; 6 bytes @ 0xE
	ds	3
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0x11
	ds	3
	global	printTM1617@i
printTM1617@i:	; 1 bytes @ 0x14
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x14
	ds	1
	global	printTM1617@j
printTM1617@j:	; 1 bytes @ 0x15
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x15
	ds	1
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x16
	ds	4
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x1A
	ds	1
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x1B
	ds	2
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x1D
	ds	1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x1E
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x1F
;;Data sizes: Strings 13, constant 10, data 0, bss 24, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          62     31      55

;;
;; Pointer list with targets:

;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?_getCounter	unsigned short  size(1) Largest target is 0
;;
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 5
;;		 -> STR_4(CODE[5]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 8
;;		 -> buffer(COMMON[8]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(COMMON[2]), 
;;
;; S1931$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; printTM1617@string	PTR unsigned char  size(2) Largest target is 8
;;		 -> buffer(COMMON[8]), STR_3(CODE[4]), STR_2(CODE[4]), STR_1(CODE[4]), 
;;
;; DisplayTM1617@value	PTR unsigned short  size(1) Largest target is 6
;;		 -> printTM1617@vector(COMMON[6]), 
;;
;; sp__my_itoa	PTR unsigned char  size(1) Largest target is 10
;;		 -> my_itoa@s(COMMON[10]), 
;;
;; sp__reverse	PTR unsigned char  size(1) Largest target is 10
;;		 -> my_itoa@s(COMMON[10]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_sprintf
;;   _checkCounter->_Delay_xms
;;   _printTM1617->_DisplayTM1617
;;   _DisplayTM1617->_WriteTM1617
;;   _sprintf->___lwmod
;;   ___lwmod->___lwdiv
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    1425
;;                        _System_init
;;                          _GPIO_Init
;;                        _printTM1617
;;                       _isKeyPressed
;;                          _Delay_xms
;;                       _resetCounter
;;                       _checkCounter
;;                         _getCounter
;;                            _sprintf
;; ---------------------------------------------------------------------------------
;; (1) _checkCounter                                         0     0      0      30
;;                          _Delay_xms
;;                            _doCount
;; ---------------------------------------------------------------------------------
;; (1) _printTM1617                                         13    11      2     450
;;                                              9 COMMON    13    11      2
;;                       _encodeTM1617
;;                      _DisplayTM1617
;; ---------------------------------------------------------------------------------
;; (2) _DisplayTM1617                                        5     5      0     165
;;                                              4 COMMON     5     5      0
;;                        _WriteTM1617
;; ---------------------------------------------------------------------------------
;; (1) _sprintf                                             17    14      3     915
;;                                             14 COMMON    17    14      3
;;                            _isdigit
;;                             ___wmul
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (2) _Delay_xms                                            5     3      2      30
;;                                              2 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; (2) ___lwmod                                              5     1      4     105
;;                                              9 COMMON     5     1      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              7     3      4     105
;;                                              2 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___wmul                                               6     2      4      60
;;                                              2 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) _isdigit                                              2     2      0      45
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _doCount                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _encodeTM1617                                         3     1      2      15
;;                                              2 COMMON     3     1      2
;; ---------------------------------------------------------------------------------
;; (3) _WriteTM1617                                          2     2      0      45
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _getCounter                                           2     0      2       0
;;                                              2 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _resetCounter                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isKeyPressed                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _GPIO_Init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _System_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _System_init
;;   _GPIO_Init
;;   _printTM1617
;;     _encodeTM1617
;;     _DisplayTM1617
;;       _WriteTM1617
;;   _isKeyPressed
;;   _Delay_xms
;;   _resetCounter
;;   _checkCounter
;;     _Delay_xms
;;     _doCount
;;   _getCounter
;;   _sprintf
;;     _isdigit
;;     ___wmul
;;     ___lwdiv
;;     ___lwmod
;;       ___lwdiv (ARG)
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON           3E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON              3E     1F      37       1       88.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      37       3        0.0%
;;DATA                 0      0      3A       4        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 30 in file "Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         0
;;      Temps:          0
;;      Totals:         0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_System_init
;;		_GPIO_Init
;;		_printTM1617
;;		_isKeyPressed
;;		_Delay_xms
;;		_resetCounter
;;		_checkCounter
;;		_getCounter
;;		_sprintf
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"Main.c"
	line	30
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	31
	
l3243:	
# 31 "Main.c"
clrwdt ;#
psect	maintext
	line	32
	
l3245:	
;Main.c: 32: System_init();
	fcall	_System_init
	line	33
	
l3247:	
;Main.c: 33: GPIO_Init();
	fcall	_GPIO_Init
	line	34
	
l3249:	
;Main.c: 34: printTM1617("000");
	movlw	low((STR_1-__stringbase))
	movwf	(?_printTM1617)
	movlw	80h
	movwf	(?_printTM1617+1)
	fcall	_printTM1617
	line	36
	
l3251:	
# 36 "Main.c"
clrwdt ;#
psect	maintext
	line	37
	
l3253:	
;Main.c: 37: if(isKeyPressed()){
	fcall	_isKeyPressed
	xorlw	0
	skipnz
	goto	u451
	goto	u450
u451:
	goto	l3267
u450:
	goto	l457
	line	39
	
l3257:	
;Main.c: 39: printTM1617("   ");
	movlw	low((STR_2-__stringbase))
	movwf	(?_printTM1617)
	movlw	80h
	movwf	(?_printTM1617+1)
	fcall	_printTM1617
	line	40
	
l3259:	
;Main.c: 40: Delay_xms(250);
	movlw	0FAh
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	41
	
l3261:	
;Main.c: 41: printTM1617("000");
	movlw	low((STR_3-__stringbase))
	movwf	(?_printTM1617)
	movlw	80h
	movwf	(?_printTM1617+1)
	fcall	_printTM1617
	line	42
;Main.c: 42: Delay_xms(250);
	movlw	0FAh
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	43
	
l457:	
	line	38
	fcall	_isKeyPressed
	iorlw	0
	skipz
	goto	u461
	goto	u460
u461:
	goto	l3257
u460:
	line	44
	
l3263:	
;Main.c: 43: }
;Main.c: 44: lastValue = 0;
	clrf	(_lastValue)
	clrf	(_lastValue+1)
	line	45
	
l3265:	
;Main.c: 45: resetCounter();
	fcall	_resetCounter
	line	46
;Main.c: 46: }else{
	goto	l3251
	line	47
	
l3267:	
;Main.c: 47: checkCounter();
	fcall	_checkCounter
	line	48
	
l3269:	
;Main.c: 48: value = getCounter();
	fcall	_getCounter
	movf	(1+(?_getCounter)),w
	movwf	(_value+1)
	movf	(0+(?_getCounter)),w
	movwf	(_value)
	line	49
	
l3271:	
;Main.c: 49: if(value != lastValue)
	movf	(_lastValue+1),w
	xorwf	(_value+1),w
	skipz
	goto	u475
	movf	(_lastValue),w
	xorwf	(_value),w
u475:

	skipnz
	goto	u471
	goto	u470
u471:
	goto	l3251
u470:
	line	51
	
l3273:	
;Main.c: 50: {
;Main.c: 51: lastValue = value;
	movf	(_value+1),w
	movwf	(_lastValue+1)
	movf	(_value),w
	movwf	(_lastValue)
	line	52
	
l3275:	
;Main.c: 52: sprintf(buffer,"%03d",value);
	movlw	((STR_4-__stringbase))&0ffh
	movwf	(?_sprintf)
	movf	(_value+1),w
	movwf	1+(?_sprintf)+01h
	movf	(_value),w
	movwf	0+(?_sprintf)+01h
	movlw	(_buffer)&0ffh
	fcall	_sprintf
	line	53
	
l3277:	
;Main.c: 53: printTM1617(buffer);
	movlw	(_buffer&0ffh)
	movwf	(?_printTM1617)
	movlw	(0x00/2)
	movwf	(?_printTM1617+1)
	fcall	_printTM1617
	goto	l3251
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	57
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_checkCounter
psect	text179,local,class=CODE,delta=2
global __ptext179
__ptext179:

;; *************** function _checkCounter *****************
;; Defined at:
;;		line 58 in file "MyKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         0
;;      Temps:          0
;;      Totals:         0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Delay_xms
;;		_doCount
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text179
	file	"MyKey.c"
	line	58
	global	__size_of_checkCounter
	__size_of_checkCounter	equ	__end_of_checkCounter-_checkCounter
	
_checkCounter:	
	opt	stack 5
; Regs used in _checkCounter: [wreg+status,2+status,0+pclath+cstack]
	line	59
	
l3231:	
;MyKey.c: 59: if(PA3 == 0) return;
	btfsc	(43/8),(43)&7
	goto	u431
	goto	u430
u431:
	goto	l3235
u430:
	goto	l1844
	line	61
	
l3235:	
;MyKey.c: 61: Delay_xms(10);
	movlw	0Ah
	movwf	(?_Delay_xms)
	clrf	(?_Delay_xms+1)
	fcall	_Delay_xms
	line	62
	
l3237:	
;MyKey.c: 62: if(PA3 == 0) break;
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(43/8),(43)&7
	goto	u441
	goto	u440
u441:
	goto	l3235
u440:
	line	64
	
l3241:	
;MyKey.c: 63: }
;MyKey.c: 64: doCount();
	fcall	_doCount
	line	65
	
l1844:	
	return
	opt stack 0
GLOBAL	__end_of_checkCounter
	__end_of_checkCounter:
;; =============== function _checkCounter ends ============

	signat	_checkCounter,88
	global	_printTM1617
psect	text180,local,class=CODE,delta=2
global __ptext180
__ptext180:

;; *************** function _printTM1617 *****************
;; Defined at:
;;		line 160 in file "Tm1617.c"
;; Parameters:    Size  Location     Type
;;  string          2    9[COMMON] PTR unsigned char 
;;		 -> buffer(8), STR_3(4), STR_2(4), STR_1(4), 
;; Auto vars:     Size  Location     Type
;;  vector          6   14[COMMON] unsigned short [3]
;;  j               1   21[COMMON] unsigned char 
;;  i               1   20[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 20/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON
;;      Params:         2
;;      Locals:         8
;;      Temps:          3
;;      Totals:        13
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_encodeTM1617
;;		_DisplayTM1617
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text180
	file	"Tm1617.c"
	line	160
	global	__size_of_printTM1617
	__size_of_printTM1617	equ	__end_of_printTM1617-_printTM1617
	
_printTM1617:	
	opt	stack 4
; Regs used in _printTM1617: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	164
	
l3205:	
;Tm1617.c: 161: unsigned char i,j;
;Tm1617.c: 162: _VECTOR vector;
;Tm1617.c: 164: for(i = 0,j = 0;string[i] != '\0' && j < 3;i ++)
	clrf	(printTM1617@i)
	clrf	(printTM1617@j)
	goto	l3225
	line	166
	
l3207:	
;Tm1617.c: 165: {
;Tm1617.c: 166: if(string[i] == '.' && j > 0)
	movf	(printTM1617@i),w
	addwf	(printTM1617@string),w
	movwf	fsr0
	movf	(printTM1617@string+1),w
	skipnc
	incf	(printTM1617@string+1),w
	movwf	btemp+1
	fcall	stringtab
	xorlw	02Eh
	skipz
	goto	u361
	goto	u360
u361:
	goto	l3213
u360:
	
l3209:	
	movf	(printTM1617@j),w
	skipz
	goto	u370
	goto	l3213
u370:
	line	168
	
l3211:	
;Tm1617.c: 167: {
;Tm1617.c: 168: vector[j - 1] |= 0x20;
	clrc
	rlf	(printTM1617@j),w
	addlw	0FEh
	addlw	printTM1617@vector&0ffh
	movwf	fsr0
	movlw	low(020h)
	iorwf	indf,f
	incf	fsr0,f
	movlw	high(020h)
	iorwf	indf,f
	line	169
;Tm1617.c: 169: continue;
	goto	l3223
	line	171
	
l3213:	
;Tm1617.c: 170: }
;Tm1617.c: 171: vector[j ++] = encodeTM1617(string[i]);
	movf	(printTM1617@i),w
	addwf	(printTM1617@string),w
	movwf	fsr0
	movf	(printTM1617@string+1),w
	skipnc
	incf	(printTM1617@string+1),w
	movwf	btemp+1
	fcall	stringtab
	fcall	_encodeTM1617
	clrc
	rlf	(printTM1617@j),w
	addlw	printTM1617@vector&0ffh
	movwf	fsr0
	movf	(0+(?_encodeTM1617)),w
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_encodeTM1617)),w
	movwf	indf
	
l3215:	
	incf	(printTM1617@j),f
	line	172
	
l3217:	
;Tm1617.c: 172: if(j >= 3 && string[i + 1] == '.')
	movlw	(03h)
	subwf	(printTM1617@j),w
	skipc
	goto	u381
	goto	u380
u381:
	goto	l3223
u380:
	
l3219:	
	movf	(printTM1617@i),w
	addwf	(printTM1617@string),w
	movwf	(??_printTM1617+1)+0
	movf	(printTM1617@string+1),w
	movwf	(??_printTM1617+0)+0
	skipnc
	incf	(??_printTM1617+0)+0,f
	btfss	(printTM1617@i),7
	goto	u390
	decf	(??_printTM1617+0)+0,f
u390:
	movf	(??_printTM1617+0)+0,w
	movwf	0+((??_printTM1617+1)+0)+1
	movlw	01h
	addwf	0+(??_printTM1617+1)+0,w
	movwf	fsr0
	movf	1+(??_printTM1617+1)+0,w
	skipnc
	incf	1+(??_printTM1617+1)+0,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	fcall	stringtab
	xorlw	02Eh
	skipz
	goto	u401
	goto	u400
u401:
	goto	l3223
u400:
	goto	l3211
	line	164
	
l3223:	
	incf	(printTM1617@i),f
	
l3225:	
	movf	(printTM1617@i),w
	addwf	(printTM1617@string),w
	movwf	fsr0
	movf	(printTM1617@string+1),w
	skipnc
	incf	(printTM1617@string+1),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	fcall	stringtab
	xorlw	0
	skipnz
	goto	u411
	goto	u410
u411:
	goto	l3229
u410:
	
l3227:	
	movlw	(03h)
	subwf	(printTM1617@j),w
	skipc
	goto	u421
	goto	u420
u421:
	goto	l3207
u420:
	line	175
	
l3229:	
;Tm1617.c: 174: }
;Tm1617.c: 175: DisplayTM1617(vector);
	movlw	(printTM1617@vector)&0ffh
	fcall	_DisplayTM1617
	line	176
	
l1394:	
	return
	opt stack 0
GLOBAL	__end_of_printTM1617
	__end_of_printTM1617:
;; =============== function _printTM1617 ends ============

	signat	_printTM1617,4216
	global	_DisplayTM1617
psect	text181,local,class=CODE,delta=2
global __ptext181
__ptext181:

;; *************** function _DisplayTM1617 *****************
;; Defined at:
;;		line 69 in file "Tm1617.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     PTR unsigned short 
;;		 -> printTM1617@vector(6), 
;; Auto vars:     Size  Location     Type
;;  value           1    7[COMMON] PTR unsigned short 
;;		 -> printTM1617@vector(6), 
;;  i               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         2
;;      Temps:          3
;;      Totals:         5
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_WriteTM1617
;; This function is called by:
;;		_printTM1617
;; This function uses a non-reentrant model
;;
psect	text181
	file	"Tm1617.c"
	line	69
	global	__size_of_DisplayTM1617
	__size_of_DisplayTM1617	equ	__end_of_DisplayTM1617-_DisplayTM1617
	
_DisplayTM1617:	
	opt	stack 4
; Regs used in _DisplayTM1617: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;DisplayTM1617@value stored from wreg
	line	72
	movwf	(DisplayTM1617@value)
	
l3169:	
;Tm1617.c: 70: unsigned char i;
;Tm1617.c: 72: PA5=1;
	bsf	(45/8),(45)&7
	line	73
;Tm1617.c: 73: PA4=1;
	bsf	(44/8),(44)&7
	line	74
;Tm1617.c: 74: PA2=1;
	bsf	(42/8),(42)&7
	line	76
;Tm1617.c: 76: PA5=0;
	bcf	(45/8),(45)&7
	line	77
	
l3171:	
;Tm1617.c: 77: WriteTM1617(0x03);
	movlw	(03h)
	fcall	_WriteTM1617
	line	78
	
l3173:	
;Tm1617.c: 78: PA5=1;
	bsf	(45/8),(45)&7
	line	80
	
l3175:	
;Tm1617.c: 80: PA5=0;
	bcf	(45/8),(45)&7
	line	81
;Tm1617.c: 81: WriteTM1617(0x40);
	movlw	(040h)
	fcall	_WriteTM1617
	line	82
	
l3177:	
;Tm1617.c: 82: PA5=1;
	bsf	(45/8),(45)&7
	line	84
	
l3179:	
;Tm1617.c: 84: PA5=0;
	bcf	(45/8),(45)&7
	line	86
;Tm1617.c: 86: WriteTM1617(0xC0);
	movlw	(0C0h)
	fcall	_WriteTM1617
	line	87
	
l3181:	
;Tm1617.c: 87: for(i = 0;i < 2;i ++)
	clrf	(DisplayTM1617@i)
	line	89
	
l3187:	
;Tm1617.c: 88: {
;Tm1617.c: 89: WriteTM1617((unsigned char)(value[i] >> 8));
	clrc
	rlf	(DisplayTM1617@i),w
	addwf	(DisplayTM1617@value),w
	movwf	(??_DisplayTM1617+0)+0
	movf	0+(??_DisplayTM1617+0)+0,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_DisplayTM1617+1)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_DisplayTM1617+1)+0+1
	movf	1+(??_DisplayTM1617+1)+0,w
	fcall	_WriteTM1617
	line	90
;Tm1617.c: 90: WriteTM1617((unsigned char)(value[i] >> 0));
	clrc
	rlf	(DisplayTM1617@i),w
	addwf	(DisplayTM1617@value),w
	movwf	(??_DisplayTM1617+0)+0
	movf	0+(??_DisplayTM1617+0)+0,w
	movwf	fsr0
	movf	indf,w
	fcall	_WriteTM1617
	line	87
	
l3189:	
	incf	(DisplayTM1617@i),f
	
l3191:	
	movlw	(02h)
	subwf	(DisplayTM1617@i),w
	skipc
	goto	u351
	goto	u350
u351:
	goto	l3187
u350:
	
l1366:	
	line	92
;Tm1617.c: 91: }
;Tm1617.c: 92: PA5=1;
	bsf	(45/8),(45)&7
	line	93
;Tm1617.c: 93: PA5=0;
	bcf	(45/8),(45)&7
	line	94
	
l3193:	
;Tm1617.c: 94: WriteTM1617(0xCC);
	movlw	(0CCh)
	fcall	_WriteTM1617
	line	96
	
l3195:	
;Tm1617.c: 96: WriteTM1617((unsigned char)(value[2] >> 8));
	movf	(DisplayTM1617@value),w
	addlw	04h
	movwf	fsr0
	movf	indf,w
	movwf	(??_DisplayTM1617+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_DisplayTM1617+0)+0+1
	movf	1+(??_DisplayTM1617+0)+0,w
	fcall	_WriteTM1617
	line	97
	
l3197:	
;Tm1617.c: 97: WriteTM1617((unsigned char)(value[2] >> 0));
	movf	(DisplayTM1617@value),w
	addlw	04h
	movwf	fsr0
	movf	indf,w
	fcall	_WriteTM1617
	line	98
	
l3199:	
;Tm1617.c: 98: PA5=1;
	bsf	(45/8),(45)&7
	line	100
	
l3201:	
;Tm1617.c: 100: PA5=0;
	bcf	(45/8),(45)&7
	line	101
;Tm1617.c: 101: WriteTM1617(0x8C);
	movlw	(08Ch)
	fcall	_WriteTM1617
	line	102
	
l3203:	
;Tm1617.c: 102: PA5=1;
	bsf	(45/8),(45)&7
	line	103
	
l1367:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayTM1617
	__end_of_DisplayTM1617:
;; =============== function _DisplayTM1617 ends ============

	signat	_DisplayTM1617,4216
	global	_sprintf
psect	text182,local,class=CODE,delta=2
global __ptext182
__ptext182:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> buffer(8), 
;;  f               1   14[COMMON] PTR const unsigned char 
;;		 -> STR_4(5), 
;; Auto vars:     Size  Location     Type
;;  sp              1   29[COMMON] PTR unsigned char 
;;		 -> buffer(8), 
;;  _val            4   22[COMMON] struct .
;;  width           2   27[COMMON] int 
;;  c               1   30[COMMON] char 
;;  flag            1   26[COMMON] unsigned char 
;;  prec            1   21[COMMON] char 
;;  ap              1   20[COMMON] PTR void [1]
;;		 -> ?_sprintf(2), 
;; Return value:  Size  Location     Type
;;                  2   14[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON
;;      Params:         3
;;      Locals:        11
;;      Temps:          3
;;      Totals:        17
;;Total ram usage:       17 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_isdigit
;;		___wmul
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text182
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\doprnt.c"
	line	488
	global	__size_of_sprintf
	__size_of_sprintf	equ	__end_of_sprintf-_sprintf
	
_sprintf:	
	opt	stack 5
; Regs used in _sprintf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;sprintf@sp stored from wreg
	line	537
	movwf	(sprintf@sp)
	
l3059:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(sprintf@ap)
	line	540
	goto	l3163
	line	542
	
l3061:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u171
	goto	u170
u171:
	goto	l3067
u170:
	line	545
	
l3063:	
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(sprintf@c),w
	movwf	indf
	
l3065:	
	incf	(sprintf@sp),f
	line	546
	goto	l3163
	line	550
	
l3067:	
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	line	552
	clrf	(sprintf@flag)
	goto	l3073
	line	583
	
l1864:	
	line	584
	bsf	(sprintf@flag)+(2/8),(2)&7
	line	585
	
l3069:	
	incf	(sprintf@f),f
	line	555
	
l3073:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 48 to 48
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           10     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	48^0	; case 48
	skipnz
	goto	l1864
	goto	l3075
	opt asmopt_on

	line	601
	
l3075:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfss	status,0
	goto	u181
	goto	u180
u181:
	goto	l3087
u180:
	line	602
	
l3077:	
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	line	604
	
l3079:	
	movf	(sprintf@width+1),w
	movwf	(?___wmul+1)
	movf	(sprintf@width),w
	movwf	(?___wmul)
	movlw	0Ah
	movwf	0+(?___wmul)+02h
	clrf	1+(?___wmul)+02h
	fcall	___wmul
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	addwf	(0+(?___wmul)),w
	movwf	(??_sprintf+0)+0
	movlw	0
	skipnc
	movlw	1
	addwf	(1+(?___wmul)),w
	movwf	1+(??_sprintf+0)+0
	movf	0+(??_sprintf+0)+0,w
	addlw	low(0FFD0h)
	movwf	(sprintf@width)
	movf	1+(??_sprintf+0)+0,w
	skipnc
	addlw	1
	addlw	high(0FFD0h)
	movwf	1+(sprintf@width)
	
l3081:	
	incf	(sprintf@f),f
	line	605
	
l3083:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfsc	status,0
	goto	u191
	goto	u190
u191:
	goto	l3079
u190:
	line	638
	
l3087:	
	movf	(sprintf@f),w
	incf	(sprintf@f),f
	movwf	fsr0
	fcall	stringdir
	movwf	(sprintf@c)
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 105
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte          112     6 (fixed)
; jumptable            260     6 (fixed)
; rangetable           110     6 (fixed)
; spacedrange          218     9 (fixed)
; locatedrange         106     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3165
	xorlw	100^0	; case 100
	skipnz
	goto	l3089
	xorlw	105^100	; case 105
	skipnz
	goto	l3089
	goto	l3163
	opt asmopt_on

	line	1254
	
l3089:	
	movf	(sprintf@ap),w
	movwf	fsr0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
l3091:	
	incf	(sprintf@ap),f
	incf	(sprintf@ap),f
	line	1256
	
l3093:	
	btfss	(sprintf@_val+1),7
	goto	u201
	goto	u200
u201:
	goto	l3099
u200:
	line	1257
	
l3095:	
	movlw	(03h)
	iorwf	(sprintf@flag),f
	line	1258
	
l3097:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	line	1300
	
l3099:	
	clrf	(sprintf@c)
	incf	(sprintf@c),f
	line	1301
	
l3103:	
	clrc
	rlf	(sprintf@c),w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+0)+0
	fcall	stringdir
	movwf	(??_sprintf+0)+0+1
	movf	1+(??_sprintf+0)+0,w
	subwf	(sprintf@_val+1),w
	skipz
	goto	u215
	movf	0+(??_sprintf+0)+0,w
	subwf	(sprintf@_val),w
u215:
	skipnc
	goto	u211
	goto	u210
u211:
	goto	l3107
u210:
	goto	l3111
	line	1300
	
l3107:	
	incf	(sprintf@c),f
	
l3109:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u221
	goto	u220
u221:
	goto	l3103
u220:
	line	1340
	
l3111:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u231
	goto	u230
u231:
	goto	l3117
u230:
	
l3113:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u241
	goto	u240
u241:
	goto	l3117
u240:
	line	1341
	
l3115:	
	movlw	-1
	addwf	(sprintf@width),f
	skipc
	decf	(sprintf@width+1),f
	line	1376
	
l3117:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	clrf	(??_sprintf+0)+0+1
	btfsc	(??_sprintf+0)+0,7
	decf	(??_sprintf+0)+0+1,f
	movf	1+(??_sprintf+0)+0,w
	xorlw	80h
	movwf	(??_sprintf+2)+0
	movf	(sprintf@width+1),w
	xorlw	80h
	subwf	(??_sprintf+2)+0,w
	skipz
	goto	u255
	movf	(sprintf@width),w
	subwf	0+(??_sprintf+0)+0,w
u255:

	skipnc
	goto	u251
	goto	u250
u251:
	goto	l3121
u250:
	line	1377
	
l3119:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	clrf	(??_sprintf+0)+0+1
	btfsc	(??_sprintf+0)+0,7
	decf	(??_sprintf+0)+0+1,f
	movf	0+(??_sprintf+0)+0,w
	subwf	(sprintf@width),f
	movf	1+(??_sprintf+0)+0,w
	skipc
	decf	(sprintf@width+1),f
	subwf	(sprintf@width+1),f
	goto	l3123
	line	1379
	
l3121:	
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	line	1382
	
l3123:	
	btfss	(sprintf@flag),(2)&7
	goto	u261
	goto	u260
u261:
	goto	l3139
u260:
	line	1387
	
l3125:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u271
	goto	u270
u271:
	goto	l3131
u270:
	line	1388
	
l3127:	
	movf	(sprintf@sp),w
	movwf	fsr0
	movlw	(02Dh)
	movwf	indf
	
l3129:	
	incf	(sprintf@sp),f
	line	1410
	
l3131:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u281
	goto	u280
u281:
	goto	l3153
u280:
	line	1412
	
l3133:	
	movf	(sprintf@sp),w
	movwf	fsr0
	movlw	(030h)
	movwf	indf
	
l3135:	
	incf	(sprintf@sp),f
	line	1413
	
l3137:	
	movlw	-1
	addwf	(sprintf@width),f
	skipc
	decf	(sprintf@width+1),f
	movf	(((sprintf@width+1))),w
	iorwf	(((sprintf@width))),w
	skipz
	goto	u291
	goto	u290
u291:
	goto	l3133
u290:
	goto	l3153
	line	1423
	
l3139:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u301
	goto	u300
u301:
	goto	l3147
u300:
	line	1425
	
l3141:	
	movf	(sprintf@sp),w
	movwf	fsr0
	movlw	(020h)
	movwf	indf
	
l3143:	
	incf	(sprintf@sp),f
	line	1426
	
l3145:	
	movlw	-1
	addwf	(sprintf@width),f
	skipc
	decf	(sprintf@width+1),f
	movf	(((sprintf@width+1))),w
	iorwf	(((sprintf@width))),w
	skipz
	goto	u311
	goto	u310
u311:
	goto	l3141
u310:
	line	1433
	
l3147:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u321
	goto	u320
u321:
	goto	l3153
u320:
	line	1434
	
l3149:	
	movf	(sprintf@sp),w
	movwf	fsr0
	movlw	(02Dh)
	movwf	indf
	
l3151:	
	incf	(sprintf@sp),f
	line	1467
	
l3153:	
	movf	(sprintf@c),w
	movwf	(sprintf@prec)
	line	1469
	goto	l3161
	line	1484
	
l3155:	
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	clrc
	rlf	(sprintf@prec),w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?___lwdiv)
	fcall	stringdir
	movwf	(?___lwdiv+1)
	movf	(sprintf@_val+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(sprintf@_val),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	movwf	(sprintf@c)
	line	1516
	
l3157:	
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(sprintf@c),w
	movwf	indf
	
l3159:	
	incf	(sprintf@sp),f
	line	1469
	
l3161:	
	decf	(sprintf@prec),f
	incf	((sprintf@prec)),w
	skipz
	goto	u331
	goto	u330
u331:
	goto	l3155
u330:
	line	540
	
l3163:	
	movf	(sprintf@f),w
	incf	(sprintf@f),f
	movwf	fsr0
	fcall	stringdir
	movwf	(sprintf@c)
	movf	((sprintf@c)),f
	skipz
	goto	u341
	goto	u340
u341:
	goto	l3061
u340:
	line	1530
	
l3165:	
	movf	(sprintf@sp),w
	movwf	fsr0
	clrf	indf
	line	1533
	
l1899:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_Delay_xms
psect	text183,local,class=CODE,delta=2
global __ptext183
__ptext183:

;; *************** function _Delay_xms *****************
;; Defined at:
;;		line 38 in file "MyConfiguration.c"
;; Parameters:    Size  Location     Type
;;  x               2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    5[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON
;;      Params:         2
;;      Locals:         2
;;      Temps:          1
;;      Totals:         5
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_checkCounter
;; This function uses a non-reentrant model
;;
psect	text183
	file	"MyConfiguration.c"
	line	38
	global	__size_of_Delay_xms
	__size_of_Delay_xms	equ	__end_of_Delay_xms-_Delay_xms
	
_Delay_xms:	
	opt	stack 5
; Regs used in _Delay_xms: [wreg+status,2+status,0]
	line	40
	
l3049:	
;MyConfiguration.c: 39: unsigned int i;
;MyConfiguration.c: 40: for(i=0;i<x;i++){
	clrf	(Delay_xms@i)
	clrf	(Delay_xms@i+1)
	goto	l3057
	line	41
	
l3051:	
;MyConfiguration.c: 41: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_Delay_xms+0)+0,f
u487:
	clrwdt
decfsz	(??_Delay_xms+0)+0,f
	goto	u487
	nop2	;nop
	clrwdt
opt asmopt_on

	line	42
	
l3053:	
# 42 "MyConfiguration.c"
clrwdt ;#
psect	text183
	line	40
	
l3055:	
	incf	(Delay_xms@i),f
	skipnz
	incf	(Delay_xms@i+1),f
	
l3057:	
	movf	(Delay_xms@x+1),w
	subwf	(Delay_xms@i+1),w
	skipz
	goto	u165
	movf	(Delay_xms@x),w
	subwf	(Delay_xms@i),w
u165:
	skipc
	goto	u161
	goto	u160
u161:
	goto	l3051
u160:
	line	44
	
l909:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_xms
	__end_of_Delay_xms:
;; =============== function _Delay_xms ends ============

	signat	_Delay_xms,4216
	global	___lwmod
psect	text184,local,class=CODE,delta=2
global __ptext184
__ptext184:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    9[COMMON] unsigned int 
;;  dividend        2   11[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    9[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON
;;      Params:         4
;;      Locals:         1
;;      Temps:          0
;;      Totals:         5
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text184
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 5
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l3029:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u121
	goto	u120
u121:
	goto	l3045
u120:
	line	9
	
l3031:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	10
	goto	l3035
	line	11
	
l3033:	
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	12
	incf	(___lwmod@counter),f
	line	10
	
l3035:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u131
	goto	u130
u131:
	goto	l3033
u130:
	line	15
	
l3037:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u145
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u145:
	skipc
	goto	u141
	goto	u140
u141:
	goto	l3041
u140:
	line	16
	
l3039:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	17
	
l3041:	
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	18
	
l3043:	
	decfsz	(___lwmod@counter),f
	goto	u151
	goto	u150
u151:
	goto	l3037
u150:
	line	20
	
l3045:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	21
	
l2488:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text185,local,class=CODE,delta=2
global __ptext185
__ptext185:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    2[COMMON] unsigned int 
;;  dividend        2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[COMMON] unsigned int 
;;  counter         1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON
;;      Params:         4
;;      Locals:         3
;;      Temps:          0
;;      Totals:         7
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text185
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l3003:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l3005:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u81
	goto	u80
u81:
	goto	l3025
u80:
	line	11
	
l3007:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
	goto	l3011
	line	13
	
l3009:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
	incf	(___lwdiv@counter),f
	line	12
	
l3011:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u91
	goto	u90
u91:
	goto	l3009
u90:
	line	17
	
l3013:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l3015:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u105
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u105:
	skipc
	goto	u101
	goto	u100
u101:
	goto	l3021
u100:
	line	19
	
l3017:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l3019:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l3021:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l3023:	
	decfsz	(___lwdiv@counter),f
	goto	u111
	goto	u110
u111:
	goto	l3013
u110:
	line	25
	
l3025:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l2478:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text186,local,class=CODE,delta=2
global __ptext186
__ptext186:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    2[COMMON] unsigned int 
;;  multiplicand    2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    6[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON
;;      Params:         4
;;      Locals:         2
;;      Temps:          0
;;      Totals:         6
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text186
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l2987:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	7
	
l2989:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u61
	goto	u60
u61:
	goto	l2993
u60:
	line	8
	
l2991:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	9
	
l2993:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	10
	
l2995:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	11
	
l2997:	
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u71
	goto	u70
u71:
	goto	l2989
u70:
	line	12
	
l2999:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	13
	
l2468:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_isdigit
psect	text187,local,class=CODE,delta=2
global __ptext187
__ptext187:

;; *************** function _isdigit *****************
;; Defined at:
;;		line 13 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\isdigit.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         2
;;      Temps:          0
;;      Totals:         2
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text187
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\isdigit.c"
	global	__size_of_isdigit
	__size_of_isdigit	equ	__end_of_isdigit-_isdigit
	
_isdigit:	
	opt	stack 5
; Regs used in _isdigit: [wreg+status,2+status,0]
;isdigit@c stored from wreg
	movwf	(isdigit@c)
	line	14
	
l2975:	
	clrf	(_isdigit$2235)
	
l2977:	
	movlw	(03Ah)
	subwf	(isdigit@c),w
	skipnc
	goto	u41
	goto	u40
u41:
	goto	l2983
u40:
	
l2979:	
	movlw	(030h)
	subwf	(isdigit@c),w
	skipc
	goto	u51
	goto	u50
u51:
	goto	l2983
u50:
	
l2981:	
	clrf	(_isdigit$2235)
	incf	(_isdigit$2235),f
	
l2983:	
	rrf	(_isdigit$2235),w
	
	line	15
	
l2456:	
	return
	opt stack 0
GLOBAL	__end_of_isdigit
	__end_of_isdigit:
;; =============== function _isdigit ends ============

	signat	_isdigit,4216
	global	_doCount
psect	text188,local,class=CODE,delta=2
global __ptext188
__ptext188:

;; *************** function _doCount *****************
;; Defined at:
;;		line 44 in file "MyKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         0
;;      Temps:          0
;;      Totals:         0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_checkCounter
;; This function uses a non-reentrant model
;;
psect	text188
	file	"MyKey.c"
	line	44
	global	__size_of_doCount
	__size_of_doCount	equ	__end_of_doCount-_doCount
	
_doCount:	
	opt	stack 5
; Regs used in _doCount: [wreg+status,2+status,0]
	line	46
	
l2969:	
;MyKey.c: 46: if(localCounter != 999)
		movf	(_localCounter+1),w
	xorlw	3
	movlw	231
	skipnz
	xorwf	(_localCounter),w

	skipnz
	goto	u31
	goto	u30
u31:
	goto	l2973
u30:
	line	49
	
l2971:	
;MyKey.c: 47: {
;MyKey.c: 49: localCounter ++;
	incf	(_localCounter),f
	skipnz
	incf	(_localCounter+1),f
	line	50
;MyKey.c: 50: }
	goto	l1840
	line	54
	
l2973:	
;MyKey.c: 51: else
;MyKey.c: 52: {
;MyKey.c: 54: localCounter = 0;
	clrf	(_localCounter)
	clrf	(_localCounter+1)
	line	56
	
l1840:	
	return
	opt stack 0
GLOBAL	__end_of_doCount
	__end_of_doCount:
;; =============== function _doCount ends ============

	signat	_doCount,88
	global	_encodeTM1617
psect	text189,local,class=CODE,delta=2
global __ptext189
__ptext189:

;; *************** function _encodeTM1617 *****************
;; Defined at:
;;		line 113 in file "Tm1617.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned short 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON
;;      Params:         2
;;      Locals:         1
;;      Temps:          0
;;      Totals:         3
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printTM1617
;; This function uses a non-reentrant model
;;
psect	text189
	file	"Tm1617.c"
	line	113
	global	__size_of_encodeTM1617
	__size_of_encodeTM1617	equ	__end_of_encodeTM1617-_encodeTM1617
	
_encodeTM1617:	
	opt	stack 5
; Regs used in _encodeTM1617: [wreg-fsr0h+status,2+status,0]
;encodeTM1617@value stored from wreg
	movwf	(encodeTM1617@value)
	line	114
	
l2917:	
;Tm1617.c: 114: switch(value)
	goto	l2961
	line	118
	
l2919:	
;Tm1617.c: 118: return 0xF003;
	movlw	low(0F003h)
	movwf	(?_encodeTM1617)
	movlw	high(0F003h)
	movwf	((?_encodeTM1617))+1
	goto	l1372
	line	121
	
l2923:	
;Tm1617.c: 121: return 0x6000;
	movlw	low(06000h)
	movwf	(?_encodeTM1617)
	movlw	high(06000h)
	movwf	((?_encodeTM1617))+1
	goto	l1372
	line	124
	
l2927:	
;Tm1617.c: 124: return 0xB005;
	movlw	low(0B005h)
	movwf	(?_encodeTM1617)
	movlw	high(0B005h)
	movwf	((?_encodeTM1617))+1
	goto	l1372
	line	127
	
l2931:	
;Tm1617.c: 127: return 0xF004;
	movlw	low(0F004h)
	movwf	(?_encodeTM1617)
	movlw	high(0F004h)
	movwf	((?_encodeTM1617))+1
	goto	l1372
	line	130
	
l2935:	
;Tm1617.c: 130: return 0x6006;
	movlw	low(06006h)
	movwf	(?_encodeTM1617)
	movlw	high(06006h)
	movwf	((?_encodeTM1617))+1
	goto	l1372
	line	133
	
l2939:	
;Tm1617.c: 133: return 0xD006;
	movlw	low(0D006h)
	movwf	(?_encodeTM1617)
	movlw	high(0D006h)
	movwf	((?_encodeTM1617))+1
	goto	l1372
	line	136
	
l2943:	
;Tm1617.c: 136: return 0xD007;
	movlw	low(0D007h)
	movwf	(?_encodeTM1617)
	movlw	high(0D007h)
	movwf	((?_encodeTM1617))+1
	goto	l1372
	line	139
	
l2947:	
;Tm1617.c: 139: return 0x7000;
	movlw	low(07000h)
	movwf	(?_encodeTM1617)
	movlw	high(07000h)
	movwf	((?_encodeTM1617))+1
	goto	l1372
	line	142
	
l2951:	
;Tm1617.c: 142: return 0xF007;
	movlw	low(0F007h)
	movwf	(?_encodeTM1617)
	movlw	high(0F007h)
	movwf	((?_encodeTM1617))+1
	goto	l1372
	line	145
	
l2955:	
;Tm1617.c: 145: return 0xF006;
	movlw	low(0F006h)
	movwf	(?_encodeTM1617)
	movlw	high(0F006h)
	movwf	((?_encodeTM1617))+1
	goto	l1372
	line	114
	
l2961:	
	movf	(encodeTM1617@value),w
	; Switch size 1, requested type "space"
; Number of cases is 10, Range of values is 48 to 57
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           19     9 (fixed)
; simple_byte           31    16 (average)
; jumptable            263     9 (fixed)
;	Chosen strategy is direct_byte

	addlw	-48
	skipc
goto l2963
	movwf fsr
	movlw	10
	subwf	fsr,w
skipnc
goto l2963
movlw high(S3289)
movwf pclath
	movlw low(S3289)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S3289:
	ljmp	l2919
	ljmp	l2923
	ljmp	l2927
	ljmp	l2931
	ljmp	l2935
	ljmp	l2939
	ljmp	l2943
	ljmp	l2947
	ljmp	l2951
	ljmp	l2955
psect	text189

	line	149
	
l2963:	
;Tm1617.c: 149: return 0x0000;
	clrf	(?_encodeTM1617)
	clrf	(?_encodeTM1617+1)
	line	150
	
l1372:	
	return
	opt stack 0
GLOBAL	__end_of_encodeTM1617
	__end_of_encodeTM1617:
;; =============== function _encodeTM1617 ends ============

	signat	_encodeTM1617,4218
	global	_WriteTM1617
psect	text190,local,class=CODE,delta=2
global __ptext190
__ptext190:

;; *************** function _WriteTM1617 *****************
;; Defined at:
;;		line 45 in file "Tm1617.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1    2[COMMON] unsigned char 
;;  i               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         2
;;      Temps:          0
;;      Totals:         2
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisplayTM1617
;; This function uses a non-reentrant model
;;
psect	text190
	file	"Tm1617.c"
	line	45
	global	__size_of_WriteTM1617
	__size_of_WriteTM1617	equ	__end_of_WriteTM1617-_WriteTM1617
	
_WriteTM1617:	
	opt	stack 4
; Regs used in _WriteTM1617: [wreg+status,2+status,0]
;WriteTM1617@value stored from wreg
	line	47
	movwf	(WriteTM1617@value)
	
l2905:	
;Tm1617.c: 46: unsigned char i;
;Tm1617.c: 47: for(i=0;i<8;i++)
	clrf	(WriteTM1617@i)
	line	48
	
l1358:	
	line	49
;Tm1617.c: 48: {
;Tm1617.c: 49: PA4=0;
	bcf	(44/8),(44)&7
	line	50
;Tm1617.c: 50: if((value & 0x01) == 0){
	btfsc	(WriteTM1617@value),(0)&7
	goto	u11
	goto	u10
u11:
	goto	l1360
u10:
	line	51
	
l2911:	
;Tm1617.c: 51: PA2=0;
	bcf	(42/8),(42)&7
	line	52
;Tm1617.c: 52: }
	goto	l1361
	line	53
	
l1360:	
	line	54
;Tm1617.c: 53: else{
;Tm1617.c: 54: PA2=1;
	bsf	(42/8),(42)&7
	line	55
	
l1361:	
	line	56
;Tm1617.c: 55: }
;Tm1617.c: 56: PA4=1;
	bsf	(44/8),(44)&7
	line	57
;Tm1617.c: 57: value >>= 1;
	clrc
	rrf	(WriteTM1617@value),f
	line	47
	
l2913:	
	incf	(WriteTM1617@i),f
	
l2915:	
	movlw	(08h)
	subwf	(WriteTM1617@i),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l1358
u20:
	line	59
	
l1362:	
	return
	opt stack 0
GLOBAL	__end_of_WriteTM1617
	__end_of_WriteTM1617:
;; =============== function _WriteTM1617 ends ============

	signat	_WriteTM1617,4216
	global	_getCounter
psect	text191,local,class=CODE,delta=2
global __ptext191
__ptext191:

;; *************** function _getCounter *****************
;; Defined at:
;;		line 34 in file "MyKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned short 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON
;;      Params:         2
;;      Locals:         0
;;      Temps:          0
;;      Totals:         2
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text191
	file	"MyKey.c"
	line	34
	global	__size_of_getCounter
	__size_of_getCounter	equ	__end_of_getCounter-_getCounter
	
_getCounter:	
	opt	stack 6
; Regs used in _getCounter: [wreg]
	line	36
	
l2901:	
;MyKey.c: 36: return localCounter;
	movf	(_localCounter+1),w
	movwf	(?_getCounter+1)
	movf	(_localCounter),w
	movwf	(?_getCounter)
	line	37
	
l1832:	
	return
	opt stack 0
GLOBAL	__end_of_getCounter
	__end_of_getCounter:
;; =============== function _getCounter ends ============

	signat	_getCounter,90
	global	_resetCounter
psect	text192,local,class=CODE,delta=2
global __ptext192
__ptext192:

;; *************** function _resetCounter *****************
;; Defined at:
;;		line 39 in file "MyKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         0
;;      Temps:          0
;;      Totals:         0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text192
	file	"MyKey.c"
	line	39
	global	__size_of_resetCounter
	__size_of_resetCounter	equ	__end_of_resetCounter-_resetCounter
	
_resetCounter:	
	opt	stack 6
; Regs used in _resetCounter: [status,2]
	line	41
	
l2899:	
;MyKey.c: 41: localCounter = 0;
	clrf	(_localCounter)
	clrf	(_localCounter+1)
	line	42
	
l1835:	
	return
	opt stack 0
GLOBAL	__end_of_resetCounter
	__end_of_resetCounter:
;; =============== function _resetCounter ends ============

	signat	_resetCounter,88
	global	_isKeyPressed
psect	text193,local,class=CODE,delta=2
global __ptext193
__ptext193:

;; *************** function _isKeyPressed *****************
;; Defined at:
;;		line 22 in file "MyKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         0
;;      Temps:          0
;;      Totals:         0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text193
	file	"MyKey.c"
	line	22
	global	__size_of_isKeyPressed
	__size_of_isKeyPressed	equ	__end_of_isKeyPressed-_isKeyPressed
	
_isKeyPressed:	
	opt	stack 6
; Regs used in _isKeyPressed: [wreg+status,2+status,0]
	line	23
	
l2895:	
;MyKey.c: 23: return (PA1==0) ? 1:0;
	clrc
	bcf	status, 5	;RP0=0, select bank0
	btfss	(41/8),(41)&7
	setc
	movlw	0
	skipnc
	movlw	1

	line	24
	
l1829:	
	return
	opt stack 0
GLOBAL	__end_of_isKeyPressed
	__end_of_isKeyPressed:
;; =============== function _isKeyPressed ends ============

	signat	_isKeyPressed,89
	global	_GPIO_Init
psect	text194,local,class=CODE,delta=2
global __ptext194
__ptext194:

;; *************** function _GPIO_Init *****************
;; Defined at:
;;		line 22 in file "MyConfiguration.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         0
;;      Temps:          0
;;      Totals:         0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text194
	file	"MyConfiguration.c"
	line	22
	global	__size_of_GPIO_Init
	__size_of_GPIO_Init	equ	__end_of_GPIO_Init-_GPIO_Init
	
_GPIO_Init:	
	opt	stack 6
; Regs used in _GPIO_Init: []
	line	24
	
l2893:	
;MyConfiguration.c: 24: TRISA0=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	25
;MyConfiguration.c: 25: TRISA1=1;
	bsf	(1065/8)^080h,(1065)&7
	line	26
;MyConfiguration.c: 26: TRISA2=0;
	bcf	(1066/8)^080h,(1066)&7
	line	27
;MyConfiguration.c: 27: TRISA4=0;
	bcf	(1068/8)^080h,(1068)&7
	line	28
;MyConfiguration.c: 28: TRISA5=0;
	bcf	(1069/8)^080h,(1069)&7
	line	30
;MyConfiguration.c: 30: WPUA0=0;
	bcf	(1192/8)^080h,(1192)&7
	line	31
;MyConfiguration.c: 31: WPUA1=1;
	bsf	(1193/8)^080h,(1193)&7
	line	32
;MyConfiguration.c: 32: WPUA2=1;
	bsf	(1194/8)^080h,(1194)&7
	line	33
;MyConfiguration.c: 33: WPUA4=1;
	bsf	(1196/8)^080h,(1196)&7
	line	34
;MyConfiguration.c: 34: WPUA5=1;
	bsf	(1197/8)^080h,(1197)&7
	line	35
	
l903:	
	return
	opt stack 0
GLOBAL	__end_of_GPIO_Init
	__end_of_GPIO_Init:
;; =============== function _GPIO_Init ends ============

	signat	_GPIO_Init,88
	global	_System_init
psect	text195,local,class=CODE,delta=2
global __ptext195
__ptext195:

;; *************** function _System_init *****************
;; Defined at:
;;		line 14 in file "MyConfiguration.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         0
;;      Temps:          0
;;      Totals:         0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text195
	file	"MyConfiguration.c"
	line	14
	global	__size_of_System_init
	__size_of_System_init	equ	__end_of_System_init-_System_init
	
_System_init:	
	opt	stack 6
; Regs used in _System_init: [wreg+status,2]
	line	15
	
l2887:	
;MyConfiguration.c: 15: OPTION = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(129)^080h	;volatile
	line	16
	
l2889:	
;MyConfiguration.c: 16: OSCCON = 0B01010000;
	movlw	(050h)
	movwf	(143)^080h	;volatile
	line	17
	
l2891:	
;MyConfiguration.c: 17: WDTCON = 0B00001001;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	line	18
	
l900:	
	return
	opt stack 0
GLOBAL	__end_of_System_init
	__end_of_System_init:
;; =============== function _System_init ends ============

	signat	_System_init,88
	global	_ISR
psect	text196,local,class=CODE,delta=2
global __ptext196
__ptext196:

;; *************** function _ISR *****************
;; Defined at:
;;		line 66 in file "Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON
;;      Params:         0
;;      Locals:         0
;;      Temps:          2
;;      Totals:         2
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text196
	file	"Main.c"
	line	66
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 4
; Regs used in _ISR: []
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text196
	line	68
	
i1l467:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text197,local,class=CODE,delta=2
global __ptext197
__ptext197:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
