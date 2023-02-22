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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets.part.0, %function
updateBullets.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L1
.L4:
	.word	.L11
	.word	.L10
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L5
	.word	.L3
.L11:
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #36]
	sub	r3, r3, r2
	cmp	r3, #17
	ble	.L13
.L17:
	str	r3, [r0, #4]
.L1:
	bx	lr
.L3:
	ldr	r2, [r0]
	ldr	r3, [r0, #36]
	sub	r1, r2, r3
	cmp	r1, #0
	ble	.L13
	ldr	r1, [r0, #4]
	sub	ip, r1, r3
	cmp	ip, #18
	bgt	.L19
.L13:
	mov	r3, #0
	ldr	r2, [r0, #40]
	cmp	r2, r3
	ldrne	r2, .L20
	str	r3, [r0, #48]
	strne	r3, [r2, #40]
	bx	lr
.L10:
	ldr	r1, [r0]
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #36]
	add	r3, r1, r3
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #240
	bgt	.L13
	ldr	r3, [r0, #4]
	sub	ip, r3, r2
	cmp	ip, #18
	ble	.L13
	sub	r2, r2, #1
	sub	r3, r3, r2
	add	r2, r1, r2
	stm	r0, {r2, r3}
	bx	lr
.L9:
	ldr	r2, [r0]
	ldr	r3, [r0, #24]
	ldr	r1, [r0, #36]
	add	r3, r2, r3
	sub	r3, r3, #1
	add	r3, r3, r1
	cmp	r3, #239
	bgt	.L13
	add	r2, r2, r1
	str	r2, [r0]
	bx	lr
.L8:
	ldr	r1, [r0]
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #36]
	add	r3, r1, r3
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #240
	bgt	.L13
	ldr	ip, [r0, #4]
	ldr	r3, [r0, #28]
	add	r3, ip, r3
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #160
	bgt	.L13
	sub	r2, r2, #1
	add	r1, r1, r2
	add	r2, ip, r2
	stm	r0, {r1, r2}
	bx	lr
.L7:
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #28]
	ldr	r1, [r0, #36]
	add	r3, r2, r3
	sub	r3, r3, #1
	add	r3, r3, r1
	cmp	r3, #159
	bgt	.L13
	add	r2, r2, r1
	str	r2, [r0, #4]
	bx	lr
.L6:
	ldr	r1, [r0]
	ldr	r2, [r0, #36]
	sub	r3, r1, r2
	cmp	r3, #0
	ble	.L13
	ldr	ip, [r0, #4]
	ldr	r3, [r0, #28]
	add	r3, ip, r3
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #160
	bgt	.L13
	sub	r2, r2, #1
	sub	r1, r1, r2
	add	r2, ip, r2
	stm	r0, {r1, r2}
	bx	lr
.L5:
	ldr	r3, [r0]
	ldr	r2, [r0, #36]
	subs	r3, r3, r2
	bmi	.L13
	str	r3, [r0]
	bx	lr
.L19:
	sub	r3, r3, #1
	sub	r2, r2, r3
	str	r2, [r0]
	sub	r3, r1, r3
	b	.L17
.L21:
	.align	2
.L20:
	.word	player
	.size	updateBullets.part.0, .-updateBullets.part.0
	.align	2
	.global	initPlayer
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
	ldr	r3, .L24
	str	ip, [r3]
	str	ip, [r3, #8]
	ldr	ip, .L24+4
	str	lr, [r3, #32]
	strh	ip, [r3, #44]	@ movhi
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r4, .L36
	ldr	r6, .L36+4
	ldr	r5, .L36+8
	b	.L31
.L35:
	cmp	r3, #0
	moveq	r3, #992
	strheq	r3, [r4, #36]	@ movhi
.L30:
	add	r9, r9, #30
	cmp	r9, #160
	add	r4, r4, #48
	beq	.L34
.L31:
	mov	r2, #1
	mov	r3, #0
	mov	r1, #10
	str	r2, [r4, #40]
	str	r3, [r4, #32]
	str	r9, [r4]
	str	r8, [r4, #4]
	str	r7, [r4, #24]
	str	r1, [r4, #28]
	mov	lr, pc
	bx	r6
	smull	r2, r3, r5, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	cmp	r3, #1
	beq	.L28
	cmp	r3, #2
	bne	.L35
	mvn	r3, #64512
	add	r9, r9, #30
	cmp	r9, #160
	strh	r3, [r4, #36]	@ movhi
	add	r4, r4, #48
	bne	.L31
.L34:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L28:
	mov	r3, #31
	strh	r3, [r4, #36]	@ movhi
	b	.L30
.L37:
	.align	2
.L36:
	.word	enemies
	.word	rand
	.word	1431655766
	.size	initEnemies, .-initEnemies
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
	mov	ip, #100
	mov	r0, #3
	mov	r1, #0
	push	{r4, lr}
	ldr	r3, .L43
	ldr	r4, .L43+4
	ldr	lr, .L43+8
.L40:
	str	r2, [r3]
	str	r2, [r3, #8]
	add	r2, r2, #15
	cmp	r2, lr
	str	ip, [r3, #4]
	str	ip, [r3, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #48]
	str	r1, [r3, #32]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	strh	r4, [r3, #44]	@ movhi
	add	r3, r3, #56
	bne	.L40
	pop	{r4, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	bullets
	.word	5285
	.word	310
	.size	initBullets, .-initBullets
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
	mov	r3, #0
	mov	r2, #11
	mov	r0, #117
	mov	r1, #130
	mov	ip, #3
	push	{r4, lr}
	ldr	r4, .L47
	ldr	lr, .L47+4
	str	r3, [r4, #16]
	str	r3, [lr]
	str	r3, [r4, #20]
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	ldr	r3, .L47+8
	str	r2, [r4, #28]
	strh	r3, [r4, #44]	@ movhi
	str	r2, [r4, #24]
	str	ip, [r4, #32]
	str	r0, [r4]
	str	r0, [r4, #8]
	str	r1, [r4, #4]
	str	r1, [r4, #12]
	bl	initEnemies
	bl	initBullets
	ldr	r2, [r4, #32]
	ldr	r3, .L47+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L48:
	.align	2
.L47:
	.word	player
	.word	score
	.word	5285
	.word	lives
	.size	initGame, .-initGame
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
	ldr	r3, [r0, #48]
	cmp	r3, #0
	bxeq	lr
	b	updateBullets.part.0
	.size	updateBullets, .-updateBullets
	.align	2
	.global	newBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	newBullet, %function
newBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L72
	mov	r3, #0
	mov	r2, ip
	b	.L65
.L53:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #56
	bxeq	lr
.L65:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L53
	push	{r4, r5, lr}
	mov	r5, #1
	ldr	lr, .L72+4
	rsb	r2, r3, r3, lsl #3
	ldr	r4, [lr, #36]
	add	r2, ip, r2, lsl #3
	cmp	r0, #0
	str	r1, [r2, #52]
	str	r4, [r2, #32]
	str	r5, [r2, #48]
	lsl	r1, r3, #3
	bne	.L52
	str	r5, [r2, #40]
	cmp	r4, #7
	ldrls	pc, [pc, r4, asl #2]
	b	.L52
.L57:
	.word	.L64
	.word	.L63
	.word	.L62
	.word	.L61
	.word	.L60
	.word	.L59
	.word	.L58
	.word	.L56
.L56:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r3, r3, #3
	sub	r1, r2, #2
	ldr	r2, [lr, #4]
	str	r1, [ip, r3]!
	sub	r3, r2, #2
	str	r3, [ip, #4]
.L52:
	pop	{r4, r5, lr}
	bx	lr
.L64:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	add	r2, r2, #4
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	sub	r3, r3, #3
	str	r3, [ip, #4]
	b	.L52
.L63:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	add	r2, r2, #10
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	sub	r3, r3, #2
	str	r3, [ip, #4]
	b	.L52
.L62:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	add	r2, r2, #11
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	add	r3, r3, #4
	str	r3, [ip, #4]
	b	.L52
.L61:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	add	r2, r2, #10
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	add	r3, r3, #10
	str	r3, [ip, #4]
	b	.L52
.L60:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	add	r2, r2, #4
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	add	r3, r3, #11
	str	r3, [ip, #4]
	b	.L52
.L59:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	sub	r2, r2, #2
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	add	r3, r3, #10
	str	r3, [ip, #4]
	b	.L52
.L58:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	sub	r2, r2, #3
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	add	r3, r3, #4
	str	r3, [ip, #4]
	b	.L52
.L73:
	.align	2
.L72:
	.word	bullets
	.word	player
	.size	newBullet, .-newBullet
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
	@ link register save eliminated.
	ldr	r3, .L93
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L75
	ldr	r1, .L93+4
	ldr	r2, [r1]
	cmp	r2, #0
	movgt	r0, #6
	subgt	r2, r2, #1
	strgt	r2, [r1]
	strgt	r0, [r1, #36]
.L75:
	tst	r3, #16
	bne	.L76
	ldr	r2, .L93+4
	ldr	r0, [r2]
	ldr	r1, [r2, #24]
	add	r1, r0, r1
	cmp	r1, #239
	movle	r1, #2
	addle	r0, r0, #1
	strle	r0, [r2]
	strle	r1, [r2, #36]
.L76:
	ands	r0, r3, #64
	bne	.L78
	ldr	r1, .L93+4
	ldr	r2, [r1, #4]
	cmp	r2, #18
	bgt	.L91
.L78:
	tst	r3, #128
	bne	.L83
	ldr	r1, .L93+4
	ldr	r0, [r1, #4]
	ldr	r2, [r1, #28]
	add	r2, r0, r2
	cmp	r2, #159
	ble	.L92
.L83:
	ldr	r2, .L93+8
	ldrh	r2, [r2]
	tst	r2, #1
	bxeq	lr
	tst	r3, #1
	bxne	lr
	ldr	r3, .L93+4
	ldr	r0, [r3, #40]
	cmp	r0, #0
	bxne	lr
	mov	r2, #1
	str	r2, [r3, #40]
	b	newBullet
.L92:
	and	r2, r3, #48
	cmp	r2, #16
	moveq	r2, #5
	add	r0, r0, #1
	str	r0, [r1, #4]
	streq	r2, [r1, #36]
	beq	.L83
	cmp	r2, #32
	movne	r2, #4
	moveq	r2, #3
	str	r2, [r1, #36]
	b	.L83
.L91:
	and	ip, r3, #48
	sub	r2, r2, #1
	cmp	ip, #16
	str	r2, [r1, #4]
	moveq	r2, #7
	streq	r2, [r1, #36]
	beq	.L78
	cmp	ip, #32
	moveq	r2, #1
	strne	r0, [r1, #36]
	streq	r2, [r1, #36]
	b	.L78
.L94:
	.align	2
.L93:
	.word	buttons
	.word	player
	.word	oldButtons
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
	push	{r4, lr}
	bl	updatePlayer
	ldr	r0, .L103
	add	r4, r0, #1120
.L97:
	ldr	r3, [r0, #48]
	cmp	r3, #0
	blne	updateBullets.part.0
.L96:
	add	r0, r0, #56
	cmp	r0, r4
	bne	.L97
	pop	{r4, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	bullets
	.size	updateGame, .-updateGame
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
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
	ldr	r4, .L111
	ldr	r3, [r4]
	sub	r2, r3, #40
	cmp	r2, #39
	sub	sp, sp, #12
	bls	.L109
	cmp	r3, #79
	bgt	.L110
.L107:
	add	r3, r3, #1
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L110:
	mov	ip, #0
	mov	r3, #992
	mov	r1, #90
	mov	r0, #59
	ldr	r2, .L111+4
	ldr	r5, .L111+8
	str	ip, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	b	.L107
.L109:
	ldr	r2, .L111+12
	mov	r3, #8
	str	r2, [sp]
	mov	r1, #90
	mov	r2, #120
	mov	r0, #59
	ldr	r5, .L111+16
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	b	.L107
.L112:
	.align	2
.L111:
	.word	time
	.word	.LC0
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
	ldr	r4, .L128
	ldr	ip, .L128+4
	sub	sp, sp, #12
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldr	r5, .L128+8
	ldm	r0, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #44]
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #24]
	mov	lr, pc
	bx	r5
	mov	r3, #9
	ldm	r4, {r0, r1}
	ldr	ip, .L128+12
	mov	r2, r3
	str	ip, [sp]
	add	r1, r1, #1
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	mov	r3, #5
	ldm	r4, {r0, r1}
	ldr	ip, .L128+16
	mov	r2, r3
	str	ip, [sp]
	add	r1, r1, #3
	add	r0, r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #36]
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L126
.L116:
	.word	.L123
	.word	.L122
	.word	.L121
	.word	.L120
	.word	.L119
	.word	.L118
	.word	.L117
	.word	.L115
.L115:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r0, r2, #2
	rsb	ip, r0, r0, lsl #4
	add	r1, r3, ip, lsl #4
	ldr	lr, .L128+20
	add	r0, r3, #2
	sub	r1, r1, #239
.L127:
	add	r0, r0, ip, lsl #4
	ldr	ip, [lr]
	ldr	lr, .L128+16
	lsl	r1, r1, #1
	lsl	r0, r0, #1
	strh	lr, [ip, r0]	@ movhi
	strh	lr, [ip, r1]	@ movhi
.L124:
	str	r3, [r4, #8]
	str	r2, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L123:
	ldr	r3, .L128+16
	ldr	r0, [r4]
	str	r3, [sp]
	mov	r2, #1
	mov	r3, #3
	ldr	r1, [r4, #4]
	add	r0, r0, #5
	mov	lr, pc
	bx	r5
.L126:
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	b	.L124
.L122:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r0, r2, #1
	rsb	ip, r0, r0, lsl #4
	add	r1, r3, ip, lsl #4
	ldr	lr, .L128+20
	add	r0, r3, #9
	add	r1, r1, #248
	b	.L127
.L121:
	ldm	r4, {r0, r1}
	ldr	r3, .L128+16
	mov	r2, #3
	str	r3, [sp]
	add	r1, r1, #5
	mov	r3, #1
	add	r0, r0, #8
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	b	.L124
.L120:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r0, r2, #8
	rsb	ip, r0, r0, lsl #4
	add	r1, r3, ip, lsl #4
	ldr	lr, .L128+20
	add	r0, r3, #8
	add	r1, r1, #249
	b	.L127
.L119:
	ldm	r4, {r0, r1}
	ldr	r3, .L128+16
	mov	r2, #1
	str	r3, [sp]
	add	r1, r1, #8
	mov	r3, #3
	add	r0, r0, #5
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	b	.L124
.L118:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r0, r2, #8
	rsb	ip, r0, r0, lsl #4
	add	r1, r3, ip, lsl #4
	ldr	lr, .L128+20
	add	r0, r3, #2
	add	r1, r1, #241
	b	.L127
.L117:
	ldr	r1, [r4, #4]
	ldr	r3, .L128+16
	mov	r2, #3
	str	r3, [sp]
	ldr	r0, [r4]
	mov	r3, #1
	add	r1, r1, #5
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	b	.L124
.L129:
	.align	2
.L128:
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
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldrh	r2, [r0, #36]
	sub	sp, sp, #8
	ldr	r3, [r0, #28]
	str	r2, [sp]
	ldr	r4, .L139
	ldr	r2, [r0, #24]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L140:
	.align	2
.L139:
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
	push	{r4, r5, lr}
	ldr	r3, [r0, #48]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L145
	ldr	r3, [r0, #52]
	cmp	r3, #0
	beq	.L146
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L146:
	ldr	r2, .L147
	ldr	r3, [r0, #28]
	str	r2, [sp]
	ldr	r5, .L147+4
	ldr	r2, [r0, #24]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #52]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L145:
	ldr	r2, .L147
	ldr	r3, [r0, #28]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #16]
	ldr	r5, .L147+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #44]
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L148:
	.align	2
.L147:
	.word	15855
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
	ldr	r5, .L151
	sub	sp, sp, #12
	add	r9, r0, #3
	ldr	r10, .L151+4
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
	ldr	r0, .L151+8
	rsb	ip, r1, r1, lsl #4
	add	r3, r4, #12
	add	r2, r4, ip, lsl #4
	ldr	r0, [r0]
	add	r3, r3, ip, lsl #4
	ldr	fp, .L151+12
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
	ldr	r3, .L151+8
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
	ldr	fp, .L151+16
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
.L152:
	.align	2
.L151:
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
	ldr	r6, .L158
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L153
	mov	r5, #5
	mov	r4, #0
.L155:
	mov	r0, r5
	mov	r1, #5
	bl	drawTankIcon
	ldr	r3, [r6]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #18
	bgt	.L155
.L153:
	pop	{r4, r5, r6, lr}
	bx	lr
.L159:
	.align	2
.L158:
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
	mov	r4, #0
	bl	drawPlayer
	ldr	r5, .L171
	ldr	r6, .L171+4
	ldr	r7, .L171+8
	b	.L164
.L161:
	mov	r0, r5
	bl	drawBullets
	cmp	r4, #19
	beq	.L160
.L165:
	add	r4, r4, #1
	add	r5, r5, #56
	add	r6, r6, #48
.L164:
	cmp	r4, #4
	bhi	.L161
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L170
.L162:
	mov	r0, r5
	bl	drawBullets
	b	.L165
.L170:
	ldrh	r2, [r6, #36]
	ldr	r3, [r6, #28]
	str	r2, [sp]
	ldm	r6, {r0, r1}
	ldr	r2, [r6, #24]
	mov	lr, pc
	bx	r7
	b	.L162
.L160:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L172:
	.align	2
.L171:
	.word	bullets
	.word	enemies
	.word	drawRect
	.size	drawGame, .-drawGame
	.comm	lives,4,4
	.comm	time,4,4
	.comm	spawned,4,4
	.comm	score,4,4
	.comm	enemies,240,4
	.comm	bullets,1120,4
	.comm	player,48,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
