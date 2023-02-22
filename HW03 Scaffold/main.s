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
	.ascii	"PAUSED\000"
	.text
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
	ldr	r3, .L24
	ldr	r2, .L24+4
	ldr	r4, .L24+8
	mov	r1, #5
	mov	r0, #200
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L24+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	1023
	.word	.LC2
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
	push	{r4, lr}
	ldr	r3, .L38
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r2, .L38+8
	ldrh	r2, [r2]
	ands	r2, r2, #8
	beq	.L36
.L27:
	tst	r3, #4
	beq	.L26
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L37
.L26:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L36:
	str	r2, [sp]
	mov	r3, #8
	mov	r2, #36
	mov	r1, #5
	mov	r0, #200
	ldr	r4, .L38+12
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L38+16
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L37:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	b	goToStart
.L39:
	.align	2
.L38:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	drawRect
	.word	state
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"YOU WON!\000"
	.align	2
.LC4:
	.ascii	"You slain all 5 enemies\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L42
	ldr	r3, .L42+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L42+8
	mov	r3, #992
	mov	r1, #75
	mov	r0, #95
	ldr	r2, .L42+12
	mov	lr, pc
	bx	r4
	mov	r3, #992
	ldr	r2, .L42+16
	mov	r1, #90
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L42+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	15855
	.word	fillScreen
	.word	drawString
	.word	.LC3
	.word	.LC4
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L51
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
	ldr	r3, .L51+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
.L44:
	pop	{r4, lr}
	bx	lr
.L50:
	pop	{r4, lr}
	b	goToStart
.L52:
	.align	2
.L51:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"YOU LOSE...\000"
	.align	2
.LC6:
	.ascii	"You slain only   enemies\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L55
	ldr	r3, .L55+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L55+8
	mov	r3, #31
	mov	r1, #75
	mov	r0, #86
	ldr	r2, .L55+12
	mov	lr, pc
	bx	r4
	mov	r3, #31
	mov	r1, #90
	mov	r0, #47
	ldr	r2, .L55+16
	mov	lr, pc
	bx	r4
	mov	r3, #31
	ldr	r2, .L55+20
	mov	r1, #90
	mov	r0, #137
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L55+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L56:
	.align	2
.L55:
	.word	15855
	.word	fillScreen
	.word	drawString
	.word	.LC5
	.word	.LC6
	.word	buffer
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"%d\000"
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
	push	{r4, r5, lr}
	ldr	r4, .L68
	sub	sp, sp, #12
	ldr	r3, .L68+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L68+8
	ldr	r3, .L68+12
	ldr	r0, .L68+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+20
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r3, #8
	mov	r1, #5
	mov	r0, #116
	str	r2, [sp]
	ldr	r5, .L68+24
	mov	r2, #12
	mov	lr, pc
	bx	r5
	mov	r1, #5
	mov	r0, #116
	ldr	r3, .L68+28
	ldr	r2, .L68+16
	ldr	r5, .L68+32
	mov	lr, pc
	bx	r5
	ldr	r3, .L68+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
	ldr	r3, .L68+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
.L58:
	ldr	r3, [r4]
	cmp	r3, #5
	beq	.L66
.L59:
	ldr	r3, .L68+48
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L67
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L67:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L66:
	bl	goToWin
	b	.L59
.L65:
	ldr	r3, .L68+52
	ldr	r2, .L68+56
	mov	r1, #5
	mov	r0, #200
	mov	lr, pc
	bx	r5
	mov	r2, #2
	ldr	r3, .L68+60
	str	r2, [r3]
	b	.L58
.L69:
	.align	2
.L68:
	.word	score
	.word	updateGame
	.word	.LC7
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	drawRect
	.word	32767
	.word	drawString
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	lives
	.word	1023
	.word	.LC2
	.word	state
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC8:
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L81
	mov	lr, pc
	bx	r3
	ldr	r0, .L81+4
	ldr	r3, .L81+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L81+12
	ldr	r4, .L81+16
	strh	r1, [r3]	@ movhi
	ldr	fp, .L81+20
	ldrh	r1, [r4, #48]
	ldr	r5, .L81+24
	ldr	r3, .L81+28
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L81+32
	ldr	r10, .L81+36
	ldr	r9, .L81+40
	ldr	r8, .L81+44
	ldr	r7, .L81+48
.L71:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L72:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L72
.L74:
	.word	.L77
	.word	.L76
	.word	.L75
	.word	.L73
	.word	.L73
.L73:
	mov	lr, pc
	bx	r7
	b	.L71
.L75:
	mov	lr, pc
	bx	r8
	b	.L71
.L76:
	mov	lr, pc
	bx	r9
	b	.L71
.L77:
	mov	lr, pc
	bx	r10
	b	.L71
.L82:
	.align	2
.L81:
	.word	mgba_open
	.word	.LC8
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
	.word	win
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	rSeed,4,4
	.comm	state,4,4
	.comm	buffer,41,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
