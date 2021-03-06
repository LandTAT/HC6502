;
; File generated by cc65 v 2.17 - Git e1e5cd9
;
	.fopt		compiler,"cc65 v 2.17 - Git e1e5cd9"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.import		_strtoul
	.import		_strcmp
	.import		_strlen
	.import		_memset
	.import		_uart_printf
	.import		_gpio_init
	.import		_gpio_write
	.import		_gpio_read
	.import		_ps2_process
	.import		_vga_ctrl
	.export		_shell_cmd
	.export		_argc
	.export		_argv
	.export		_ci
	.export		_cook
	.export		_gi
	.export		_gi_get
	.export		_shell

.segment	"DATA"

_shell_cmd:
	.word	$0000
_argv:
	.word	$0000
	.res	10,$00
_ci:
	.addr	L000E
	.addr	_cmd_read
	.addr	L0011
	.addr	L0013
	.addr	_cmd_write
	.addr	L0016
	.addr	L0018
	.addr	_cmd_exec
	.addr	L001B
	.addr	L001D
	.addr	_cmd_dumpw
	.addr	L0020
	.addr	L0022
	.addr	_cmd_dumpb
	.addr	L0025
	.addr	L0027
	.addr	_cmd_gpio
	.addr	L002A
	.addr	L002C
	.addr	_cmd_ps2
	.addr	L002F
	.addr	L0031
	.addr	_cmd_vga
	.addr	L0034
	.addr	L0036
	.addr	_cmd_help
	.addr	L0039
_gi:
	.byte	$56,$49,$41,$31,$5F,$50,$41,$30,$00
	.res	7,$00
	.dword	$7F2000A0
	.byte	$56,$49,$41,$31,$5F,$50,$41,$31,$00
	.res	7,$00
	.dword	$7F2000A1
	.byte	$56,$49,$41,$31,$5F,$50,$41,$32,$00
	.res	7,$00
	.dword	$7F2000A2
	.byte	$56,$49,$41,$31,$5F,$50,$41,$33,$00
	.res	7,$00
	.dword	$7F2000A3
	.byte	$56,$49,$41,$31,$5F,$50,$41,$34,$00
	.res	7,$00
	.dword	$7F2000A4
	.byte	$56,$49,$41,$31,$5F,$50,$41,$35,$00
	.res	7,$00
	.dword	$7F2000A5
	.byte	$56,$49,$41,$31,$5F,$50,$41,$36,$00
	.res	7,$00
	.dword	$7F2000A6
	.byte	$56,$49,$41,$31,$5F,$50,$41,$37,$00
	.res	7,$00
	.dword	$7F2000A7
	.byte	$56,$49,$41,$31,$5F,$50,$42,$30,$00
	.res	7,$00
	.dword	$7F2000B0
	.byte	$56,$49,$41,$31,$5F,$50,$42,$31,$00
	.res	7,$00
	.dword	$7F2000B1
	.byte	$56,$49,$41,$31,$5F,$50,$42,$32,$00
	.res	7,$00
	.dword	$7F2000B2
	.byte	$56,$49,$41,$31,$5F,$50,$42,$33,$00
	.res	7,$00
	.dword	$7F2000B3
	.byte	$56,$49,$41,$31,$5F,$50,$42,$34,$00
	.res	7,$00
	.dword	$7F2000B4
	.byte	$56,$49,$41,$31,$5F,$50,$42,$35,$00
	.res	7,$00
	.dword	$7F2000B5
	.byte	$56,$49,$41,$31,$5F,$50,$42,$36,$00
	.res	7,$00
	.dword	$7F2000B6
	.byte	$56,$49,$41,$31,$5F,$50,$42,$37,$00
	.res	7,$00
	.dword	$7F2000B7
	.byte	$56,$49,$41,$32,$5F,$50,$41,$30,$00
	.res	7,$00
	.dword	$7F4000A0
	.byte	$56,$49,$41,$32,$5F,$50,$41,$31,$00
	.res	7,$00
	.dword	$7F4000A1
	.byte	$56,$49,$41,$32,$5F,$50,$41,$32,$00
	.res	7,$00
	.dword	$7F4000A2
	.byte	$56,$49,$41,$32,$5F,$50,$41,$33,$00
	.res	7,$00
	.dword	$7F4000A3
	.byte	$56,$49,$41,$32,$5F,$50,$41,$34,$00
	.res	7,$00
	.dword	$7F4000A4
	.byte	$56,$49,$41,$32,$5F,$50,$41,$35,$00
	.res	7,$00
	.dword	$7F4000A5
	.byte	$56,$49,$41,$32,$5F,$50,$41,$36,$00
	.res	7,$00
	.dword	$7F4000A6
	.byte	$56,$49,$41,$32,$5F,$50,$41,$37,$00
	.res	7,$00
	.dword	$7F4000A7
	.byte	$56,$49,$41,$32,$5F,$50,$42,$30,$00
	.res	7,$00
	.dword	$7F4000B0
	.byte	$56,$49,$41,$32,$5F,$50,$42,$31,$00
	.res	7,$00
	.dword	$7F4000B1
	.byte	$56,$49,$41,$32,$5F,$50,$42,$32,$00
	.res	7,$00
	.dword	$7F4000B2
	.byte	$56,$49,$41,$32,$5F,$50,$42,$33,$00
	.res	7,$00
	.dword	$7F4000B3
	.byte	$56,$49,$41,$32,$5F,$50,$42,$34,$00
	.res	7,$00
	.dword	$7F4000B4
	.byte	$56,$49,$41,$32,$5F,$50,$42,$35,$00
	.res	7,$00
	.dword	$7F4000B5
	.byte	$56,$49,$41,$32,$5F,$50,$42,$36,$00
	.res	7,$00
	.dword	$7F4000B6
	.byte	$56,$49,$41,$32,$5F,$50,$42,$37,$00
	.res	7,$00
	.dword	$7F4000B7

