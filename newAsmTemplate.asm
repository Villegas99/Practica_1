.include "m328pdef.inc"

	.cseg
	.org 	0x00
	.def	num1 = r16
	.def	num2 = r17
	.def	num3 = r18
	.def	mask = r19

	ldi	mask,0xFF
	out     DDRD,mask
	ldi	mask,0x00
        out     DDRC,mask
	ldi	mask,0x00
        out     DDRB,mask

loop:	in	num1, PINB
	ldi	mask, 0x0F
	and	num1, mask
	in	num2, PINC
	ldi	mask, 0x0F
	and	num2, mask
	ldi	num3, 0x00
	add	num3, num1
	add	num3, num2
	call	zero

zero:	ldi	mask, 0x00
	cp	num3, mask
	brne	one
	ldi	mask,0x3F
	out	PORTD,mask
	rjmp	loop


one:	ldi	mask, 0x01
	cp	num3, mask
	brne	two
	ldi	mask,0x06
	out	PORTD,mask
	rjmp	loop


two:	ldi	mask, 0x02
	cp	num3, mask
	brne	three
	ldi	mask,0x5B
	out	PORTD,mask
	rjmp	loop


three:	ldi	mask, 0x03
	cp	num3, mask
	brne	four
	ldi	mask,0x4F
	out	PORTD,mask
	rjmp	loop


four:	ldi	mask, 0x04
	cp	num3, mask
	brne	five
	ldi	mask,0x66
	out	PORTD,mask
	rjmp	loop


five:	ldi	mask, 0x05
	cp	num3, mask
	brne	six
	ldi	mask,0x6D
	out	PORTD,mask
	rjmp	loop


six:	ldi	mask, 0x06
	cp	num3, mask
	brne	seven
	ldi	mask,0x7D
	out	PORTD,mask
	rjmp	loop


seven:	ldi	mask, 0x07
	cp	num3, mask
	brne	eight
	ldi	mask,0x07
	out	PORTD,mask
	rjmp	loop


eight:	ldi	mask, 0x08
	cp	num3, mask
	brne	nine
	ldi	mask,0xFF
	out	PORTD,mask
	rjmp	loop


nine:	ldi	mask, 0x09
	cp	num3, mask
	brne	ten
	ldi	mask,0x67
	out	PORTD,mask
	rjmp	loop


ten:	ldi	mask, 0x0A
	cp	num3, mask
	brne	eleven
	ldi	mask,0x77
	out	PORTD,mask
	rjmp	loop


eleven:	ldi	mask, 0x0B
	cp	num3, mask
	brne	twelve
	ldi	mask,0x7C
	out	PORTD,mask
	rjmp	loop


twelve:	ldi	mask, 0x0C
	cp	num3, mask
	brne	thirteen
	ldi	mask,0x39
	out	PORTD,mask
	rjmp	loop


thirteen:   ldi	    mask, 0x0D
	    cp	    num3, mask
	    brne    fourteen
	    ldi	    mask,0x5E
	    out	    PORTD,mask
	    rjmp    loop


fourteen:   ldi	    mask, 0x0E
	    cp	    num3, mask
	    brne    fifteen
	    ldi	    mask,0x79
	    out	    PORTD,mask
	    rjmp    loop


fifteen:    ldi	    mask, 0x0F
	    cp	    num3, mask
	    brne    carry
	    ldi	    mask,0x71
	    out	    PORTD,mask
	    rjmp    loop
	
carry:	ldi	mask, 0x40
	out	PORTD,mask
	rjmp	loop


