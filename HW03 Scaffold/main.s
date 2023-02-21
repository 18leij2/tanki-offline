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
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r1, .L4
	ldr	r2, .L4+4
	strh	r1, [r3]	@ movhi
	ldr	r0, .L4+8
	ldrh	r3, [r2]
	ldr	r1, .L4+12
.L2:
	strh	r3, [r0]	@ movhi
	ldrh	r3, [r1, #48]
	strh	r3, [r2]	@ movhi
	b	.L2
.L5:
	.align	2
.L4:
	.word	1027
	.word	buttons
	.word	oldButtons
	.word	67109120
	.size	main, .-main
	.global	test
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.bss
	.align	2
	.type	test, %object
	.size	test, 4
test:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
