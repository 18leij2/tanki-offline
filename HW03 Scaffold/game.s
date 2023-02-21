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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #117
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #3
	mov	r0, #130
	mov	r1, #11
	ldr	r3, .L4
	str	ip, [r3]
	str	ip, [r3, #8]
	ldr	ip, .L4+4
	str	lr, [r3, #32]
	strh	ip, [r3, #40]	@ movhi
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	5285
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #10
	mov	r8, #30
	mov	r7, #15
	ldr	r4, .L16
	ldr	r6, .L16+4
	ldr	r5, .L16+8
	b	.L11
.L15:
	cmp	r3, #0
	moveq	r3, #992
	strheq	r3, [r4, #32]	@ movhi
.L10:
	add	r9, r9, #30
	cmp	r9, #160
	add	r4, r4, #44
	beq	.L14
.L11:
	mov	r2, #10
	mov	r3, #1
	str	r2, [r4, #28]
	str	r3, [r4, #36]
	str	r9, [r4]
	str	r8, [r4, #4]
	str	r7, [r4, #24]
	mov	lr, pc
	bx	r6
	smull	r2, r3, r5, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	cmp	r3, #1
	beq	.L8
	cmp	r3, #2
	bne	.L15
	mvn	r3, #64512
	add	r9, r9, #30
	cmp	r9, #160
	strh	r3, [r4, #32]	@ movhi
	add	r4, r4, #44
	bne	.L11
.L14:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L8:
	mov	r3, #31
	strh	r3, [r4, #32]	@ movhi
	b	.L10
.L17:
	.align	2
.L16:
	.word	enemies
	.word	rand
	.word	1431655766
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #117
	mov	r4, #0
	mov	r2, #130
	mov	r3, #11
	mov	ip, #3
	ldr	r5, .L23
	ldr	lr, .L23+4
	ldr	r0, .L23+8
	str	r4, [lr]
	str	r4, [r5, #16]
	str	r4, [r5, #20]
	str	r4, [r5, #36]
	str	ip, [r5, #32]
	strh	r0, [r5, #40]	@ movhi
	str	r1, [r5]
	str	r1, [r5, #8]
	str	r2, [r5, #4]
	str	r2, [r5, #12]
	str	r3, [r5, #28]
	str	r3, [r5, #24]
	bl	initEnemies
	mov	r2, #10
	mov	r1, r4
	mov	r6, #100
	mov	r4, #15
	mov	lr, r2
	mov	ip, #31
	ldr	r3, .L23+12
	ldr	r0, .L23+16
.L20:
	str	r2, [r3]
	add	r2, r2, #15
	cmp	r2, r0
	str	r6, [r3, #4]
	str	r4, [r3, #24]
	str	lr, [r3, #28]
	str	r1, [r3, #36]
	strh	ip, [r3, #32]	@ movhi
	add	r3, r3, #44
	bne	.L20
	ldr	r2, [r5, #32]
	ldr	r3, .L23+20
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	player
	.word	score
	.word	5285
	.word	bullets
	.word	310
	.word	lives
	.size	initGame, .-initGame
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #10
	push	{r4, r5, lr}
	mov	ip, #0
	mov	r5, #100
	mov	r4, #15
	mov	lr, r2
	mov	r0, #31
	ldr	r3, .L30
	ldr	r1, .L30+4
.L27:
	str	r2, [r3]
	add	r2, r2, #15
	cmp	r2, r1
	str	r5, [r3, #4]
	str	r4, [r3, #24]
	str	lr, [r3, #28]
	str	ip, [r3, #36]
	strh	r0, [r3, #32]	@ movhi
	add	r3, r3, #44
	bne	.L27
	pop	{r4, r5, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	bullets
	.word	310
	.size	initBullets, .-initBullets
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
	.text
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L50
	ldrh	r3, [r3]
	tst	r3, #32
	push	{r4, lr}
	ldr	r2, .L50+4
	bne	.L33
	ldr	r1, [r2]
	cmp	r1, #0
	movgt	r0, #6
	subgt	r1, r1, #1
	strgt	r1, [r2]
	strgt	r0, [r2, #36]
.L33:
	tst	r3, #16
	bne	.L34
	ldr	r0, [r2]
	ldr	r1, [r2, #24]
	add	r1, r0, r1
	cmp	r1, #239
	movle	r1, #2
	addle	r0, r0, #1
	strle	r0, [r2]
	strle	r1, [r2, #36]
.L34:
	ands	r0, r3, #64
	bne	.L36
	ldr	r1, [r2, #4]
	cmp	r1, #18
	bgt	.L48
.L36:
	tst	r3, #128
	bne	.L42
	ldr	r0, [r2, #4]
	ldr	r1, [r2, #28]
	add	r1, r0, r1
	cmp	r1, #159
	ble	.L49
.L42:
	ldr	r1, [r2, #36]
.L41:
	ldr	r0, .L50+8
	ldr	r3, .L50+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L49:
	and	r3, r3, #48
	cmp	r3, #16
	moveq	r1, #5
	add	r0, r0, #1
	str	r0, [r2, #4]
	streq	r1, [r2, #36]
	beq	.L41
	cmp	r3, #32
	moveq	r3, #3
	movne	r1, #4
	moveq	r1, r3
	strne	r1, [r2, #36]
	streq	r3, [r2, #36]
	b	.L41
.L48:
	and	ip, r3, #48
	sub	r1, r1, #1
	cmp	ip, #16
	str	r1, [r2, #4]
	moveq	r1, #7
	streq	r1, [r2, #36]
	beq	.L36
	cmp	ip, #32
	moveq	r1, #1
	strne	r0, [r2, #36]
	streq	r1, [r2, #36]
	b	.L36
.L51:
	.align	2
.L50:
	.word	buttons
	.word	player
	.word	.LC0
	.word	mgba_printf
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updatePlayer
	.size	updateGame, .-updateGame
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateBullets, .-updateBullets
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Press Enter to Start\000"
	.text
	.align	2
	.global	drawStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStart, %function
drawStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L61
	ldr	r3, [r4]
	sub	r2, r3, #40
	cmp	r2, #39
	sub	sp, sp, #12
	bls	.L59
	cmp	r3, #79
	bgt	.L60
.L57:
	add	r3, r3, #1
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L60:
	mov	ip, #0
	mov	r3, #992
	mov	r1, #90
	mov	r0, #59
	ldr	r2, .L61+4
	ldr	r5, .L61+8
	str	ip, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	b	.L57
.L59:
	ldr	r2, .L61+12
	mov	r3, #8
	str	r2, [sp]
	mov	r1, #90
	mov	r2, #120
	mov	r0, #59
	ldr	r5, .L61+16
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	b	.L57
.L62:
	.align	2
.L61:
	.word	time
	.word	.LC1
	.word	drawString
	.word	15855
	.word	drawRect
	.size	drawStart, .-drawStart
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L78
	ldr	ip, .L78+4
	sub	sp, sp, #12
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldr	r5, .L78+8
	ldm	r0, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #40]
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #24]
	mov	lr, pc
	bx	r5
	mov	r3, #9
	ldm	r4, {r0, r1}
	ldr	ip, .L78+12
	mov	r2, r3
	str	ip, [sp]
	add	r1, r1, #1
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	mov	r3, #5
	ldm	r4, {r0, r1}
	ldr	ip, .L78+16
	mov	r2, r3
	str	ip, [sp]
	add	r1, r1, #3
	add	r0, r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #36]
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L76
.L66:
	.word	.L73
	.word	.L72
	.word	.L71
	.word	.L70
	.word	.L69
	.word	.L68
	.word	.L67
	.word	.L65
.L65:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r1, r2, #2
	rsb	r1, r1, r1, lsl #4
	add	ip, r3, r1, lsl #4
	mov	r0, ip
	add	lr, r3, #2
	ldr	r5, .L78+20
	sub	ip, ip, #239
	add	r1, lr, r1, lsl #4
	sub	r0, r0, #480
.L77:
	ldr	lr, [r5]
	ldr	r5, .L78+16
	lsl	ip, ip, #1
	lsl	r1, r1, #1
	lsl	r0, r0, #1
	strh	r5, [lr, r1]	@ movhi
	strh	r5, [lr, ip]	@ movhi
	strh	r5, [lr, r0]	@ movhi
.L74:
	str	r3, [r4, #8]
	str	r2, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L73:
	ldr	r3, .L78+16
	ldr	r0, [r4]
	str	r3, [sp]
	mov	r2, #1
	mov	r3, #3
	ldr	r1, [r4, #4]
	add	r0, r0, #5
	mov	lr, pc
	bx	r5
.L76:
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	b	.L74
.L72:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	rsb	lr, r2, r2, lsl #4
	add	r0, r3, lr, lsl #4
	mov	r1, r0
	ldr	r5, .L78+20
	add	ip, r3, #10
	add	ip, ip, lr, lsl #4
	add	r0, r0, #249
	ldr	lr, [r5]
	add	r1, r1, #488
	ldr	r5, .L78+16
	lsl	r0, r0, #1
	lsl	ip, ip, #1
	lsl	r1, r1, #1
	strh	r5, [lr, ip]	@ movhi
	strh	r5, [lr, r0]	@ movhi
	strh	r5, [lr, r1]	@ movhi
	b	.L74
.L71:
	ldm	r4, {r0, r1}
	ldr	r3, .L78+16
	mov	r2, #3
	str	r3, [sp]
	add	r1, r1, #5
	mov	r3, #1
	add	r0, r0, #8
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	b	.L74
.L70:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r0, r2, #8
	rsb	r0, r0, r0, lsl #4
	ldr	r5, .L78+20
	add	r1, r3, r0, lsl #4
	add	ip, r3, r0, lsl #4
	add	lr, r3, #8
	add	r1, r1, #488
	add	r0, lr, r0, lsl #4
	add	r1, r1, #2
	ldr	lr, [r5]
	add	ip, ip, #249
	ldr	r5, .L78+16
	lsl	r1, r1, #1
	lsl	ip, ip, #1
	lsl	r0, r0, #1
	strh	r5, [lr, r0]	@ movhi
	strh	r5, [lr, ip]	@ movhi
	strh	r5, [lr, r1]	@ movhi
	b	.L74
.L69:
	ldm	r4, {r0, r1}
	ldr	r3, .L78+16
	mov	r2, #1
	str	r3, [sp]
	add	r1, r1, #8
	mov	r3, #3
	add	r0, r0, #5
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	b	.L74
.L68:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r1, r2, #8
	rsb	r1, r1, r1, lsl #4
	add	ip, r3, r1, lsl #4
	mov	r0, ip
	add	lr, r3, #2
	ldr	r5, .L78+20
	add	ip, ip, #241
	add	r1, lr, r1, lsl #4
	add	r0, r0, #480
	b	.L77
.L67:
	ldr	r1, [r4, #4]
	ldr	r3, .L78+16
	mov	r2, #3
	str	r3, [sp]
	ldr	r0, [r4]
	mov	r3, #1
	add	r1, r1, #5
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	b	.L74
.L79:
	.align	2
.L78:
	.word	player
	.word	15855
	.word	drawRect
	.word	2466
	.word	2849
	.word	videoBuffer
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldrh	r2, [r0, #32]
	sub	sp, sp, #8
	ldr	r3, [r0, #28]
	str	r2, [sp]
	ldr	r4, .L89
	ldr	r2, [r0, #24]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	drawRect
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldrh	r2, [r0, #32]
	sub	sp, sp, #8
	ldr	r3, [r0, #28]
	str	r2, [sp]
	ldr	r4, .L100
	ldr	r2, [r0, #24]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	drawRect
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawTankIcon
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTankIcon, %function
drawTankIcon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	mov	r7, r1
	ldr	r5, .L104
	sub	sp, sp, #12
	add	r9, r0, #3
	ldr	r10, .L104+4
	mov	r0, r9
	str	r5, [sp]
	add	r8, r4, #9
	mov	r3, #3
	mov	r2, #6
	mov	lr, pc
	bx	r10
	add	r6, r4, #1
	mov	r0, r8
	str	r5, [sp]
	add	r1, r7, #1
	mov	r3, #1
	mov	r2, #4
	mov	lr, pc
	bx	r10
	mov	r0, r6
	str	r5, [sp]
	add	r1, r7, #3
	mov	r3, #1
	mov	r2, #11
	mov	lr, pc
	bx	r10
	add	r1, r7, #4
	ldr	r0, .L104+8
	rsb	ip, r1, r1, lsl #4
	add	r3, r4, #12
	add	r2, r4, ip, lsl #4
	ldr	r0, [r0]
	add	r3, r3, ip, lsl #4
	ldr	fp, .L104+12
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	strh	r5, [r0, r2]	@ movhi
	strh	r5, [r0, r3]	@ movhi
	mov	r2, #11
	mov	r0, r6
	str	fp, [sp]
	mov	r3, #1
	lsl	r5, ip, #4
	mov	lr, pc
	bx	r10
	mov	r0, r4
	str	fp, [sp]
	add	r1, r7, #5
	mov	r3, #2
	mov	r2, #13
	mov	lr, pc
	bx	r10
	mov	r0, r6
	str	fp, [sp]
	add	r1, r7, #7
	mov	r3, #1
	mov	r2, #11
	mov	lr, pc
	bx	r10
	add	r7, r4, #7
	add	r2, r5, #240
	add	r10, r4, #5
	add	r0, r4, #11
	ldr	r3, .L104+8
	add	r5, r5, #480
	add	lr, r4, #2
	add	ip, r4, #4
	add	r1, r4, #6
	add	r6, r6, r2
	add	r9, r9, r2
	add	r8, r8, r2
	add	r10, r10, r2
	add	r7, r7, r2
	add	r0, r0, r2
	add	r2, r4, #8
	add	r4, r4, #10
	ldr	r3, [r3]
	ldr	fp, .L104+16
	add	lr, lr, r5
	add	ip, ip, r5
	add	r1, r1, r5
	add	r2, r2, r5
	add	r5, r4, r5
	lsl	r6, r6, #1
	lsl	r9, r9, #1
	lsl	r8, r8, #1
	lsl	r10, r10, #1
	lsl	r7, r7, #1
	lsl	r0, r0, #1
	lsl	lr, lr, #1
	lsl	ip, ip, #1
	lsl	r1, r1, #1
	lsl	r2, r2, #1
	lsl	r5, r5, #1
	strh	fp, [r3, r6]	@ movhi
	strh	fp, [r3, r9]	@ movhi
	strh	fp, [r3, r10]	@ movhi
	strh	fp, [r3, r7]	@ movhi
	strh	fp, [r3, r8]	@ movhi
	strh	fp, [r3, r0]	@ movhi
	strh	fp, [r3, lr]	@ movhi
	strh	fp, [r3, ip]	@ movhi
	strh	fp, [r3, r1]	@ movhi
	strh	fp, [r3, r2]	@ movhi
	strh	fp, [r3, r5]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	2466
	.word	drawRect
	.word	videoBuffer
	.word	5285
	.word	9513
	.size	drawTankIcon, .-drawTankIcon
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L111
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L106
	mov	r5, #5
	mov	r4, #0
.L108:
	mov	r0, r5
	mov	r1, #5
	bl	drawTankIcon
	ldr	r3, [r6]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #18
	bgt	.L108
.L106:
	pop	{r4, r5, r6, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	lives
	.size	drawLives, .-drawLives
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #12
	bl	drawLives
	mov	r5, #0
	bl	drawPlayer
	ldr	r4, .L129
	ldr	r6, .L129+4
	ldr	r7, .L129+8
	b	.L118
.L114:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L119
	cmp	r5, #19
	beq	.L113
.L120:
	add	r5, r5, #1
	add	r4, r4, #44
	add	r6, r6, #44
.L118:
	cmp	r5, #4
	bhi	.L114
	ldr	r3, [r6, #36]
	cmp	r3, #0
	bne	.L128
.L115:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L120
.L119:
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #24]
	mov	lr, pc
	bx	r7
	cmp	r5, #19
	bne	.L120
.L113:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L128:
	ldrh	r2, [r6, #32]
	ldr	r3, [r6, #28]
	str	r2, [sp]
	ldm	r6, {r0, r1}
	ldr	r2, [r6, #24]
	mov	lr, pc
	bx	r7
	b	.L115
.L130:
	.align	2
.L129:
	.word	bullets
	.word	enemies
	.word	drawRect
	.size	drawGame, .-drawGame
	.comm	lives,4,4
	.comm	time,4,4
	.comm	spawned,4,4
	.comm	score,4,4
	.comm	enemies,220,4
	.comm	bullets,880,4
	.comm	player,44,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