.segment	"RODATA"

L0011:
	.byte	$72,$20,$20,$20,$20,$20,$5B,$61,$64,$64,$72,$5D,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$72,$65,$61,$64,$20,$20,$20,$20,$61,$6E
	.byte	$79,$20,$61,$64,$64,$72,$00
L0025:
	.byte	$64,$75,$6D,$70,$62,$20,$5B,$61,$64,$64,$72,$5D,$20,$5B,$62,$79
	.byte	$74,$65,$5F,$6E,$75,$6D,$5D,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$64,$75,$6D,$70,$20,$20,$20,$20,$61,$6E
	.byte	$79,$20,$61,$64,$64,$72,$00
L0016:
	.byte	$77,$20,$20,$20,$20,$20,$5B,$61,$64,$64,$72,$5D,$20,$5B,$64,$61
	.byte	$74,$61,$5D,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$77,$72,$69,$74,$65,$20,$20,$20,$61,$6E
	.byte	$79,$20,$61,$64,$64,$72,$00
L001B:
	.byte	$78,$20,$20,$20,$20,$20,$5B,$61,$64,$64,$72,$5D,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$65,$78,$65,$63,$75,$74,$65,$20,$61,$6E
	.byte	$79,$20,$61,$64,$64,$72,$00
L0020:
	.byte	$64,$75,$6D,$70,$77,$20,$5B,$61,$64,$64,$72,$5D,$20,$5B,$77,$6F
	.byte	$72,$64,$5F,$6E,$75,$6D,$5D,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$64,$75,$6D,$70,$20,$20,$20,$20,$61,$6E
	.byte	$79,$20,$61,$64,$64,$72,$00
L002F:
	.byte	$70,$73,$32,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$72,$65,$61,$64,$20,$70,$73,$32,$20,$69
	.byte	$6E,$70,$75,$74,$00
L0039:
	.byte	$68,$65,$6C,$70,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$70,$72,$69,$6E,$74,$20,$63,$6D,$64,$20
	.byte	$69,$6E,$66,$6F,$00
L002A:
	.byte	$67,$70,$69,$6F,$20,$20,$69,$6E,$69,$74,$7C,$72,$65,$61,$64,$7C
	.byte	$77,$72,$69,$74,$65,$20,$5B,$56,$49,$41,$31,$5F,$50,$41,$30,$2E
	.byte	$2E,$2E,$5D,$20,$20,$20,$63,$74,$72,$6C,$20,$61,$6E,$79,$20,$67
	.byte	$70,$69,$6F,$00
L0034:
	.byte	$76,$67,$61,$20,$20,$20,$63,$6D,$64,$20,$61,$72,$67,$73,$2E,$2E
	.byte	$2E,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$76,$67,$61,$20,$63,$74,$72,$6C,$00
L00A5:
	.byte	$65,$78,$65,$63,$20,$30,$78,$25,$78,$20,$28,$30,$78,$25,$78,$20
	.byte	$30,$78,$25,$78,$20,$30,$78,$25,$78,$20,$30,$78,$25,$78,$29,$20
	.byte	$72,$65,$74,$75,$72,$6E,$20,$30,$78,$25,$78,$0D,$0A,$00
L0246:
	.byte	$67,$70,$69,$6F,$20,$69,$6E,$69,$74,$20,$5B,$67,$70,$69,$6F,$5F
	.byte	$6E,$75,$6D,$5D,$20,$5B,$69,$6E,$7C,$6F,$75,$74,$5D,$0D,$0A,$00
L0235:
	.byte	$75,$6E,$6B,$6E,$6F,$77,$6E,$20,$67,$70,$69,$6F,$20,$6E,$75,$6D
	.byte	$20,$5B,$25,$73,$5D,$0D,$0A,$00
L0271:
	.byte	$67,$70,$69,$6F,$20,$72,$65,$61,$64,$20,$72,$65,$74,$75,$72,$6E
	.byte	$20,$25,$64,$0D,$0A,$00
L0260:
	.byte	$75,$6E,$6B,$6E,$6F,$77,$6E,$20,$6D,$6F,$64,$65,$20,$5B,$25,$73
	.byte	$5D,$0D,$0A,$00
L0350:
	.byte	$69,$6C,$6C,$65,$67,$61,$6C,$20,$63,$6D,$64,$20,$5B,$25,$73,$5D
	.byte	$20,$0D,$0A,$00
L0077:
	.byte	$5B,$30,$78,$25,$78,$5D,$20,$3C,$2D,$20,$28,$30,$78,$25,$78,$29
	.byte	$0D,$0A,$00
L02A2:
	.byte	$76,$67,$61,$20,$63,$6C,$65,$61,$72,$20,$65,$6E,$64,$20,$20,$0D
	.byte	$0A,$00
L029D:
	.byte	$76,$67,$61,$20,$63,$6C,$65,$61,$72,$20,$73,$74,$61,$72,$74,$0D
	.byte	$0A,$00
