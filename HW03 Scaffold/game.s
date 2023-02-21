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
	mov	r0, #154
	mov	r1, #0
	mov	r2, #10
	str	lr, [sp, #-4]!
	ldr	r3, .L4
	ldr	lr, .L4+4
	str	ip, [r3]
	strh	lr, [r3, #32]	@ movhi
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #28]
	str	r2, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	32736
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
	add	r9, r9, #15
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
	add	r9, r9, #15
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
	mov	r2, #0
	mov	r4, #10
	mov	r0, #117
	mov	r1, #154
	ldr	r3, .L23
	ldr	lr, .L23+4
	ldr	ip, .L23+8
	str	r2, [lr]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	strh	ip, [r3, #32]	@ movhi
	str	r0, [r3]
	str	r0, [r3, #8]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r4, [r3, #28]
	str	r4, [r3, #24]
	mov	r5, #30
	bl	initEnemies
	mov	r1, r4
	mov	r2, r4
	mov	lr, #1
	mov	r4, #15
	mov	ip, #31
	ldr	r3, .L23+12
	ldr	r0, .L23+16
.L20:
	str	r2, [r3]
	add	r2, r2, #15
	cmp	r2, r0
	str	r5, [r3, #4]
	str	r4, [r3, #24]
	str	r1, [r3, #28]
	str	lr, [r3, #36]
	strh	ip, [r3, #32]	@ movhi
	add	r3, r3, #44
	bne	.L20
	pop	{r4, r5, r6, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	player
	.word	score
	.word	32736
	.word	bullets
	.word	610
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
	mov	ip, #1
	mov	r5, #30
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
	.word	610
	.size	initBullets, .-initBullets
	.comm	spawned,4,4
	.comm	score,4,4
	.comm	enemies,440,4
	.comm	bullets,1760,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
