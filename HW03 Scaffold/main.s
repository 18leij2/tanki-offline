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
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #2
	mvn	ip, #170
	mov	r2, #0
	str	lr, [sp, #-4]!
	ldr	lr, .L8
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r0, .L8+4
	strh	r1, [r3, #130]	@ movhi
	ldr	r1, .L8+8
	ldrh	r0, [r0, #48]
	ldr	r3, .L8+12
	ldr	lr, [sp], #4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
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
	ldr	r0, .L12
	sub	sp, sp, #8
	ldr	r3, .L12+4
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r3, #18
	mov	r0, r1
	str	r1, [sp]
	mov	r2, #240
	ldr	r4, .L12+8
	mov	lr, pc
	bx	r4
	mov	r2, #48
	mov	r1, #5
	mov	r0, #116
	ldr	r3, .L12+12
	ldr	r4, .L12+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+20
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
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
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r0, [r4]
	ldr	r3, .L21+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L21+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
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
	ldr	r3, .L25
	ldr	r2, .L25+4
	ldr	r4, .L25+8
	mov	r1, #5
	mov	r0, #200
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L25+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
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
	ldr	r3, .L39
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L39+8
	ldrh	r2, [r2]
	ands	r2, r2, #8
	beq	.L37
.L28:
	tst	r3, #4
	beq	.L27
	ldr	r3, .L39+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L38
.L27:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L37:
	str	r2, [sp]
	mov	r3, #8
	mov	r2, #36
	mov	r1, #5
	mov	r0, #200
	ldr	r4, .L39+12
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L39+16
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L38:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	b	goToStart
.L40:
	.align	2
.L39:
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
	.ascii	"You slayed all 5 enemies\000"
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
	ldr	r0, .L43
	ldr	r3, .L43+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L43+8
	mov	r3, #992
	mov	r1, #75
	mov	r0, #95
	ldr	r2, .L43+12
	mov	lr, pc
	bx	r4
	mov	r3, #992
	ldr	r2, .L43+16
	mov	r1, #90
	mov	r0, #47
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L43+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
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
	ldr	r3, .L52
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L51
.L45:
	pop	{r4, lr}
	bx	lr
.L51:
	pop	{r4, lr}
	b	goToStart
.L53:
	.align	2
.L52:
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
	.ascii	"You slayed only   enemies\000"
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
	ldr	r0, .L56
	ldr	r3, .L56+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L56+8
	mov	r3, #31
	mov	r1, #75
	mov	r0, #86
	ldr	r2, .L56+12
	mov	lr, pc
	bx	r4
	mov	r3, #31
	mov	r1, #90
	mov	r0, #45
	ldr	r2, .L56+16
	mov	lr, pc
	bx	r4
	mov	r3, #31
	ldr	r2, .L56+20
	mov	r1, #90
	mov	r0, #140
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L56+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L57:
	.align	2
.L56:
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
	ldr	r4, .L69
	sub	sp, sp, #12
	ldr	r3, .L69+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L69+8
	ldr	r3, .L69+12
	ldr	r0, .L69+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+20
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r3, #8
	mov	r1, #5
	mov	r0, #116
	str	r2, [sp]
	ldr	r5, .L69+24
	mov	r2, #12
	mov	lr, pc
	bx	r5
	mov	r1, #5
	mov	r0, #116
	ldr	r3, .L69+28
	ldr	r2, .L69+16
	ldr	r5, .L69+32
	mov	lr, pc
	bx	r5
	ldr	r3, .L69+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
	ldr	r3, .L69+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
.L59:
	ldr	r3, [r4]
	cmp	r3, #5
	beq	.L67
.L60:
	ldr	r3, .L69+48
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L68
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L68:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L67:
	bl	goToWin
	b	.L60
.L66:
	ldr	r3, .L69+52
	ldr	r2, .L69+56
	mov	r1, #5
	mov	r0, #200
	mov	lr, pc
	bx	r5
	mov	r2, #2
	ldr	r3, .L69+60
	str	r2, [r3]
	b	.L59
.L70:
	.align	2
.L69:
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
	ldr	r3, .L82
	mov	lr, pc
	bx	r3
	ldr	r0, .L82+4
	ldr	r3, .L82+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	ip, #128
	mvn	r0, #170
	mov	r1, #2
	mov	r2, #0
	ldr	lr, .L82+12
	ldr	r4, .L82+16
	strh	lr, [r3]	@ movhi
	strh	ip, [r3, #132]	@ movhi
	strh	r0, [r3, #128]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	ldr	fp, .L82+20
	ldrh	r1, [r4, #48]
	ldr	r5, .L82+24
	ldr	r3, .L82+28
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L82+32
	ldr	r10, .L82+36
	ldr	r9, .L82+40
	ldr	r8, .L82+44
	ldr	r7, .L82+48
.L72:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L73:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L73
.L75:
	.word	.L78
	.word	.L77
	.word	.L76
	.word	.L74
	.word	.L74
.L74:
	mov	lr, pc
	bx	r7
	b	.L72
.L76:
	mov	lr, pc
	bx	r8
	b	.L72
.L77:
	mov	lr, pc
	bx	r9
	b	.L72
.L78:
	mov	lr, pc
	bx	r10
	b	.L72
.L83:
	.align	2
.L82:
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
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
