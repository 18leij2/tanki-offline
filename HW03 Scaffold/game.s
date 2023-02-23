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
	.type	updateEnemies.part.0, %function
updateEnemies.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L14
	ldr	ip, [r5, #24]
	sub	sp, sp, #16
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldr	r6, [r5, #28]
	ldr	lr, [r5, #4]
	mov	r4, r0
	ldm	r0, {r0, r1}
	str	ip, [sp, #8]
	ldr	ip, [r5]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L14+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L2
	ldr	r3, [r5, #36]
	cmp	r3, #0
	beq	.L13
.L2:
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #4]
	add	r2, r1, r2
	cmp	r2, #17
	movle	ip, #18
	movle	r2, ip
	rsble	r1, r1, #0
	strle	r1, [r4, #20]
	ldr	r1, [r4, #28]
	ldr	r3, [r4]
	ldr	r0, [r4, #16]
	add	r1, r2, r1
	strgt	r2, [r4, #4]
	strle	ip, [r4, #4]
	add	r3, r0, r3
	cmp	r1, #160
	str	r3, [r4]
	ble	.L5
	ldr	ip, [r4, #20]
	sub	r1, r1, #160
	sub	r2, r2, r1
	rsb	r1, ip, #0
	str	r2, [r4, #4]
	str	r1, [r4, #20]
.L5:
	cmp	r3, #0
	ldr	r2, [r4, #24]
	rsblt	r3, r3, #0
	rsblt	r0, r0, #0
	add	r2, r3, r2
	strlt	r3, [r4]
	strlt	r0, [r4, #16]
	cmp	r2, #240
	ble	.L1
	ldr	r1, [r4, #16]
	sub	r2, r2, #240
	sub	r3, r3, r2
	rsb	r2, r1, #0
	str	r3, [r4]
	str	r2, [r4, #16]
.L1:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	mov	r2, #67108864
	mov	r0, #22016
	mov	r1, #1
	ldr	r3, [r5, #32]
	ldr	ip, .L14+8
	sub	r3, r3, #1
	str	r3, [r5, #32]
	str	r3, [ip]
	ldr	r3, .L14+12
	strh	r0, [r2, #104]	@ movhi
	str	r1, [r5, #36]
	strh	r3, [r2, #108]	@ movhi
	b	.L2
.L15:
	.align	2
.L14:
	.word	player
	.word	collision
	.word	lives
	.word	-31912
	.size	updateEnemies.part.0, .-updateEnemies.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets.part.0, %function
updateBullets.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	ldr	r4, .L47
	ldr	r7, .L47+4
	ldr	r8, .L47+8
	ldr	r9, .L47+12
	sub	sp, sp, #20
	add	r6, r4, #240
.L21:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L46
.L18:
	add	r4, r4, #48
	cmp	r6, r4
	bne	.L21
	ldr	r3, [r5, #32]
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L16
.L24:
	.word	.L31
	.word	.L30
	.word	.L29
	.word	.L28
	.word	.L27
	.word	.L26
	.word	.L25
	.word	.L23
.L46:
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L18
	mov	r3, #0
	ldr	r2, [r5, #40]
	cmp	r2, r3
	beq	.L20
	mov	r0, #67108864
	mov	ip, #22016
	ldr	r1, [r8]
	add	r1, r1, #1
	str	r1, [r8]
	ldr	r1, .L47+16
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	r3, [r9, #44]
	strh	ip, [r0, #120]	@ movhi
	strh	r1, [r0, #124]	@ movhi
.L20:
	str	r3, [r5, #48]
	str	r3, [r5, #52]
	b	.L18
.L29:
	ldr	r2, [r5]
	ldr	r3, [r5, #24]
	ldr	r1, [r5, #36]
	add	r3, r2, r3
	sub	r3, r3, #1
	add	r3, r3, r1
	cmp	r3, #239
	addle	r2, r2, r1
	strle	r2, [r5]
	ble	.L16
.L33:
	mov	r3, #0
	ldr	r2, [r5, #40]
	cmp	r2, r3
	str	r3, [r5, #48]
	ldrne	r2, .L47+12
	strne	r3, [r2, #44]
.L16:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L23:
	ldr	r2, [r5]
	ldr	r3, [r5, #36]
	sub	r1, r2, r3
	cmp	r1, #0
	ble	.L33
	ldr	r1, [r5, #4]
	sub	r0, r1, r3
	cmp	r0, #18
	ble	.L33
	sub	r3, r3, #1
	sub	r2, r2, r3
	str	r2, [r5]
	sub	r3, r1, r3
	b	.L45
.L31:
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #36]
	sub	r3, r3, r2
	cmp	r3, #17
	ble	.L33
.L45:
	str	r3, [r5, #4]
	b	.L16
.L30:
	ldr	r1, [r5]
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #36]
	add	r3, r1, r3
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #240
	bgt	.L33
	ldr	r3, [r5, #4]
	sub	r0, r3, r2
	cmp	r0, #18
	ble	.L33
	sub	r2, r2, #1
	sub	r3, r3, r2
	add	r2, r1, r2
	stm	r5, {r2, r3}
	b	.L16
.L28:
	ldr	r1, [r5]
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #36]
	add	r3, r1, r3
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #240
	bgt	.L33
	ldr	r0, [r5, #4]
	ldr	r3, [r5, #28]
	add	r3, r0, r3
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #160
	bgt	.L33
	sub	r2, r2, #1
	add	r1, r1, r2
	add	r2, r0, r2
	stm	r5, {r1, r2}
	b	.L16
.L27:
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #28]
	ldr	r1, [r5, #36]
	add	r3, r2, r3
	sub	r3, r3, #1
	add	r3, r3, r1
	cmp	r3, #159
	addle	r2, r2, r1
	strle	r2, [r5, #4]
	ble	.L16
	b	.L33
.L26:
	ldr	r1, [r5]
	ldr	r2, [r5, #36]
	sub	r3, r1, r2
	cmp	r3, #0
	ble	.L33
	ldr	r0, [r5, #4]
	ldr	r3, [r5, #28]
	add	r3, r0, r3
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #160
	bgt	.L33
	sub	r2, r2, #1
	sub	r1, r1, r2
	add	r2, r0, r2
	stm	r5, {r1, r2}
	b	.L16
.L25:
	ldr	r3, [r5]
	ldr	r2, [r5, #36]
	subs	r3, r3, r2
	strpl	r3, [r5]
	bpl	.L16
	b	.L33
.L48:
	.align	2
.L47:
	.word	enemies
	.word	collision
	.word	score
	.word	player
	.word	-30970
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
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #3
	mov	lr, #1
	mov	r0, #130
	mov	r1, #11
	ldr	r3, .L51
	str	ip, [r3]
	str	ip, [r3, #8]
	ldr	ip, .L51+4
	str	r4, [r3, #32]
	str	lr, [r3, #52]
	strh	ip, [r3, #56]	@ movhi
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	pop	{r4, lr}
	bx	lr
.L52:
	.align	2
.L51:
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
	mov	r5, #10
	mov	r9, #30
	mov	r7, #15
	ldr	r4, .L64
	ldr	r6, .L64+4
	ldr	r8, .L64+8
.L61:
	mov	r3, #0
	mov	r1, #10
	mov	r2, #1
	str	r3, [r4, #32]
	stm	r4, {r5, r9}
	str	r5, [r4, #8]
	str	r9, [r4, #12]
	str	r7, [r4, #24]
	str	r1, [r4, #28]
	str	r2, [r4, #40]
	mov	lr, pc
	bx	r6
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L55
.L57:
	.word	.L60
	.word	.L59
	.word	.L58
	.word	.L56
.L56:
	mvn	r2, #1
	mov	r3, #2
	strh	r8, [r4, #36]	@ movhi
	str	r2, [r4, #16]
	str	r3, [r4, #20]
.L55:
	add	r5, r5, #30
	cmp	r5, #160
	add	r4, r4, #48
	bne	.L61
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L58:
	mvn	r1, #64512
	mov	r2, #1
	mvn	r3, #0
	strh	r1, [r4, #36]	@ movhi
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	b	.L55
.L60:
	mov	r3, #1
	mov	r2, #31744
	str	r3, [r4, #16]
	strh	r2, [r4, #36]	@ movhi
	str	r3, [r4, #20]
	b	.L55
.L59:
	mvn	r3, #0
	mov	r2, #31
	str	r3, [r4, #16]
	strh	r2, [r4, #36]	@ movhi
	str	r3, [r4, #20]
	b	.L55
.L65:
	.align	2
.L64:
	.word	enemies
	.word	rand
	.word	31775
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
	str	lr, [sp, #-4]!
	ldr	r3, .L71
	ldr	lr, .L71+4
.L68:
	str	r2, [r3]
	str	r2, [r3, #8]
	add	r2, r2, #15
	cmp	r2, #160
	str	ip, [r3, #4]
	str	ip, [r3, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #48]
	str	r1, [r3, #32]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	strh	lr, [r3, #44]	@ movhi
	add	r3, r3, #56
	bne	.L68
	ldr	lr, [sp], #4
	bx	lr
.L72:
	.align	2
.L71:
	.word	bullets
	.word	5285
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
	push	{r4, r5, r6, lr}
	mov	r0, #117
	mov	r1, #130
	mov	r2, #11
	mov	ip, #1
	mov	r5, #3
	ldr	r4, .L75
	ldr	lr, .L75+4
	str	r3, [r4, #16]
	str	r3, [lr]
	str	r3, [r4, #20]
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	r3, [r4, #48]
	ldr	r3, .L75+8
	str	ip, [r4, #52]
	str	r0, [r4]
	strh	r3, [r4, #56]	@ movhi
	str	r0, [r4, #8]
	str	r1, [r4, #4]
	str	r1, [r4, #12]
	str	r2, [r4, #28]
	str	r2, [r4, #24]
	str	r5, [r4, #32]
	bl	initEnemies
	bl	initBullets
	mov	r3, #120
	mov	lr, #4
	mov	ip, #180
	mov	r0, #109
	mov	r1, #50
	mvn	r2, #0
	ldr	r6, [r4, #32]
	ldr	r4, .L75+12
	str	r6, [r4]
	ldr	r4, .L75+16
	str	r5, [r4]
	ldr	r4, .L75+20
	str	r5, [r4]
	ldr	r4, .L75+24
	str	r3, [r4]
	ldr	r4, .L75+28
	str	r3, [r4]
	ldr	r4, .L75+32
	str	r3, [r4]
	ldr	r4, .L75+36
	str	r3, [r4]
	ldr	r3, .L75+40
	str	lr, [r3]
	ldr	r3, .L75+44
	str	lr, [r3]
	ldr	r3, .L75+48
	ldr	lr, .L75+52
	str	ip, [r3]
	ldr	r3, .L75+56
	str	ip, [lr]
	str	r0, [r3]
	ldr	lr, .L75+60
	ldr	ip, .L75+64
	ldr	r3, .L75+68
	str	r0, [lr]
	str	r1, [r3]
	ldr	r4, .L75+72
	ldr	lr, .L75+76
	str	r1, [ip]
	ldr	r0, .L75+80
	ldr	ip, .L75+84
	ldr	r3, .L75+88
	ldr	r1, .L75+92
	str	r2, [r4]
	str	r2, [lr]
	strh	ip, [r0]	@ movhi
	strh	r1, [r3]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	player
	.word	score
	.word	5285
	.word	lives
	.word	powerupWidth
	.word	powerupHeight
	.word	powerupX
	.word	powerupY
	.word	powerupOldX
	.word	powerupOldY
	.word	powerupXVelocity
	.word	powerupYVelocity
	.word	nullX
	.word	nullOldX
	.word	nullY
	.word	nullOldY
	.word	nullWidth
	.word	nullHeight
	.word	nullXVelocity
	.word	nullYVelocity
	.word	mainColor
	.word	2466
	.word	accent
	.word	2849
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
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemies.part.0
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
	ldr	ip, .L101
	mov	r3, #0
	mov	r2, ip
	b	.L94
.L82:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #56
	bxeq	lr
.L94:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L82
	push	{r4, r5, lr}
	mov	r5, #1
	ldr	lr, .L101+4
	rsb	r2, r3, r3, lsl #3
	ldr	r4, [lr, #40]
	add	r2, ip, r2, lsl #3
	cmp	r0, #0
	str	r1, [r2, #52]
	str	r4, [r2, #32]
	str	r5, [r2, #48]
	lsl	r1, r3, #3
	bne	.L81
	str	r5, [r2, #40]
	cmp	r4, #7
	ldrls	pc, [pc, r4, asl #2]
	b	.L81
.L86:
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L88
	.word	.L87
	.word	.L85
.L85:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r3, r3, #3
	sub	r1, r2, #2
	ldr	r2, [lr, #4]
	str	r1, [ip, r3]!
	sub	r3, r2, #2
	str	r3, [ip, #4]
.L81:
	pop	{r4, r5, lr}
	bx	lr
.L87:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	sub	r2, r2, #3
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	add	r3, r3, #4
	str	r3, [ip, #4]
	b	.L81
.L88:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	sub	r2, r2, #2
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	add	r3, r3, #10
	str	r3, [ip, #4]
	b	.L81
.L89:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	add	r2, r2, #4
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	add	r3, r3, #11
	str	r3, [ip, #4]
	b	.L81
.L90:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	add	r2, r2, #10
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	add	r3, r3, #10
	str	r3, [ip, #4]
	b	.L81
.L91:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	add	r2, r2, #11
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	add	r3, r3, #4
	str	r3, [ip, #4]
	b	.L81
.L92:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	add	r2, r2, #10
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	sub	r3, r3, #2
	str	r3, [ip, #4]
	b	.L81
.L93:
	ldr	r2, [lr]
	sub	r3, r1, r3
	lsl	r1, r3, #3
	add	r2, r2, #4
	ldr	r3, [lr, #4]
	str	r2, [ip, r1]!
	sub	r3, r3, #3
	str	r3, [ip, #4]
	b	.L81
.L102:
	.align	2
.L101:
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
	push	{r4, r5, lr}
	ldr	r4, .L134
	ldr	r3, [r4, #36]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L104
	ldr	r2, .L134+4
	ldr	r3, [r2]
	cmp	r3, #79
	movgt	r3, #0
	addle	r3, r3, #1
	strgt	r3, [r2]
	strgt	r3, [r4, #36]
	strle	r3, [r2]
.L104:
	ldr	r0, .L134+8
	ldr	r1, .L134+12
	ldr	r2, .L134+16
	ldr	r3, .L134+20
	ldr	r0, [r0]
	ldr	r1, [r1]
	ldr	r2, [r2]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r5, .L134+24
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L106
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L130
.L106:
	ldr	r3, .L134+28
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L107
	ldr	r1, [r4, #52]
	ldr	r2, [r4]
	subs	r2, r2, r1
	movpl	r1, #6
	strpl	r2, [r4]
	strpl	r1, [r4, #40]
.L107:
	tst	r3, #16
	bne	.L108
	ldr	r1, [r4]
	ldr	r2, [r4, #24]
	add	r2, r1, r2
	cmp	r2, #239
	movle	r0, #2
	ldrle	r2, [r4, #52]
	addle	r1, r2, r1
	strle	r1, [r4]
	strle	r0, [r4, #40]
.L108:
	ands	r1, r3, #64
	bne	.L110
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #52]
	sub	r2, r2, r0
	cmp	r2, #17
	bgt	.L131
.L110:
	tst	r3, #128
	bne	.L115
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #28]
	add	r2, r1, r2
	cmp	r2, #159
	ble	.L132
.L115:
	ldr	r2, .L134+32
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L103
	tst	r3, #1
	bne	.L103
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L133
.L103:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L132:
	ldr	r2, [r4, #52]
	and	r0, r3, #48
	cmp	r0, #16
	add	r1, r2, r1
	moveq	r2, #5
	str	r1, [r4, #4]
	streq	r2, [r4, #40]
	beq	.L115
	cmp	r0, #32
	movne	r2, #4
	moveq	r2, #3
	str	r2, [r4, #40]
	b	.L115
.L131:
	and	r0, r3, #48
	cmp	r0, #16
	str	r2, [r4, #4]
	moveq	r2, #7
	streq	r2, [r4, #40]
	beq	.L110
	cmp	r0, #32
	moveq	r2, #1
	strne	r1, [r4, #40]
	streq	r2, [r4, #40]
	b	.L110
.L130:
	mov	r3, #67108864
	mov	r1, #22016
	mov	lr, #1
	mov	ip, #2
	ldr	r2, .L134+36
	ldr	r0, .L134+40
	strh	r0, [r2]	@ movhi
	ldr	r2, .L134+44
	ldr	r0, .L134+48
	strh	r0, [r2]	@ movhi
	ldr	r2, .L134+52
	str	lr, [r4, #48]
	str	ip, [r4, #52]
	strh	r1, [r3, #104]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	b	.L106
.L133:
	ldr	r0, .L134+56
	ldr	r1, .L134+60
	ldr	r2, .L134+64
	ldr	r3, .L134+68
	ldr	r0, [r0]
	ldr	r1, [r1]
	ldr	r2, [r2]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L103
	ldr	r3, [r4, #48]
	cmp	r3, #0
	moveq	r3, #1
	mov	r0, #0
	streq	r3, [r4, #44]
	bl	newBullet
	mov	r3, #67108864
	mov	r1, #20992
	ldr	r2, .L134+72
	strh	r1, [r3, #104]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	b	.L103
.L135:
	.align	2
.L134:
	.word	player
	.word	damageTime
	.word	powerupHeight
	.word	powerupWidth
	.word	powerupY
	.word	powerupX
	.word	collision
	.word	buttons
	.word	oldButtons
	.word	mainColor
	.word	1589
	.word	accent
	.word	13149
	.word	-30783
	.word	nullHeight
	.word	nullWidth
	.word	nullY
	.word	nullX
	.word	-31613
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
	push	{r4, r5, r6, r7, r8, lr}
	bl	updatePlayer
	mov	r4, #0
	ldr	r5, .L167
	ldr	r6, .L167+4
	b	.L141
.L165:
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L164
.L138:
	ldr	r3, [r5, #48]
	cmp	r3, #0
	beq	.L154
.L153:
	mov	r0, r5
	bl	updateBullets.part.0
	cmp	r4, #9
	beq	.L140
.L154:
	add	r4, r4, #1
	add	r5, r5, #56
	add	r6, r6, #48
.L141:
	cmp	r4, #4
	bls	.L165
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L153
	cmp	r4, #9
	bne	.L154
.L140:
	ldr	lr, .L167+8
	ldr	ip, .L167+12
	ldr	r2, [lr]
	ldr	r1, [ip]
	add	r2, r1, r2
	cmp	r2, #17
	movle	r6, #18
	movle	r2, r6
	rsble	r1, r1, #0
	strle	r1, [ip]
	ldr	r1, .L167+16
	ldr	r0, .L167+20
	ldr	r4, .L167+24
	ldr	r1, [r1]
	ldr	r3, [r0]
	ldr	r5, [r4]
	add	r1, r2, r1
	strgt	r2, [lr]
	strle	r6, [lr]
	add	r3, r5, r3
	cmp	r1, #160
	str	r3, [r0]
	ble	.L144
	ldr	r6, [ip]
	sub	r1, r1, #160
	sub	r2, r2, r1
	rsb	r1, r6, #0
	str	r2, [lr]
	str	r1, [ip]
.L144:
	ldr	r2, .L167+28
	cmp	r3, #0
	ldr	r2, [r2]
	rsblt	r3, r3, #0
	rsblt	r5, r5, #0
	add	r2, r3, r2
	strlt	r3, [r0]
	strlt	r5, [r4]
	cmp	r2, #240
	ble	.L146
	ldr	r1, [r4]
	sub	r2, r2, #240
	sub	r3, r3, r2
	rsb	r2, r1, #0
	str	r3, [r0]
	str	r2, [r4]
.L146:
	ldr	r5, .L167+32
	ldr	r0, .L167+36
	ldr	r2, [r5]
	ldr	r1, [r0]
	add	r2, r1, r2
	cmp	r2, #17
	movle	r6, #18
	movle	r2, r6
	rsble	r1, r1, #0
	strle	r1, [r0]
	ldr	r1, .L167+40
	ldr	r4, .L167+44
	ldr	ip, .L167+48
	ldr	r1, [r1]
	ldr	r3, [r4]
	ldr	lr, [ip]
	add	r1, r2, r1
	strgt	r2, [r5]
	strle	r6, [r5]
	add	r3, lr, r3
	cmp	r1, #160
	str	r3, [r4]
	ble	.L149
	ldr	r6, [r0]
	sub	r1, r1, #160
	sub	r2, r2, r1
	rsb	r1, r6, #0
	str	r2, [r5]
	str	r1, [r0]
.L149:
	ldr	r2, .L167+52
	cmp	r3, #0
	ldr	r2, [r2]
	rsblt	r3, r3, #0
	rsblt	lr, lr, #0
	add	r2, r3, r2
	strlt	r3, [r4]
	strlt	lr, [ip]
	cmp	r2, #240
	ble	.L151
	ldr	r1, [ip]
	sub	r2, r2, #240
	sub	r3, r3, r2
	rsb	r2, r1, #0
	str	r3, [r4]
	str	r2, [ip]
.L151:
	ldr	r6, .L167+56
	ldr	r3, [r6]
	cmp	r3, #400
	bge	.L166
	add	r3, r3, #1
	str	r3, [r6]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L164:
	mov	r0, r6
	bl	updateEnemies.part.0
	b	.L138
.L166:
	mov	r3, #0
	ldr	r7, .L167+60
	str	r3, [r6]
	mov	lr, pc
	bx	r7
	ldr	r2, .L167+64
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #6
	sub	r3, r0, r3
	str	r3, [r4]
	mov	lr, pc
	bx	r7
	ldr	r3, .L167+68
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r2, r3, r3, lsl #2
	add	r2, r2, r2, lsl #2
	add	r3, r3, r2, lsl #2
	sub	r0, r0, r3
	ldr	r3, [r6]
	add	r0, r0, #18
	add	r3, r3, #1
	str	r0, [r5]
	str	r3, [r6]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L168:
	.align	2
.L167:
	.word	bullets
	.word	enemies
	.word	powerupY
	.word	powerupYVelocity
	.word	powerupHeight
	.word	powerupX
	.word	powerupXVelocity
	.word	powerupWidth
	.word	nullY
	.word	nullYVelocity
	.word	nullHeight
	.word	nullX
	.word	nullXVelocity
	.word	nullWidth
	.word	nullTime
	.word	rand
	.word	-1386206375
	.word	680390859
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
	ldr	r4, .L175
	ldr	r3, [r4]
	sub	r2, r3, #40
	cmp	r2, #39
	sub	sp, sp, #12
	bls	.L173
	cmp	r3, #79
	bgt	.L174
.L171:
	add	r3, r3, #1
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L174:
	mov	ip, #0
	mov	r3, #992
	mov	r1, #90
	mov	r0, #59
	ldr	r2, .L175+4
	ldr	r5, .L175+8
	str	ip, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	b	.L171
.L173:
	ldr	r2, .L175+12
	mov	r3, #8
	str	r2, [sp]
	mov	r1, #90
	mov	r2, #120
	mov	r0, #59
	ldr	r5, .L175+16
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	b	.L171
.L176:
	.align	2
.L175:
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L194
	ldr	r8, .L194+4
	sub	sp, sp, #8
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L194+8
	str	r8, [sp]
	mov	lr, pc
	bx	r5
	ldr	r7, .L194+12
	str	r8, [sp]
	ldr	r6, .L194+16
	ldr	r1, .L194+20
	ldr	r0, .L194+24
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r5
	ldr	ip, .L194+28
	ldr	r1, .L194+32
	ldr	r0, .L194+36
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	r1, [r1]
	ldr	r0, [r0]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L193
	ldr	r2, .L194+40
	ldr	r3, .L194+44
	ldr	r2, [r2]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #1
	cmp	r3, #4
	ldm	r4, {r0, r1}
	ble	.L179
.L180:
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L193:
	ldm	r4, {r0, r1}
.L179:
	ldrh	r3, [r4, #56]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	mov	lr, pc
	bx	r5
	mov	r3, #9
	ldr	r2, .L194+48
	ldr	r1, [r4, #4]
	ldrh	r2, [r2]
	ldr	r0, [r4]
	str	r2, [sp]
	add	r1, r1, #1
	mov	r2, r3
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	mov	r3, #5
	ldr	r6, .L194+52
	ldr	r1, [r4, #4]
	ldrh	r2, [r6]
	ldr	r0, [r4]
	str	r2, [sp]
	add	r1, r1, #3
	mov	r2, r3
	add	r0, r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #40]
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L192
.L183:
	.word	.L190
	.word	.L189
	.word	.L188
	.word	.L187
	.word	.L186
	.word	.L185
	.word	.L184
	.word	.L182
.L182:
	ldm	r4, {r0, r1}
	add	r2, r1, #2
	rsb	ip, r2, r2, lsl #4
	ldr	r5, .L194+56
	add	r3, r0, ip, lsl #4
	add	r2, r0, #2
	ldrh	lr, [r6]
	add	r2, r2, ip, lsl #4
	sub	r3, r3, #239
	ldr	ip, [r5]
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	strh	lr, [ip, r2]	@ movhi
	strh	lr, [ip, r3]	@ movhi
	b	.L180
.L190:
	ldrh	r3, [r6]
	ldr	r0, [r4]
	str	r3, [sp]
	mov	r2, #1
	mov	r3, #3
	ldr	r1, [r4, #4]
	add	r0, r0, #5
	mov	lr, pc
	bx	r5
.L192:
	ldm	r4, {r0, r1}
	b	.L180
.L189:
	ldm	r4, {r0, r1}
	ldr	ip, .L194+56
	add	r3, r1, #1
	rsb	r3, r3, r3, lsl #4
	add	r2, r0, #9
	ldr	ip, [ip]
	ldrh	lr, [r6]
	add	r2, r2, r3, lsl #4
	lsl	r2, r2, #1
	strh	lr, [ip, r2]	@ movhi
	add	r3, r0, r3, lsl #4
	ldrh	r2, [r6]
	add	r3, r3, #248
	lsl	r3, r3, #1
	strh	r2, [ip, r3]	@ movhi
	b	.L180
.L188:
	ldrh	r3, [r6]
	ldm	r4, {r0, r1}
	str	r3, [sp]
	add	r1, r1, #5
	add	r0, r0, #8
	mov	r3, #1
	mov	r2, #3
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	b	.L180
.L187:
	ldm	r4, {r0, r1}
	ldr	ip, .L194+56
	add	r3, r1, #8
	rsb	r3, r3, r3, lsl #4
	add	r2, r0, #8
	ldr	ip, [ip]
	ldrh	lr, [r6]
	add	r2, r2, r3, lsl #4
	lsl	r2, r2, #1
	strh	lr, [ip, r2]	@ movhi
	add	r3, r0, r3, lsl #4
	ldrh	r2, [r6]
	add	r3, r3, #249
	lsl	r3, r3, #1
	strh	r2, [ip, r3]	@ movhi
	b	.L180
.L186:
	ldrh	r3, [r6]
	ldm	r4, {r0, r1}
	str	r3, [sp]
	add	r1, r1, #8
	add	r0, r0, #5
	mov	r3, #3
	mov	r2, #1
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	b	.L180
.L185:
	ldm	r4, {r0, r1}
	ldr	ip, .L194+56
	add	r3, r1, #8
	rsb	r3, r3, r3, lsl #4
	add	r2, r0, #2
	ldr	ip, [ip]
	ldrh	lr, [r6]
	add	r2, r2, r3, lsl #4
	lsl	r2, r2, #1
	strh	lr, [ip, r2]	@ movhi
	add	r3, r0, r3, lsl #4
	ldrh	r2, [r6]
	add	r3, r3, #241
	lsl	r3, r3, #1
	strh	r2, [ip, r3]	@ movhi
	b	.L180
.L184:
	ldrh	r3, [r6]
	ldr	r1, [r4, #4]
	str	r3, [sp]
	ldr	r0, [r4]
	add	r1, r1, #5
	mov	r3, #1
	mov	r2, #3
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	b	.L180
.L195:
	.align	2
.L194:
	.word	player
	.word	15855
	.word	drawRect
	.word	nullHeight
	.word	nullWidth
	.word	nullOldY
	.word	nullOldX
	.word	9513
	.word	nullY
	.word	nullX
	.word	damageTime
	.word	1717986919
	.word	mainColor
	.word	accent
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, [r0, #40]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #8
	bne	.L200
	ldr	r3, [r0, #44]
	cmp	r3, #0
	beq	.L201
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L201:
	ldr	r6, .L202
	ldr	r3, [r0, #28]
	str	r6, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #16]
	ldr	r5, .L202+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	str	r6, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #44]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L200:
	ldr	r2, .L202
	ldr	r3, [r0, #28]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r5, .L202+4
	ldr	r2, [r0, #16]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldr	r7, .L202+8
	rsb	r6, r1, r1, lsl #4
	add	r2, r0, #2
	add	r3, r0, #12
	ldrh	lr, [r4, #36]
	ldr	ip, [r7]
	add	r2, r2, r6, lsl #4
	add	r3, r3, r6, lsl #4
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	strh	lr, [ip, r2]	@ movhi
	strh	lr, [ip, r3]	@ movhi
	ldrh	r3, [r4, #36]
	mov	r2, #9
	str	r3, [sp]
	add	r1, r1, #1
	mov	r3, #4
	add	r0, r0, #3
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	add	r3, r1, #2
	rsb	ip, r3, r3, lsl #4
	add	r2, r0, #2
	add	r3, r0, #12
	ldr	lr, [r7]
	add	r2, r2, ip, lsl #4
	add	r3, r3, ip, lsl #4
	ldrh	r6, [r4, #36]
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	strh	r6, [lr, r2]	@ movhi
	strh	r6, [lr, r3]	@ movhi
	ldrh	r3, [r4, #36]
	mov	r2, #2
	str	r3, [sp]
	add	r1, r1, #3
	mov	r3, #1
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #2
	str	r3, [sp]
	add	r1, r1, #3
	mov	r3, #1
	add	r0, r0, #12
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4, #36]
	ldr	r1, [r4, #4]
	str	r3, [sp]
	mov	r2, #3
	ldr	r0, [r4]
	mov	r3, #1
	add	r1, r1, #4
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #3
	str	r3, [sp]
	add	r1, r1, #4
	mov	r3, #1
	add	r0, r0, #12
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4, #36]
	ldr	r1, [r4, #4]
	str	r3, [sp]
	mov	r2, #6
	ldr	r0, [r4]
	mov	r3, #1
	add	r1, r1, #5
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #6
	str	r3, [sp]
	add	r1, r1, #5
	mov	r3, #1
	add	r0, r0, #9
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #4
	str	r3, [sp]
	add	r1, r1, #6
	mov	r3, #1
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #4
	str	r3, [sp]
	add	r1, r1, #6
	mov	r3, #1
	add	r0, r0, #10
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #2
	str	r3, [sp]
	add	r1, r1, #7
	mov	r3, #1
	add	r0, r0, #2
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #2
	str	r3, [sp]
	add	r1, r1, #7
	mov	r3, #1
	add	r0, r0, #11
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #2
	str	r3, [sp]
	add	r1, r1, #8
	mov	r3, #1
	add	r0, r0, #3
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #2
	str	r3, [sp]
	add	r1, r1, #8
	mov	r3, #1
	add	r0, r0, #10
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #2
	str	r3, [sp]
	add	r1, r1, #9
	mov	r3, #1
	add	r0, r0, #4
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #36]
	mov	r2, #2
	str	r3, [sp]
	add	r1, r1, #9
	mov	r3, #1
	add	r0, r0, #9
	mov	lr, pc
	bx	r5
	mov	r3, #3
	ldm	r4, {r0, r1}
	ldr	r8, .L202+12
	mov	r2, r3
	str	r8, [sp]
	add	r1, r1, #2
	add	r0, r0, #6
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	add	r2, r1, #2
	rsb	r2, r2, r2, lsl #4
	add	r3, r0, r2, lsl #4
	add	lr, r0, #5
	add	r6, lr, r2, lsl #4
	add	r3, r3, #724
	add	lr, r0, #9
	ldr	ip, [r7]
	add	r2, lr, r2, lsl #4
	add	r3, r3, #3
	lsl	lr, r6, #1
	ldr	r6, .L202+16
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	strh	r8, [ip, lr]	@ movhi
	add	r1, r1, #7
	strh	r8, [ip, r2]	@ movhi
	add	r0, r0, #6
	strh	r8, [ip, r3]	@ movhi
	mov	r2, #3
	mov	r3, #1
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #4]
	ldr	ip, [r4]
	add	r3, r0, #6
	rsb	r1, r3, r3, lsl #4
	add	r3, ip, #7
	add	r2, r3, r1, lsl #4
	mov	r3, r2
	ldr	lr, [r7]
	add	r2, r2, #480
	lsl	r3, r3, #1
	lsl	r2, r2, #1
	strh	r6, [lr, r3]	@ movhi
	strh	r6, [lr, r2]	@ movhi
	str	ip, [r4, #8]
	str	r0, [r4, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L203:
	.align	2
.L202:
	.word	15855
	.word	drawRect
	.word	videoBuffer
	.word	7807
	.word	32736
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
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #48]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #8
	bne	.L208
	ldr	r3, [r0, #52]
	cmp	r3, #0
	beq	.L209
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L209:
	ldr	r6, .L210
	ldr	r3, [r0, #28]
	str	r6, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #16]
	ldr	r5, .L210+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	str	r6, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #52]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L208:
	ldr	r2, .L210
	ldr	r3, [r0, #28]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #16]
	ldr	r5, .L210+4
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
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L211:
	.align	2
.L210:
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
	ldr	r5, .L214
	sub	sp, sp, #12
	add	r9, r0, #3
	ldr	r10, .L214+4
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
	ldr	r0, .L214+8
	rsb	ip, r1, r1, lsl #4
	add	r3, r4, #12
	add	r2, r4, ip, lsl #4
	ldr	r0, [r0]
	add	r3, r3, ip, lsl #4
	ldr	fp, .L214+12
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
	ldr	r3, .L214+8
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
	ldr	fp, .L214+16
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
.L215:
	.align	2
.L214:
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
	mov	r1, #5
	mov	r4, #0
	sub	sp, sp, #8
	ldr	r6, .L221
	mov	r3, #8
	mov	r0, r1
	mov	r2, #59
	str	r4, [sp]
	ldr	r5, .L221+4
	mov	lr, pc
	bx	r5
	ldr	r3, [r6]
	cmp	r3, r4
	ble	.L216
	mov	r5, #5
.L218:
	mov	r0, r5
	mov	r1, #5
	bl	drawTankIcon
	ldr	r3, [r6]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #18
	bgt	.L218
.L216:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L222:
	.align	2
.L221:
	.word	lives
	.word	drawRect
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	sub	sp, sp, #8
	bl	drawLives
	mov	r4, #0
	ldr	r6, .L233
	ldr	r5, .L233+4
	b	.L227
.L232:
	mov	r0, r6
	bl	drawEnemies
	mov	r0, r5
	bl	drawBullets
.L225:
	add	r4, r4, #1
	add	r6, r6, #48
	add	r5, r5, #56
.L227:
	cmp	r4, #4
	bls	.L232
	mov	r0, r5
	bl	drawBullets
	cmp	r4, #9
	bne	.L225
	ldr	ip, .L233+8
	ldr	r10, .L233+12
	ldr	r9, .L233+16
	ldr	r4, .L233+20
	ldr	r5, .L233+24
	ldr	r3, [r10]
	ldr	r1, [r4]
	ldr	r0, [r5]
	ldr	r2, [r9]
	str	ip, [sp]
	ldr	r8, .L233+28
	mov	lr, pc
	bx	r8
	ldr	r3, .L233+32
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L230
	ldr	r6, .L233+36
	ldr	r7, .L233+40
.L228:
	bl	drawPlayer
	ldr	r3, [r7]
	ldr	r1, .L233+44
	ldr	r2, .L233+48
	ldr	r0, [r1]
	ldr	ip, [r6]
	ldr	r2, [r2]
	str	r3, [r5]
	ldr	r1, .L233+52
	ldr	r3, .L233+56
	str	ip, [r4]
	str	r0, [r1]
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L230:
	mov	r1, #992
	ldr	r6, .L233+36
	ldr	r7, .L233+40
	str	r1, [sp]
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r1, [r6]
	ldr	r0, [r7]
	mov	lr, pc
	bx	r8
	b	.L228
.L234:
	.align	2
.L233:
	.word	enemies
	.word	bullets
	.word	15855
	.word	powerupHeight
	.word	powerupWidth
	.word	powerupOldY
	.word	powerupOldX
	.word	drawRect
	.word	player
	.word	powerupY
	.word	powerupX
	.word	nullX
	.word	nullY
	.word	nullOldX
	.word	nullOldY
	.size	drawGame, .-drawGame
	.comm	accent,2,2
	.comm	mainColor,2,2
	.comm	nullYVelocity,4,4
	.comm	nullXVelocity,4,4
	.comm	nullHeight,4,4
	.comm	nullWidth,4,4
	.comm	nullOldY,4,4
	.comm	nullOldX,4,4
	.comm	nullY,4,4
	.comm	nullX,4,4
	.comm	powerupYVelocity,4,4
	.comm	powerupXVelocity,4,4
	.comm	powerupHeight,4,4
	.comm	powerupWidth,4,4
	.comm	powerupOldY,4,4
	.comm	powerupOldX,4,4
	.comm	powerupY,4,4
	.comm	powerupX,4,4
	.comm	lives,4,4
	.comm	nullTime,4,4
	.comm	damageTime,4,4
	.comm	time,4,4
	.comm	score,4,4
	.comm	enemies,240,4
	.comm	bullets,560,4
	.comm	player,60,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