L012A:
	.byte	$0D,$0A,$5B,$30,$78,$25,$30,$34,$78,$5D,$3A,$20,$00
L00D6	:=	L012A+0
L035B:
	.byte	$72,$65,$74,$75,$72,$6E,$20,$30,$78,$25,$78,$00
L00BF	:=	L012A+2
L00FB	:=	L012A+2
L02E3:
	.byte	$25,$73,$3A,$09,$09,$25,$73,$0D,$0A,$00
L0043:
	.byte	$5B,$30,$78,$25,$78,$5D,$3A,$20,$00
L00CB:
	.byte	$30,$78,$25,$30,$34,$78,$20,$00
L0360:
	.byte	$0D,$0A,$68,$63,$6F,$73,$23,$00
L004C	:=	L00A5+39
L0022:
	.byte	$64,$75,$6D,$70,$62,$00
L0299:
	.byte	$63,$6C,$65,$61,$72,$00
L0141:
	.byte	$25,$30,$32,$78,$20,$00
L0279:
	.byte	$77,$72,$69,$74,$65,$00
L001D:
	.byte	$64,$75,$6D,$70,$77,$00
L0114	:=	L0141+0
L02A9:
	.byte	$66,$69,$6C,$6C,$00
L0027	:=	L002A+47
L023E:
	.byte	$69,$6E,$69,$74,$00
L0036:
	.byte	$68,$65,$6C,$70,$00
L026A:
	.byte	$72,$65,$61,$64,$00
L0258:
	.byte	$6F,$75,$74,$00
L0031:
	.byte	$76,$67,$61,$00
L014A:
	.byte	$20,$20,$20,$00
L002C:
	.byte	$70,$73,$32,$00
L02BA:
	.byte	$73,$65,$74,$00
L0345	:=	L00A5+43
L028E	:=	L00A5+43
L00DB	:=	L00A5+43
L014D	:=	L014A+1
L0124:
	.byte	$25,$63,$00
L015E	:=	L00A5+43
L024D:
	.byte	$69,$6E,$00
L0119	:=	L014A+1
L0158	:=	L0124+0
L0018	:=	L035B+10
L0013	:=	L001D+4
L0283:
	.byte	$30,$00
L000E	:=	L0011+53

.segment	"BSS"

_argc:
	.res	1,$00

