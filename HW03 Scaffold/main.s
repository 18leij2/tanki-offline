	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Tanki Offline\000"
	.align	2
.LC1:
	.ascii	"Press Enter to Start\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L4
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+8
	mov	r3, #992
	mov	r1, #75
	mov	r0, #80
	ldr	r2, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #992
	mov	r1, #90
	ldr	r2, .L4+16
	mov	r0, #59
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L4+20
	ldr	r2, .L4+24
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	15855
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.word	.LC1
	.word	state
	.word	rSeed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L7
	ldr	r3, .L7+4
	strh	r0, [r1]	@ movhi
	ldr	r1, .L7+8
	ldrh	r0, [r3, #48]
	ldr	r3, .L7+12
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L11
	sub	sp, sp, #8
	ldr	r3, .L11+4
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r3, #18
	mov	r0, r1
	str	r1, [sp]
	mov	r2, #240
	ldr	r4, .L11+8
	mov	lr, pc
	bx	r4
	mov	r2, #48
	mov	r1, #5
	mov	r0, #116
	ldr	r3, .L11+12
	ldr	r4, .L11+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L11+20
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	15855
	.word	fillScreen
	.word	drawRect
	.word	32767
	.word	drawChar
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L20
	ldr	r3, [r4]
	ldr	r2, .L20+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L20+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L20+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r0, [r4]
	ldr	r3, .L20+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L20+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	rSeed
	.word	waitForVBlank
	.word	drawStart
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"%d\000"
	.align	2
.LC3:
	.ascii	"PAUSED\000"
	.text
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L29
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+4
	ldr	r1, .L29+8
	ldr	r2, [r3]
	ldr	r0, .L29+12
	ldr	r3, .L29+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L29+24
	mov	r1, #5
	mov	r0, #116
	ldr	r3, .L29+28
	ldr	r2, .L29+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L29+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
	ldr	r3, .L29+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
.L22:
	pop	{r4, lr}
	bx	lr
.L28:
	ldr	r3, .L29+44
	ldr	r2, .L29+48
	mov	r1, #5
	mov	r0, #200
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L29+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L30:
	.align	2
.L29:
	.word	updateGame
	.word	score
	.word	.LC2
	.word	buffer
	.word	sprintf
	.word	waitForVBlank
	.word	drawString
	.word	32767
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	1023
	.word	.LC3
	.word	state
	.size	game, .-game
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L33
	ldr	r2, .L33+4
	ldr	r4, .L33+8
	mov	r1, #5
	mov	r0, #200
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L33+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
	.word	1023
	.word	.LC3
	.word	drawString
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L45
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L36
	ldr	r2, .L45+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L36
	mov	r2, #1
	ldr	r3, .L45+12
	str	r2, [r3]
.L35:
	pop	{r4, lr}
	bx	lr
.L36:
	tst	r3, #4
	beq	.L35
	ldr	r3, .L45+8
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L35
	pop	{r4, lr}
	b	goToStart
.L46:
	.align	2
.L45:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Debug log initialized!\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L55
	mov	lr, pc
	bx	r3
	ldr	r0, .L55+4
	ldr	r3, .L55+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L55+12
	ldr	r4, .L55+16
	strh	r1, [r3]	@ movhi
	ldr	r10, .L55+20
	ldrh	r1, [r4, #48]
	ldr	r5, .L55+24
	ldr	r3, .L55+28
	strh	r1, [r10]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L55+32
	ldr	r9, .L55+36
	ldr	r8, .L55+40
	ldr	r7, .L55+44
.L48:
	ldr	r2, [r6]
	ldrh	r3, [r10]
.L51:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	cmp	r2, #1
	strh	r3, [r10]	@ movhi
	beq	.L49
	cmp	r2, #2
	beq	.L50
	cmp	r2, #0
	bne	.L51
	mov	lr, pc
	bx	r9
	b	.L48
.L50:
	mov	lr, pc
	bx	r7
	b	.L48
.L49:
	mov	lr, pc
	bx	r8
	b	.L48
.L56:
	.align	2
.L55:
	.word	mgba_open
	.word	.LC4
	.word	mgba_printf
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	pause
	.size	main, .-main
	.comm	rSeed,4,4
	.comm	state,4,4
	.comm	buffer,41,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