; ---------------------------------------------------------------
; long __near__ cmd_read (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cmd_read: near

.segment	"CODE"

	jsr     decsp3
	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$01
	jsr     staxysp
	lda     #<(L0043)
	ldx     #>(L0043)
	jsr     pushax
	ldy     #$06
	jsr     pushwysp
	ldy     #$04
	jsr     _uart_printf
	ldy     #$02
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	sta     (sp),y
	lda     #<(L004C)
	ldx     #>(L004C)
	jsr     pushax
	ldy     #$02
	lda     (sp),y
	jsr     pusha0
	ldy     #$04
	jsr     _uart_printf
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	jmp     incsp3

.endproc

; ---------------------------------------------------------------
; long __near__ cmd_write (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cmd_write: near

.segment	"CODE"

	jsr     decsp7
	ldx     #$00
	lda     _argc
	cmp     #$03
	bcs     L0363
	dex
	stx     sreg
	stx     sreg+1
	txa
	jmp     incsp7
L0363:	lda     _argc
	jsr     decax2
	ldy     #$01
	jsr     staxysp
	cpx     #$00
	bne     L0058
	cmp     #$11
L0058:	bcs     L0059
	ldy     #$02
	jsr     ldaxysp
	jmp     L005B
L0059:	ldx     #$00
	lda     #$10
L005B:	ldy     #$01
	jsr     staxysp
	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$03
	jsr     staxysp
	ldx     #$00
	txa
L0365:	ldy     #$05
	jsr     staxysp
	ldy     #$01
	cmp     (sp),y
	txa
	iny
	sbc     (sp),y
	bcs     L0064
	ldy     #$06
	jsr     ldaxysp
	jsr     incax2
	jsr     aslax1
	clc
	adc     #<(_argv)
	tay
	txa
	adc     #>(_argv)
	tax
	tya
	jsr     pushw
	jsr     push0
	jsr     _strtoul
	ldy     #$00
	sta     (sp),y
	ldy     #$06
	jsr     ldaxysp
	clc
	ldy     #$03
	adc     (sp),y
	sta     ptr1
	txa
	iny
	adc     (sp),y
	sta     ptr1+1
	ldy     #$00
	lda     (sp),y
	sta     (ptr1),y
	lda     #<(L0077)
	ldx     #>(L0077)
	jsr     pushax
	ldy     #$08
	jsr     ldaxysp
	clc
	ldy     #$05
	adc     (sp),y
	pha
	txa
	iny
	adc     (sp),y
	tax
	pla
	jsr     pushax
	ldy     #$04
	lda     (sp),y
	jsr     pusha0
	ldy     #$06
	jsr     _uart_printf
	ldy     #$06
	jsr     ldaxysp
	jsr     incax1
	jmp     L0365
L0064:	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	jmp     incsp7

.endproc

; ---------------------------------------------------------------
; long __near__ cmd_exec (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cmd_exec: near

.segment	"CODE"

	ldy     #$10
	jsr     subysp
	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$0A
	jsr     staxysp
	lda     _argv+4
	ldx     _argv+4+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$08
	jsr     staxysp
	lda     _argv+6
	ldx     _argv+6+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$06
	jsr     staxysp
	lda     _argv+8
	ldx     _argv+8+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$04
	jsr     staxysp
	lda     _argv+10
	ldx     _argv+10+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$02
	jsr     staxysp
	ldy     #$0B
	jsr     ldaxysp
	jsr     stax0sp
	jsr     pushax
	ldy     #$0D
	jsr     pushwysp
	ldy     #$0D
	jsr     pushwysp
	ldy     #$0D
	jsr     pushwysp
	ldy     #$0D
	jsr     pushwysp
	ldy     #$09
	jsr     ldaxysp
	jsr     callax
	jsr     incsp2
	ldy     #$0C
	jsr     steaxysp
	lda     #<(L00A5)
	ldx     #>(L00A5)
	jsr     pushax
	ldy     #$0F
	jsr     pushwysp
	ldy     #$0F
	jsr     pushwysp
	ldy     #$0F
	jsr     pushwysp
	ldy     #$0F
	jsr     pushwysp
	ldy     #$0F
	jsr     pushwysp
	ldy     #$1B
	jsr     ldeaxysp
	jsr     pusheax
	ldy     #$10
	jsr     _uart_printf
	ldy     #$0F
	jsr     ldeaxysp
	ldy     #$10
	jmp     addysp

.endproc

; ---------------------------------------------------------------
; long __near__ cmd_dumpw (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cmd_dumpw: near

.segment	"CODE"

	ldy     #$0A
	jsr     subysp
	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$02
	jsr     staxysp
	lda     _argv+4
	ldx     _argv+4+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	jsr     stax0sp
	ldy     #$03
	jsr     ldaxysp
	ldy     #$04
	jsr     staxysp
	lda     #<(L00BF)
	ldx     #>(L00BF)
	jsr     pushax
	ldy     #$09
	jsr     pushwysp
	ldy     #$04
	jsr     _uart_printf
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	ldy     #$06
	jsr     steaxysp
L00C3:	ldy     #$09
	jsr     ldeaxysp
	jsr     pusheax
	ldy     #$05
	jsr     ldaxysp
	jsr     axulong
	jsr     tosulteax
	beq     L00C4
	lda     #<(L00CB)
	ldx     #>(L00CB)
	jsr     pushax
	ldy     #$09
	jsr     pushwysp
	ldy     #$0D
	jsr     ldeaxysp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	ldy     #$0A
	jsr     steaxysp
	jsr     resteax
	jsr     aslax1
	jsr     tosaddax
	jsr     pushw
	ldy     #$04
	jsr     _uart_printf
	ldy     #$09
	jsr     ldeaxysp
	jsr     pusheax
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	jsr     tosneeax
	beq     L00C3
	ldy     #$09
	jsr     ldeaxysp
	ldx     #$00
	and     #$03
	jsr     push0ax
	txa
	jsr     toseqeax
	beq     L00C3
	lda     #<(L00D6)
	ldx     #>(L00D6)
	jsr     pushax
	ldy     #$09
	jsr     pushwysp
	ldy     #$0D
	jsr     ldeaxysp
	jsr     aslax1
	jsr     tosaddax
	jsr     pushax
	ldy     #$04
	jsr     _uart_printf
	jmp     L00C3
L00C4:	lda     #<(L00DB)
	ldx     #>(L00DB)
	jsr     pushax
	ldy     #$02
	jsr     _uart_printf
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	ldy     #$0A
	jmp     addysp

.endproc

; ---------------------------------------------------------------
; long __near__ cmd_dumpb (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cmd_dumpb: near

.segment	"CODE"

	ldy     #$22
	jsr     subysp
	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$06
	jsr     staxysp
	lda     _argv+4
	ldx     _argv+4+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$04
	jsr     staxysp
	ldy     #$07
	jsr     ldaxysp
	ldy     #$18
	jsr     staxysp
	ldy     #$05
	jsr     ldaxysp
	jsr     shrax4
	ldy     #$02
	jsr     staxysp
	ldy     #$04
	lda     (sp),y
	ldx     #$00
	and     #$0F
	jsr     stax0sp
	lda     #<(L00FB)
	ldx     #>(L00FB)
	jsr     pushax
	ldy     #$1D
	jsr     pushwysp
	ldy     #$04
	jsr     _uart_printf
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	ldy     #$1E
	jsr     steaxysp
L00FF:	ldy     #$21
	jsr     ldeaxysp
	jsr     pusheax
	ldy     #$07
	jsr     ldaxysp
	jsr     axulong
	jsr     tosulteax
	jeq     L0100
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	ldy     #$1A
	jsr     steaxysp
L0107:	ldy     #$1D
	jsr     ldeaxysp
	cmp     #$10
	txa
	sbc     #$00
	lda     sreg
	sbc     #$00
	lda     sreg+1
	sbc     #$00
	bcs     L0108
	lda     #$08
	jsr     leaa0sp
	ldy     #$1A
	clc
	adc     (sp),y
	pha
	txa
	iny
	adc     (sp),y
	tax
	pla
	jsr     pushax
	ldy     #$1D
	jsr     pushwysp
	ldy     #$25
	jsr     ldeaxysp
	jsr     shleax4
	jsr     pusheax
	ldy     #$25
	jsr     ldeaxysp
	jsr     tosaddeax
	jsr     tosaddax
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     staspidx
	lda     #<(L0114)
	ldx     #>(L0114)
	jsr     pushax
	lda     #$0A
	jsr     leaa0sp
	ldy     #$1C
	clc
	adc     (sp),y
	sta     ptr1
	txa
	iny
	adc     (sp),y
	sta     ptr1+1
	ldx     #$00
	lda     (ptr1,x)
	jsr     pusha0
	ldy     #$04
	jsr     _uart_printf
	ldy     #$1D
	jsr     ldeaxysp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	ldy     #$1A
	jsr     steaxysp
	jsr     resteax
	jmp     L0107
L0108:	lda     #<(L0119)
	ldx     #>(L0119)
	jsr     pushax
	ldy     #$02
	jsr     _uart_printf
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	ldy     #$1A
	jsr     steaxysp
L011B:	ldy     #$1D
	jsr     ldeaxysp
	cmp     #$10
	txa
	sbc     #$00
	lda     sreg
	sbc     #$00
	lda     sreg+1
	sbc     #$00
	bcs     L011C
	lda     #<(L0124)
	ldx     #>(L0124)
	jsr     pushax
	lda     #$0A
	jsr     leaa0sp
	ldy     #$1C
	clc
	adc     (sp),y
	sta     ptr1
	txa
	iny
	adc     (sp),y
	sta     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     pusha
	jsr     _cook
	jsr     pushax
	ldy     #$04
	jsr     _uart_printf
	ldy     #$1D
	jsr     ldeaxysp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	ldy     #$1A
	jsr     steaxysp
	jsr     resteax
	jmp     L011B
L011C:	lda     #<(L012A)
	ldx     #>(L012A)
	jsr     pushax
	ldy     #$1D
	jsr     pushwysp
	ldy     #$25
	jsr     ldeaxysp
	ldy     #$01
	jsr     inceaxy
	jsr     shleax4
	jsr     tosaddax
	jsr     pushax
	ldy     #$04
	jsr     _uart_printf
	ldy     #$21
	jsr     ldeaxysp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	ldy     #$1E
	jsr     steaxysp
	jsr     resteax
	jmp     L00FF
L0100:	ldy     #$00
	lda     (sp),y
	iny
	ora     (sp),y
	jeq     L0150
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	ldy     #$1A
	jsr     steaxysp
L0132:	ldy     #$1D
	jsr     ldeaxysp
	cmp     #$10
	txa
	sbc     #$00
	lda     sreg
	sbc     #$00
	lda     sreg+1
	sbc     #$00
	jcs     L0133
	ldy     #$1D
	jsr     ldeaxysp
	jsr     pusheax
	ldy     #$05
	jsr     ldaxysp
	jsr     axulong
	jsr     tosulteax
	beq     L013A
	lda     #$08
	jsr     leaa0sp
	ldy     #$1A
	clc
	adc     (sp),y
	pha
	txa
	iny
	adc     (sp),y
	tax
	pla
	jsr     pushax
	ldy     #$1D
	jsr     pushwysp
	ldy     #$25
	jsr     ldeaxysp
	jsr     shleax4
	jsr     pusheax
	ldy     #$25
	jsr     ldeaxysp
	jsr     tosaddeax
	jsr     tosaddax
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     staspidx
	lda     #<(L0141)
	ldx     #>(L0141)
	jsr     pushax
	lda     #$0A
	jsr     leaa0sp
	ldy     #$1C
	clc
	adc     (sp),y
	sta     ptr1
	txa
	iny
	adc     (sp),y
	sta     ptr1+1
	ldx     #$00
	lda     (ptr1,x)
	jsr     pusha0
	ldy     #$04
	jmp     L0366
L013A:	lda     #$08
	jsr     leaa0sp
	ldy     #$1A
	clc
	adc     (sp),y
	sta     ptr1
	txa
	iny
	adc     (sp),y
	sta     ptr1+1
	lda     #$20
	ldy     #$00
	sta     (ptr1),y
	lda     #<(L014A)
	ldx     #>(L014A)
	jsr     pushax
	ldy     #$02
L0366:	jsr     _uart_printf
	ldy     #$1D
	jsr     ldeaxysp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	ldy     #$1A
	jsr     steaxysp
	jsr     resteax
	jmp     L0132
L0133:	lda     #<(L014D)
	ldx     #>(L014D)
	jsr     pushax
	ldy     #$02
	jsr     _uart_printf
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	ldy     #$1A
	jsr     steaxysp
L014F:	ldy     #$1D
	jsr     ldeaxysp
	cmp     #$10
	txa
	sbc     #$00
	lda     sreg
	sbc     #$00
	lda     sreg+1
	sbc     #$00
	bcs     L0150
	lda     #<(L0158)
	ldx     #>(L0158)
	jsr     pushax
	lda     #$0A
	jsr     leaa0sp
	ldy     #$1C
	clc
	adc     (sp),y
	sta     ptr1
	txa
	iny
	adc     (sp),y
	sta     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     pusha
	jsr     _cook
	jsr     pushax
	ldy     #$04
	jsr     _uart_printf
	ldy     #$1D
	jsr     ldeaxysp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	ldy     #$1A
	jsr     steaxysp
	jsr     resteax
	jmp     L014F
L0150:	lda     #<(L015E)
	ldx     #>(L015E)
	jsr     pushax
	ldy     #$02
	jsr     _uart_printf
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	ldy     #$22
	jmp     addysp

.endproc

; ---------------------------------------------------------------
; long __near__ cmd_gpio (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cmd_gpio: near

.segment	"CODE"

	jsr     decsp3
	lda     _argv+4
	ldx     _argv+4+1
	jsr     pushax
	jsr     _gi_get
	ldy     #$01
	jsr     staxysp
	cpx     #$00
	bne     L0231
	cmp     #$00
	bne     L0231
	lda     #<(L0235)
	ldx     #>(L0235)
	jsr     pushax
	lda     _argv+4
	ldx     _argv+4+1
	jsr     pushax
	ldy     #$04
	jsr     _uart_printf
	ldx     #$FF
	stx     sreg
	stx     sreg+1
	txa
	jmp     incsp3
L0231:	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	lda     #<(L023E)
	ldx     #>(L023E)
	jsr     _strcmp
	cpx     #$00
	jne     L023A
	cmp     #$00
	jne     L023A
	lda     _argv+6
	ora     _argv+6+1
	bne     L0241
	lda     #<(L0246)
	ldx     #>(L0246)
	jsr     pushax
	ldy     #$02
	jsr     _uart_printf
	ldx     #$FF
	stx     sreg
	stx     sreg+1
	txa
	jmp     incsp3
L0241:	lda     _argv+6
	ldx     _argv+6+1
	jsr     pushax
	lda     #<(L024D)
	ldx     #>(L024D)
	jsr     _strcmp
	cpx     #$00
	bne     L0249
	cmp     #$00
	bne     L0249
	ldy     #$02
	jsr     ldaxysp
	ldy     #$13
	jsr     ldeaxidx
	jsr     pusheax
	lda     #$00
	jsr     pusha
	jsr     _gpio_init
	jmp     L0289
L0249:	lda     _argv+6
	ldx     _argv+6+1
	jsr     pushax
	lda     #<(L0258)
	ldx     #>(L0258)
	jsr     _strcmp
	cpx     #$00
	bne     L0254
	cmp     #$00
	bne     L0254
	ldy     #$02
	jsr     ldaxysp
	ldy     #$13
	jsr     ldeaxidx
	jsr     pusheax
	lda     #$01
	jsr     pusha
	jsr     _gpio_init
	jmp     L0289
L0254:	lda     #<(L0260)
	ldx     #>(L0260)
	jsr     pushax
	lda     _argv+6
	ldx     _argv+6+1
	jsr     pushax
	ldy     #$04
	jsr     _uart_printf
	ldx     #$FF
	stx     sreg
	stx     sreg+1
	txa
	jmp     incsp3
L023A:	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	lda     #<(L026A)
	ldx     #>(L026A)
	jsr     _strcmp
	cpx     #$00
	bne     L0266
	cmp     #$00
	bne     L0266
	ldy     #$02
	jsr     ldaxysp
	ldy     #$13
	jsr     ldeaxidx
	jsr     pusheax
	jsr     _gpio_read
	ldy     #$00
	sta     (sp),y
	lda     #<(L0271)
	ldx     #>(L0271)
	jsr     pushax
	ldy     #$02
	lda     (sp),y
	jsr     pusha0
	ldy     #$04
	jsr     _uart_printf
	jmp     L0289
L0266:	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	lda     #<(L0279)
	ldx     #>(L0279)
	jsr     _strcmp
	cpx     #$00
	bne     L0289
	cmp     #$00
	bne     L0289
	ldy     #$02
	jsr     ldaxysp
	ldy     #$13
	jsr     ldeaxidx
	jsr     pusheax
	lda     #$01
	jsr     pusha
	jsr     _gpio_init
	lda     _argv+6
	ldx     _argv+6+1
	jsr     pushax
	lda     #<(L0283)
	ldx     #>(L0283)
	jsr     _strcmp
	cpx     #$00
	bne     L027F
	cmp     #$00
	bne     L027F
	ldy     #$02
	jsr     ldaxysp
	ldy     #$13
	jsr     ldeaxidx
	jsr     pusheax
	lda     #$00
	jmp     L0368
L027F:	ldy     #$02
	jsr     ldaxysp
	ldy     #$13
	jsr     ldeaxidx
	jsr     pusheax
	lda     #$01
L0368:	jsr     pusha
	jsr     _gpio_write
L0289:	lda     #<(L028E)
	ldx     #>(L028E)
	jsr     pushax
	ldy     #$02
	jsr     _uart_printf
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	jmp     incsp3

.endproc

; ---------------------------------------------------------------
; long __near__ cmd_ps2 (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cmd_ps2: near

.segment	"CODE"

	ldy     #$00
	jsr     _ps2_process
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	rts

.endproc

; ---------------------------------------------------------------
; long __near__ cmd_vga (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cmd_vga: near

.segment	"CODE"

	ldy     #$09
	jsr     subysp
	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	lda     #<(L0299)
	ldx     #>(L0299)
	jsr     _strcmp
	cpx     #$00
	bne     L0295
	cmp     #$00
	bne     L0295
	lda     #<(L029D)
	ldx     #>(L029D)
	jsr     pushax
	ldy     #$02
	jsr     _uart_printf
	ldx     #$00
	lda     #$80
	jsr     push0ax
	ldy     #$04
	jsr     _vga_ctrl
	lda     #<(L02A2)
	ldx     #>(L02A2)
	jsr     pushax
	ldy     #$02
	jsr     _uart_printf
	jmp     L02B6
L0295:	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	lda     #<(L02A9)
	ldx     #>(L02A9)
	jsr     _strcmp
	cpx     #$00
	bne     L02A5
	cmp     #$00
	bne     L02A5
	lda     _argv+4
	ldx     _argv+4+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$00
	sta     (sp),y
	ldx     #$00
	lda     #$81
	jsr     push0ax
	ldy     #$04
	lda     (sp),y
	jsr     pusha0
	ldy     #$06
	jmp     L0369
L02A5:	lda     _argv+2
	ldx     _argv+2+1
	jsr     pushax
	lda     #<(L02BA)
	ldx     #>(L02BA)
	jsr     _strcmp
	cpx     #$00
	bne     L02B6
	cmp     #$00
	bne     L036A
	lda     _argv+4
	ldx     _argv+4+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$05
	jsr     steaxysp
	lda     _argv+6
	ldx     _argv+6+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$01
	jsr     steaxysp
	lda     _argv+8
	ldx     _argv+8+1
	jsr     pushax
	jsr     push0
	jsr     _strtoul
	ldy     #$00
	sta     (sp),y
	ldx     #$00
	lda     #$82
	jsr     push0ax
	ldy     #$0C
	jsr     ldeaxysp
	jsr     pusheax
	ldy     #$0C
	jsr     ldeaxysp
	jsr     pusheax
	ldy     #$0C
	lda     (sp),y
	jsr     pusha0
	ldy     #$0E
L0369:	jsr     _vga_ctrl
L02B6:	ldx     #$00
L036A:	stx     sreg
	stx     sreg+1
	txa
	ldy     #$09
	jmp     addysp

.endproc

; ---------------------------------------------------------------
; long __near__ cmd_help (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cmd_help: near

.segment	"CODE"

	jsr     decsp4
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	jsr     steax0sp
L02D6:	jsr     ldeax0sp
	cmp     #$09
	txa
	sbc     #$00
	lda     sreg
	sbc     #$00
	lda     sreg+1
	sbc     #$00
	bcs     L02D7
	lda     #<(L02E3)
	ldx     #>(L02E3)
	jsr     pushax
	ldy     #$05
	jsr     ldeaxysp
	jsr     mulax6
	clc
	adc     #<(_ci)
	tay
	txa
	adc     #>(_ci)
	tax
	tya
	jsr     pushw
	ldy     #$07
	jsr     ldeaxysp
	jsr     mulax6
	clc
	adc     #<(_ci)
	tay
	txa
	adc     #>(_ci)
	tax
	tya
	ldy     #$05
	jsr     pushwidx
	ldy     #$06
	jsr     _uart_printf
	jsr     ldeax0sp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	jsr     steax0sp
	jsr     resteax
	jmp     L02D6
L02D7:	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	jmp     incsp4

.endproc

; ---------------------------------------------------------------
; unsigned char __near__ cook (unsigned char)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cook: near

.segment	"CODE"

	ldy     #$00
	lda     (sp),y
	cmp     #$20
	ldx     #$00
	bcc     L036E
	lda     (sp),y
	cmp     #$7F
	bcs     L036E
	jmp     incsp1
L036E:	lda     #$2E
	jmp     incsp1

.endproc

; ---------------------------------------------------------------
; __near__ struct gpio_info * __near__ gi_get (__near__ unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_gi_get: near

.segment	"CODE"

	jsr     decsp2
	ldy     #$02
	lda     (sp),y
	iny
	ora     (sp),y
	bne     L0213
	tax
	jmp     incsp4
L0213:	ldx     #$00
	txa
L0371:	jsr     stax0sp
	ldy     #$01
	lda     (sp),y
	cmp     #$00
	bne     L0221
	dey
	lda     (sp),y
	cmp     #$20
L0221:	bcs     L0218
	jsr     pushw0sp
	lda     #$14
	jsr     tosmula0
	clc
	adc     #<(_gi)
	tay
	txa
	adc     #>(_gi)
	tax
	tya
	jsr     pushax
	ldy     #$05
	jsr     ldaxysp
	jsr     _strcmp
	cpx     #$00
	bne     L0219
	cmp     #$00
	bne     L0219
	jsr     pushw0sp
	lda     #$14
	jsr     tosmula0
	clc
	adc     #<(_gi)
	tay
	txa
	adc     #>(_gi)
	tax
	tya
	jmp     incsp4
L0219:	jsr     ldax0sp
	jsr     incax1
	jmp     L0371
L0218:	ldx     #$00
	txa
	jmp     incsp4

.endproc

; ---------------------------------------------------------------
; long __near__ parse_cmd (__near__ unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_parse_cmd: near

.segment	"CODE"

	jsr     decsp8
	lda     #>(_argv)
	sta     ptr1+1
	lda     #<(_argv)
	sta     ptr1
	lda     #$00
	ldy     #$0B
L0372:	sta     (ptr1),y
	dey
	bpl     L0372
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	jsr     steax0sp
	ldy     #$04
	jsr     steaxysp
L02F4:	ldy     #$0B
	jsr     pushwysp
	ldy     #$09
	jsr     ldeaxysp
	jsr     tosaddax
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	bne     L02FE
	jmp     L0377
L02FC:	ldy     #$07
	jsr     ldeaxysp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	ldy     #$04
	jsr     steaxysp
	jsr     resteax
L02FE:	ldy     #$0B
	jsr     pushwysp
	ldy     #$09
	jsr     ldeaxysp
	jsr     tosaddax
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	cmp     #$20
	beq     L02FC
	jsr     ldeax0sp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	jsr     steax0sp
	jsr     resteax
	jsr     aslax1
	clc
	adc     #<(_argv)
	tay
	txa
	adc     #>(_argv)
	tax
	tya
	jsr     pushax
	ldy     #$0D
	jsr     pushwysp
	ldy     #$0B
	jsr     ldeaxysp
	jsr     tosaddax
	ldy     #$00
	jsr     staxspidx
	jsr     ldeax0sp
	jsr     pusheax
	ldx     #$00
	stx     sreg
	stx     sreg+1
	lda     #$06
	jsr     toseqeax
	beq     L030B
	jmp     L02F5
L0309:	ldy     #$07
	jsr     ldeaxysp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	ldy     #$04
	jsr     steaxysp
	jsr     resteax
L030B:	ldy     #$0B
	jsr     pushwysp
	ldy     #$09
	jsr     ldeaxysp
	jsr     tosaddax
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	cmp     #$20
	jeq     L02F4
	ldy     #$0B
	jsr     pushwysp
	ldy     #$09
	jsr     ldeaxysp
	jsr     tosaddax
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	bne     L0309
	jmp     L02F4
L02F5:	ldy     #$00
L0377:	lda     (sp),y
	sta     _argc
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	ldy     #$04
	jsr     steaxysp
L0314:	ldy     #$0B
	jsr     pushwysp
	ldy     #$09
	jsr     ldeaxysp
	jsr     tosaddax
	sta     ptr1
	stx     ptr1+1
	ldx     #$00
	lda     (ptr1,x)
	beq     L0378
	ldy     #$0B
	jsr     pushwysp
	ldy     #$09
	jsr     ldeaxysp
	jsr     tosaddax
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	cmp     #$20
	bne     L0316
	ldy     #$0B
	jsr     pushwysp
	ldy     #$09
	jsr     ldeaxysp
	jsr     tosaddax
	sta     sreg
	stx     sreg+1
	lda     #$00
	tay
	sta     (sreg),y
L0316:	ldy     #$07
	jsr     ldeaxysp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	ldy     #$04
	jsr     steaxysp
	jsr     resteax
	jmp     L0314
L0378:	sta     sreg
	sta     sreg+1
	ldy     #$0A
	jmp     addysp

.endproc

; ---------------------------------------------------------------
; long __near__ get_cmd_index (__near__ unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_get_cmd_index: near

.segment	"CODE"

	jsr     decsp4
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	jsr     steax0sp
L0325:	jsr     ldeax0sp
	cmp     #$09
	txa
	sbc     #$00
	lda     sreg
	sbc     #$00
	lda     sreg+1
	sbc     #$00
	bcs     L0326
	jsr     ldeax0sp
	jsr     mulax6
	clc
	adc     #<(_ci)
	tay
	txa
	adc     #>(_ci)
	tax
	tya
	jsr     pushw
	ldy     #$07
	jsr     ldaxysp
	jsr     _strcmp
	cpx     #$00
	bne     L0327
	cmp     #$00
	bne     L0327
	jsr     ldeax0sp
	jmp     incsp6
L0327:	jsr     ldeax0sp
	jsr     saveeax
	ldy     #$01
	jsr     inceaxy
	jsr     steax0sp
	jsr     resteax
	jmp     L0325
L0326:	ldx     #$FF
	stx     sreg
	stx     sreg+1
	txa
	jmp     incsp6

.endproc

; ---------------------------------------------------------------
; long __near__ shell (__near__ unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_shell: near

.segment	"RODATA"

L0343:
	.word	$0000
L0356:
	.word	$0000

.segment	"CODE"

	jsr     decsp8
	jsr     pushl0
	ldy     #$0D
	jsr     ldaxysp
	jsr     _strlen
	jsr     axulong
	ldy     #$04
	jsr     steaxysp
	ldy     #$07
	jsr     ldeaxysp
	jsr     pusheax
	ldx     #$00
	stx     sreg
	stx     sreg+1
	txa
	jsr     toseqeax
	beq     L033E
	ldx     #$00
	txa
	jsr     steax0sp
	jmp     L0342
L033E:	lda     #<(L0345)
	ldx     #>(L0345)
	jsr     pushax
	ldy     #$02
	jsr     _uart_printf
	ldy     #$0F
	jsr     pushwysp
	jsr     _parse_cmd
	lda     _argv
	ldx     _argv+1
	jsr     pushax
	jsr     _get_cmd_index
	ldy     #$08
	jsr     steaxysp
	jsr     pusheax
	ldx     #$FF
	stx     sreg
	stx     sreg+1
	txa
	jsr     toseqeax
	beq     L0349
	lda     #<(L0350)
	ldx     #>(L0350)
	jsr     pushax
	lda     _argv
	ldx     _argv+1
	jsr     pushax
	ldy     #$04
	jsr     _uart_printf
	ldx     #$FF
	stx     sreg
	stx     sreg+1
	txa
	jsr     steax0sp
	jmp     L0342
L0349:	ldy     #$0B
	jsr     ldeaxysp
	jsr     mulax6
	clc
	adc     #<(_ci)
	tay
	txa
	adc     #>(_ci)
	tax
	tya
	ldy     #$03
	jsr     ldaxidx
	jsr     callax
	jsr     steax0sp
	lda     #<(L035B)
	ldx     #>(L035B)
	jsr     pushax
	ldy     #$05
	jsr     ldeaxysp
	jsr     pusheax
	ldy     #$06
	jsr     _uart_printf
L0342:	lda     #<(L0360)
	ldx     #>(L0360)
	jsr     pushax
	ldy     #$02
	jsr     _uart_printf
	jsr     ldeax0sp
	ldy     #$0E
	jmp     addysp

.endproc

