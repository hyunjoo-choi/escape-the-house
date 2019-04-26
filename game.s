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
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.2, %function
updateBullet.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L2
	ldr	r3, [r0]
	cmp	r3, #159
	ble	.L8
.L3:
	mov	r1, #0
	mov	r2, #512
	ldr	r3, .L9
	str	r1, [r0, #24]
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L2:
	cmp	r3, #1
	bne	.L5
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #20]
	add	r3, r2, r3
	cmp	r3, #0
	ble	.L3
	ldr	r3, [r0, #12]
	sub	r2, r2, r3
	str	r2, [r0, #4]
	bx	lr
.L5:
	cmp	r3, #2
	bne	.L6
	ldr	r3, [r0, #4]
	cmp	r3, #239
	bgt	.L3
	ldr	r2, [r0, #12]
	add	r3, r2, r3
	str	r3, [r0, #4]
	bx	lr
.L8:
	ldr	r2, [r0, #8]
	add	r3, r2, r3
	str	r3, [r0]
	bx	lr
.L6:
	cmp	r3, #3
	bne	.L3
	ldr	r2, [r0]
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	cmp	r3, #0
	ble	.L3
	ldr	r3, [r0, #8]
	sub	r2, r2, r3
	str	r2, [r0]
	bx	lr
.L10:
	.align	2
.L9:
	.word	shadowOAM
	.size	updateBullet.part.2, .-updateBullet.part.2
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyL1.part.4, %function
drawEnemyL1.part.4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L13
	str	lr, [sp, #-4]!
	ldr	ip, .L13+4
	ldr	lr, [r3]
	ldm	r0, {r2, r3}
	ldr	ip, [ip]
	sub	r3, r3, lr
	ldr	r0, [r0, #44]
	ldr	lr, .L13+8
	lsl	r3, r3, #23
	lsl	r1, r1, #3
	sub	r2, r2, ip
	lsr	r3, r3, #23
	add	ip, lr, r1
	and	r2, r2, #255
	lsl	r0, r0, #1
	orr	r3, r3, #16384
	strh	r2, [lr, r1]	@ movhi
	strh	r0, [ip, #4]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawEnemyL1.part.4, .-drawEnemyL1.part.4
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawItem.part.6, %function
drawItem.part.6:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #70
	ldr	r2, .L16
	ldr	r1, .L16+4
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L16+8
	ldr	r2, [r2]
	sub	r3, r3, ip
	ldr	ip, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L16+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	bx	lr
.L17:
	.align	2
.L16:
	.word	key1
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawItem.part.6, .-drawItem.part.6
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStair.part.8, %function
drawStair.part.8:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #320
	ldr	r2, .L19
	ldr	r1, .L19+4
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L19+8
	ldr	r2, [r2]
	sub	r3, r3, ip
	ldr	ip, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L19+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #26]	@ movhi
	strh	r2, [r1, #24]	@ movhi
	strh	r0, [r1, #28]	@ movhi
	bx	lr
.L20:
	.align	2
.L19:
	.word	stair1
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawStair.part.8, .-drawStair.part.8
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
	mov	ip, #1
	push	{r4, r5, r6, lr}
	mov	r0, #0
	mov	r5, #15
	mov	r4, #10
	mov	lr, #20
	ldr	r3, .L23
	ldr	r2, [r3, #16]
	ldr	r6, .L23+4
	add	r1, r2, r2, lsr #31
	ldr	r6, [r6]
	asr	r1, r1, ip
	ldr	r2, [r3, #20]
	rsb	r1, r1, #80
	add	r1, r1, r6
	ldr	r6, .L23+8
	add	r2, r2, r2, lsr #31
	ldr	r6, [r6]
	asr	r2, r2, ip
	rsb	r2, r2, #120
	add	r2, r2, r6
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #24]
	stm	r3, {r1, r2}
	str	ip, [r3, #12]
	str	ip, [r3, #8]
	str	r0, [r3, #28]
	str	r0, [r3, #32]
	str	r0, [r3, #36]
	str	r0, [r3, #40]
	str	r0, [r3, #44]
	str	r0, [r3, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	player
	.word	vOff
	.word	hOff
	.size	initPlayer, .-initPlayer
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L44
	ldr	r3, .L44+4
	ldrh	r1, [r0, #48]
	ldr	r2, [r3, #36]
	tst	r1, #64
	push	{r4, r5}
	str	r2, [r3, #40]
	ldr	r2, [r3, #60]
	bne	.L29
	mov	ip, #1
	ldr	r1, .L44+8
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr #3
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #2
	str	ip, [r3, #36]
	bne	.L29
	ldr	r1, [r3, #44]
	ldrh	r0, [r0, #48]
	adds	r1, r1, ip
	and	r1, r1, ip
	rsbmi	r1, r1, #0
	ands	r0, r0, #128
	str	r1, [r3, #44]
	bne	.L28
	str	r0, [r3, #36]
.L38:
	ldr	r1, [r3, #44]
	ldr	r0, .L44
	adds	r1, r1, #1
	ldrh	r0, [r0, #48]
	and	r1, r1, #1
	rsbmi	r1, r1, #0
	tst	r0, #32
	str	r1, [r3, #44]
	bne	.L32
	mov	r1, #2
	str	r1, [r3, #36]
.L39:
	ldr	r1, [r3, #44]
	ldr	r0, .L44
	adds	r1, r1, #1
	ldrh	r0, [r0, #48]
	and	r1, r1, #1
	rsbmi	r1, r1, #0
	tst	r0, #16
	str	r1, [r3, #44]
	moveq	r1, #3
	streq	r1, [r3, #36]
	bne	.L37
.L40:
	ldr	r1, [r3, #44]
	adds	r1, r1, #1
	and	r1, r1, #1
	rsbmi	r1, r1, #0
	str	r1, [r3, #44]
.L37:
	add	r2, r2, #1
	str	r2, [r3, #60]
	pop	{r4, r5}
	bx	lr
.L29:
	ldr	r1, .L44
	ldrh	r1, [r1, #48]
	ands	r1, r1, #128
	bne	.L28
	ldr	r0, .L44+8
	smull	r4, r5, r2, r0
	asr	r0, r2, #31
	rsb	r0, r0, r5, asr #3
	add	r0, r0, r0, lsl #2
	cmp	r2, r0, lsl #2
	str	r1, [r3, #36]
	beq	.L38
.L28:
	ldr	r1, .L44
	ldrh	r1, [r1, #48]
	tst	r1, #32
	bne	.L32
	mov	r0, #2
	ldr	r1, .L44+8
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr #3
	add	r1, r1, r1, lsl r0
	cmp	r2, r1, lsl r0
	str	r0, [r3, #36]
	beq	.L39
.L32:
	ldr	r1, .L44
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L37
	mov	r0, #3
	ldr	r1, .L44+8
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr r0
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #2
	str	r0, [r3, #36]
	beq	.L40
	add	r2, r2, #1
	str	r2, [r3, #60]
	pop	{r4, r5}
	bx	lr
.L45:
	.align	2
.L44:
	.word	67109120
	.word	player
	.word	1717986919
	.size	animatePlayer, .-animatePlayer
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
	@ link register save eliminated.
	ldr	r2, .L54
	ldr	r3, [r2, #52]
	ldr	r0, [r2, #36]
	lsl	r3, r3, #23
	ldr	r1, .L54+4
	ldrb	ip, [r2, #48]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	cmp	r0, #0
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	beq	.L51
	cmp	r0, #1
	beq	.L52
	cmp	r0, #2
	beq	.L53
	cmp	r0, #3
	ldreq	r3, [r2, #44]
	addeq	r3, r3, #66
	lsleq	r3, r3, #1
	orreq	r3, r3, #4096
	strheq	r3, [r1, #4]	@ movhi
	bx	lr
.L51:
	ldr	r3, [r2, #44]
	add	r3, r3, #128
	lsl	r3, r3, #1
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L52:
	ldr	r3, [r2, #44]
	add	r3, r3, #130
	lsl	r3, r3, #1
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L53:
	ldr	r3, [r2, #44]
	add	r3, r3, #64
	lsl	r3, r3, #1
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L55:
	.align	2
.L54:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #68
	bl	drawPlayer
	ldr	r3, .L78
	ldr	r0, .L78+4
	ldr	lr, .L78+8
	add	r1, r3, #160
.L58:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L74
.L57:
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L58
	ldr	r4, .L78+12
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L59
	mov	r2, #512
	ldr	r3, .L78+4
	strh	r2, [r3, #96]	@ movhi
.L60:
	ldr	r3, [r4, #88]
	cmp	r3, #0
	bne	.L61
	mov	r2, #512
	ldr	r3, .L78+4
	strh	r2, [r3, #104]	@ movhi
.L62:
	ldr	r3, [r4, #140]
	cmp	r3, #0
	bne	.L75
	mov	r2, #512
	ldr	r3, .L78+4
	strh	r2, [r3, #112]	@ movhi
.L64:
	ldr	r3, .L78+16
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L76
	mov	r2, #512
	ldr	r3, .L78+4
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L78+20
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L77
.L67:
	mov	r2, #512
	ldr	r3, .L78+4
	strh	r2, [r3, #24]	@ movhi
.L68:
	mov	r0, #67108864
	ldr	r3, .L78+24
	ldr	r3, [r3]
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r0, #16]	@ movhi
	ldr	r2, .L78+28
	ldr	r1, .L78+32
	ldr	r2, [r2]
	smull	r6, r7, r3, r1
	smull	r4, r5, r2, r1
	sub	r3, r7, r3, asr #31
	sub	r1, r5, r2, asr #31
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsl	r1, r1, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r1, r1, #16
	strh	r2, [r0, #18]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r3, [r0, #20]	@ movhi
	strh	r1, [r0, #22]	@ movhi
	bx	lr
.L74:
	ldr	r2, [r3, #4]
	ldrb	ip, [r3]	@ zero_extendqisi2
	and	r2, r2, lr
	orr	r2, r2, #16384
	strh	r4, [r0, #12]	@ movhi
	strh	r2, [r0, #10]	@ movhi
	strh	ip, [r0, #8]	@ movhi
	b	.L57
.L76:
	bl	drawItem.part.6
	ldr	r3, .L78+20
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L67
.L77:
	bl	drawStair.part.8
	b	.L68
.L75:
	mov	r1, #14
	ldr	r0, .L78+36
	bl	drawEnemyL1.part.4
	b	.L64
.L61:
	mov	r1, #13
	ldr	r0, .L78+40
	bl	drawEnemyL1.part.4
	b	.L62
.L59:
	mov	r1, #12
	mov	r0, r4
	bl	drawEnemyL1.part.4
	b	.L60
.L79:
	.align	2
.L78:
	.word	bullets
	.word	shadowOAM
	.word	511
	.word	enemyL1
	.word	key1
	.word	stair1
	.word	hOff
	.word	vOff
	.word	1431655766
	.word	enemyL1+104
	.word	enemyL1+52
	.size	drawGame, .-drawGame
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
	str	lr, [sp, #-4]!
	mov	r0, #4
	mvn	lr, #3
	mov	r2, #0
	mov	r1, #2
	ldr	r3, .L84
	add	ip, r3, #160
.L81:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	lr, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	add	r3, r3, #32
	cmp	r3, ip
	bne	.L81
	ldr	lr, [sp], #4
	bx	lr
.L85:
	.align	2
.L84:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	ldr	r2, .L96
	ldr	r1, .L96+4
	ldr	r0, .L96+8
	ldr	r4, .L96+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L96+16
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L86
	ldr	r2, .L96+20
	ldr	r1, [r2, #36]
	cmp	r1, #0
	bne	.L88
	ldr	lr, [r2, #20]
	add	r0, r2, #48
	ldm	r0, {r0, ip}
	ldr	r2, [r2, #16]
	add	lr, lr, lr, lsr #31
	add	r2, r0, r2
	add	ip, ip, lr, asr #1
	sub	r0, ip, #5
	sub	r2, r2, #1
	str	r1, [r3, #28]
	str	r0, [r3, #4]
	str	r2, [r3]
.L89:
	mov	r2, #1
	str	r2, [r3, #24]
.L86:
	pop	{r4, lr}
	bx	lr
.L88:
	cmp	r1, #2
	beq	.L94
	cmp	r1, #3
	beq	.L95
	cmp	r1, #1
	bne	.L89
	mov	ip, #3
	ldr	r0, [r2, #20]
	ldr	r1, [r2, #52]
	add	r0, r0, r0, lsr #31
	add	r1, r1, r0, asr #1
	ldr	r0, [r2, #48]
	sub	r2, r1, #5
	stm	r3, {r0, r2}
	str	ip, [r3, #28]
	b	.L89
.L94:
	mov	lr, #1
	ldr	ip, [r2, #16]
	ldr	r0, [r2, #20]
	add	r1, r2, #48
	ldm	r1, {r1, r2}
	add	ip, ip, ip, lsr #31
	add	r0, r0, r0, lsr #31
	add	r1, r1, ip, asr lr
	add	r2, r2, r0, asr lr
.L93:
	sub	r1, r1, #5
	sub	r2, r2, #5
	stm	r3, {r1, r2}
	str	lr, [r3, #28]
	b	.L89
.L95:
	ldr	ip, [r2, #16]
	ldr	r0, [r2, #20]
	add	r1, r2, #48
	ldm	r1, {r1, r2}
	add	ip, ip, ip, lsr #31
	add	r0, r0, r0, lsr #31
	mov	lr, #2
	add	r1, r1, ip, asr #1
	add	r2, r2, r0, asr #1
	b	.L93
.L97:
	.align	2
.L96:
	.word	11025
	.word	5513
	.word	shoot
	.word	playSoundB
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
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
	ldr	r2, .L161
	ldrh	r3, [r2, #48]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L161+4
	tst	r3, #32
	ldm	r4, {r3, ip}
	bne	.L99
	cmp	r3, #255
	ldrhhi	r2, [r2, #48]
	bls	.L158
.L154:
	ldr	r1, .L161+8
.L102:
	ldr	r2, .L161
	ldrh	r2, [r2, #48]
	ldr	lr, .L161+12
	tst	r2, #64
	ldr	r2, [lr]
	bne	.L103
	ldr	r0, [r4, #16]
	ldr	r5, .L161+16
	add	r6, r3, r0
	cmp	r6, r5
	movle	r0, #1
	movgt	r0, #0
	cmp	r3, #0
	movle	r0, #0
	cmp	r0, #0
	bne	.L159
.L103:
	ldr	r0, .L161
	ldrh	r0, [r0, #48]
	ands	r0, r0, #128
	bne	.L104
	ldr	r6, [r4, #16]
	add	r5, r6, r3
	cmp	r5, #256
	movgt	r7, #0
	movle	r7, #1
	cmp	r3, #0
	movlt	r7, #0
	cmp	r7, #0
	bne	.L160
.L104:
	mov	r0, #0
	str	r0, [r4, #28]
	str	r0, [r4, #32]
.L105:
	ldr	r0, .L161+20
	ldr	r1, [r1]
	ldrh	r0, [r0]
	sub	r3, r3, r2
	sub	r1, ip, r1
	tst	r0, #1
	str	r3, [r4, #48]
	str	r1, [r4, #52]
	ldr	r3, [r4, #24]
	beq	.L156
	ldr	r2, .L161+24
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L156
	cmp	r3, #12
	bgt	.L109
.L156:
	add	r3, r3, #1
	str	r3, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer
.L99:
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L154
	cmp	r3, #255
	ldr	r1, .L161+8
	bhi	.L102
	b	.L110
.L158:
	sub	r2, ip, #1
	cmp	r2, #255
	bls	.L148
.L157:
	ldr	r1, .L161+8
.L101:
	ldr	r2, .L161
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L102
.L110:
	ldr	r0, [r4, #20]
	ldr	r2, [r4, #52]
	add	r2, r0, r2
	cmp	r2, #240
	bgt	.L102
	cmp	ip, #0
	blt	.L102
	add	r0, r0, ip
	add	lr, r0, r3, lsl #8
	ldr	r5, .L161+28
	lsl	lr, lr, #1
	ldrh	lr, [r5, lr]
	cmp	lr, #0
	beq	.L102
	ldr	lr, [r4, #16]
	add	lr, r3, lr
	sub	lr, lr, #1
	add	r0, r0, lr, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L102
	ldr	r0, [r1]
	cmp	r0, #15
	movle	r5, #1
	movgt	r5, #0
	cmp	r2, #120
	movle	r5, #0
	mov	lr, #1
	mov	r2, #3
	cmp	r5, #0
	ldr	r5, [r4, #12]
	addne	r0, r0, lr
	add	ip, ip, r5
	str	ip, [r4, #4]
	str	lr, [r4, #28]
	str	r2, [r4, #36]
	strne	r0, [r1]
	b	.L102
.L159:
	cmp	ip, #255
	bhi	.L103
	sub	r0, r3, #1
	lsl	r0, r0, #8
	add	r5, r0, ip
	ldr	r6, .L161+28
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	cmp	r5, #0
	beq	.L103
	ldr	r5, [r4, #20]
	add	r0, r0, r5
	add	r0, r0, ip
	add	r0, r6, r0, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	beq	.L103
	mvn	r5, #0
	mov	r0, #1
	ldr	r6, [r4, #8]
	cmp	r2, #0
	sub	r3, r3, r6
	str	r3, [r4]
	str	r5, [r4, #32]
	str	r0, [r4, #36]
	ble	.L103
	ldr	r0, [r4, #48]
	cmp	r0, #80
	addle	r2, r2, r5
	strle	r2, [lr]
	b	.L103
.L160:
	cmp	ip, #255
	bhi	.L104
	lsl	r5, r5, #8
	add	r7, r5, ip
	ldr	r8, .L161+28
	lsl	r7, r7, #1
	ldrh	r7, [r8, r7]
	cmp	r7, #0
	beq	.L104
	ldr	r7, [r4, #20]
	add	r5, r5, r7
	add	r5, r5, ip
	add	r5, r8, r5, lsl #1
	ldrh	r5, [r5, #-2]
	cmp	r5, #0
	beq	.L104
	mov	r5, #1
	ldr	r7, [r4, #8]
	cmp	r2, #95
	add	r3, r3, r7
	str	r0, [r4, #36]
	str	r3, [r4]
	str	r5, [r4, #32]
	bgt	.L105
	ldr	r0, [r4, #48]
	add	r6, r6, r0
	cmp	r6, #80
	addgt	r2, r2, r5
	strgt	r2, [lr]
	b	.L105
.L109:
	bl	fireBullet
	mov	r3, #1
	str	r3, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer
.L148:
	add	r1, r2, r3, lsl #8
	ldr	r0, .L161+28
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	beq	.L157
	ldr	r1, [r4, #16]
	add	r1, r3, r1
	sub	r1, r1, #1
	add	r2, r2, r1, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	beq	.L157
	mvn	lr, #0
	mov	r0, #2
	ldr	r1, .L161+8
	ldr	r5, [r4, #12]
	ldr	r2, [r1]
	sub	ip, ip, r5
	cmp	r2, #0
	str	ip, [r4, #4]
	str	lr, [r4, #28]
	str	r0, [r4, #36]
	ble	.L101
	ldr	r0, [r4, #52]
	cmp	r0, #120
	addle	r2, r2, lr
	strle	r2, [r1]
	b	.L101
.L162:
	.align	2
.L161:
	.word	67109120
	.word	player
	.word	hOff
	.word	vOff
	.word	257
	.word	oldButtons
	.word	buttons
	.word	collisionmap1Bitmap
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.2
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	mov	r1, #68
	ldr	r3, [r0, #4]
	lsl	r3, r3, #23
	ldrb	r0, [r0]	@ zero_extendqisi2
	ldr	r2, .L170
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r3, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	bx	lr
.L171:
	.align	2
.L170:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, #181
	mov	r0, #1
	mov	r1, #0
	mov	ip, #16
	mov	r4, #20
	mov	lr, #2
	mov	r6, #130
	mov	r5, #70
	ldr	r3, .L174
	ldr	r2, [r3, #20]
	str	r7, [r3]
	ldr	r7, .L174+4
	add	r2, r2, r2, lsr #31
	ldr	r7, [r7]
	asr	r2, r2, r0
	rsb	r2, r2, #120
	add	r2, r2, r7
	str	r6, [r3, #52]
	str	r5, [r3, #56]
	str	r4, [r3, #28]
	str	r4, [r3, #80]
	str	lr, [r3, #48]
	str	lr, [r3, #100]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #36]
	str	r0, [r3, #16]
	str	r0, [r3, #64]
	str	r0, [r3, #88]
	str	ip, [r3, #20]
	str	ip, [r3, #24]
	str	ip, [r3, #72]
	str	ip, [r3, #76]
	str	r1, [r3, #32]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	str	r1, [r3, #84]
	str	r1, [r3, #92]
	str	r1, [r3, #96]
	str	r1, [r3, #68]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L175:
	.align	2
.L174:
	.word	enemyL1
	.word	hOff
	.size	initEnemy, .-initEnemy
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
	mov	r0, #48
	mov	r2, #8
	ldr	r1, .L180
	ldr	r3, .L180+4
	push	{r4, r5, r6, lr}
	str	r0, [r1]
	str	r2, [r3]
	bl	initPlayer
	mov	r0, #4
	mvn	lr, #3
	mov	r2, #0
	mov	r1, #2
	ldr	r3, .L180+8
	add	ip, r3, #160
.L177:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	lr, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	add	r3, r3, #32
	cmp	r3, ip
	bne	.L177
	bl	initEnemy
	mov	r3, #72
	mov	r5, #100
	mov	ip, #11
	mov	r0, #1
	mov	r4, #185
	mov	lr, #155
	mov	r1, #16
	ldr	r2, .L180+12
	str	r3, [r2, #4]
	ldr	r3, .L180+16
	str	r5, [r2]
	stm	r3, {r4, lr}
	str	ip, [r2, #8]
	str	ip, [r2, #12]
	str	r0, [r2, #16]
	str	r0, [r3, #16]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L181:
	.align	2
.L180:
	.word	vOff
	.word	hOff
	.word	bullets
	.word	key1
	.word	stair1
	.size	initGame, .-initGame
	.global	__aeabi_idivmod
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r3, [r0, #16]
	add	r2, r4, #20
	cmp	r3, #0
	sub	sp, sp, #20
	ldm	r0, {r0, r1}
	ldm	r2, {r2, r3}
	bne	.L271
	sub	lr, r0, #1
	add	lr, r1, lr, lsl #8
	ldr	ip, .L277
	lsl	r5, lr, #1
	ldrh	r5, [ip, r5]
	cmp	r5, #0
	ldr	r5, [r4, #12]
	beq	.L201
	add	lr, lr, r3
	add	lr, ip, lr, lsl #1
	ldrh	lr, [lr, #-2]
	cmp	lr, #0
	rsbne	r5, r5, #0
	strne	r5, [r4, #12]
.L201:
	add	lr, r0, r2
	add	lr, r1, lr, lsl #8
	lsl	r6, lr, #1
	ldrh	r6, [ip, r6]
	cmp	r6, #0
	bne	.L272
.L202:
	mov	fp, #0
	add	r0, r0, r5
	ldr	r5, .L277+4
	str	r0, [r4]
	ldr	r6, .L277+8
	ldr	r10, .L277+12
	ldr	r9, .L277+16
	ldr	r8, .L277+20
	add	r7, r5, #160
.L205:
	ldr	ip, [r5, #24]
	cmp	ip, #0
	bne	.L273
.L203:
	add	r5, r5, #32
	cmp	r5, r7
	bne	.L205
.L269:
	ldr	r5, .L277+24
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L207
	ldr	r3, .L277+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L209
	ldr	r2, .L277+32
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #4
	str	r3, [r2]
	moveq	r2, #1
	ldreq	r3, .L277+36
	streq	r2, [r3]
.L209:
	ldr	r3, [r5, #4]
	ldr	r2, [r4, #4]
	cmp	r2, r3
	addlt	r3, r3, #4
	strlt	r3, [r5, #4]
	bge	.L274
.L207:
	ldr	r3, [r4, #40]
	ldr	r2, .L277+40
	add	r3, r3, #1
	smull	r0, r1, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #2
	str	r3, [r4, #40]
	bne	.L182
	ldr	r0, [r4, #44]
	ldr	r3, .L277+44
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L182:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L271:
	lsl	lr, r0, #8
	add	r5, r1, r3
	add	r6, lr, r5
	ldr	ip, .L277
	lsl	r6, r6, #1
	ldrh	r6, [ip, r6]
	cmp	r6, #0
	ldr	r6, [r4, #8]
	beq	.L186
	add	r7, r0, r2
	sub	r7, r7, #1
	add	r5, r5, r7, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [ip, r5]
	cmp	r5, #0
	rsbne	r6, r6, #0
	strne	r6, [r4, #8]
.L186:
	sub	r5, r1, #1
	add	lr, lr, r5
	lsl	lr, lr, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #0
	bne	.L275
.L187:
	add	r1, r1, r6
	ldr	r5, .L277+4
	str	r1, [r4, #4]
	ldr	ip, [r5, #24]
	cmp	ip, #0
	mov	fp, #0
	ldr	r6, .L277+8
	ldr	r9, .L277+12
	ldr	r8, .L277+16
	ldr	r10, .L277+20
	add	r7, r5, #160
	bne	.L276
.L188:
	add	r5, r5, #32
	cmp	r5, r7
	beq	.L269
	ldr	ip, [r5, #24]
	cmp	ip, #0
	beq	.L188
.L276:
	ldr	ip, [r9]
	ldr	lr, [r8]
	sub	r1, r1, ip
	ldr	ip, [r5, #20]
	sub	r0, r0, lr
	ldr	lr, [r5, #16]
	str	ip, [sp, #12]
	ldr	ip, [r5, #4]
	str	lr, [sp, #8]
	ldr	lr, [r5]
	str	ip, [sp, #4]
	str	lr, [sp]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r1, #512	@ movhi
	ldrne	r3, [r10]
	ldrne	r2, .L277+48
	strne	fp, [r5, #24]
	subne	r3, r3, #1
	strhne	r1, [r2, #8]	@ movhi
	add	r2, r4, #20
	strne	r3, [r10]
	strne	fp, [r4, #36]
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	b	.L188
.L273:
	ldr	ip, [r10]
	ldr	lr, [r9]
	sub	r1, r1, ip
	ldr	ip, [r5, #20]
	sub	r0, r0, lr
	ldr	lr, [r5, #16]
	str	ip, [sp, #12]
	ldr	ip, [r5, #4]
	str	lr, [sp, #8]
	ldr	lr, [r5]
	str	ip, [sp, #4]
	str	lr, [sp]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r1, #512	@ movhi
	ldrne	r3, [r8]
	ldrne	r2, .L277+48
	strne	fp, [r5, #24]
	subne	r3, r3, #1
	strhne	r1, [r2, #8]	@ movhi
	add	r2, r4, #20
	strne	r3, [r8]
	strne	fp, [r4, #36]
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	b	.L203
.L275:
	add	lr, r0, r2
	sub	lr, lr, #1
	add	r5, r5, lr, lsl #8
	lsl	r5, r5, #1
	ldrh	ip, [ip, r5]
	cmp	ip, #0
	rsbne	r6, r6, #0
	strne	r6, [r4, #8]
	b	.L187
.L274:
	subgt	r3, r3, #4
	strgt	r3, [r5, #4]
	bgt	.L207
	ldr	r3, [r5]
	ldr	r2, [r4]
	cmp	r2, r3
	addlt	r3, r3, #4
	strlt	r3, [r5]
	blt	.L207
	subgt	r3, r3, #4
	strgt	r3, [r5]
	b	.L207
.L272:
	add	lr, lr, r3
	add	ip, ip, lr, lsl #1
	ldrh	ip, [ip, #-2]
	cmp	ip, #0
	rsbne	r5, r5, #0
	strne	r5, [r4, #12]
	b	.L202
.L278:
	.align	2
.L277:
	.word	collisionmap1Bitmap
	.word	bullets
	.word	collision
	.word	hOff
	.word	vOff
	.word	enemyRemaining
	.word	player
	.word	cheat
	.word	.LANCHOR0
	.word	tooClose
	.word	1717986919
	.word	__aeabi_idivmod
	.word	shadowOAM
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	drawEnemyL1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyL1, %function
drawEnemyL1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r3, r1
	bne	.L281
	mov	r1, #512
	ldr	r2, .L282
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L281:
	b	drawEnemyL1.part.4
.L283:
	.align	2
.L282:
	.word	shadowOAM
	.size	drawEnemyL1, .-drawEnemyL1
	.align	2
	.global	initItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	initItem, %function
initItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #11
	mov	ip, #100
	mov	r0, #72
	mov	r1, #1
	ldr	r3, .L285
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L286:
	.align	2
.L285:
	.word	key1
	.size	initItem, .-initItem
	.align	2
	.global	updateItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateItem, %function
updateItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L296
	ldr	r3, [r4, #16]
	cmp	r3, #0
	sub	sp, sp, #16
	bne	.L295
.L287:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L295:
	ldr	r5, .L296+4
	add	r0, r5, #16
	ldm	r0, {r0, r1}
	ldm	r5, {ip, lr}
	str	r1, [sp, #12]
	str	r0, [sp, #8]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #4]
	ldr	r0, [r4]
	stm	sp, {ip, lr}
	ldr	r6, .L296+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L287
	mov	r1, #1
	mov	ip, #0
	mov	r0, #512
	ldr	r2, .L296+12
	ldr	r3, [r2]
	add	r3, r3, r1
	str	r3, [r2]
	ldr	r3, .L296+16
	str	ip, [r4, #16]
	strh	r0, [r3, #16]	@ movhi
	str	r1, [r5, #56]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L297:
	.align	2
.L296:
	.word	key1
	.word	player
	.word	collision
	.word	numOfKeys
	.word	shadowOAM
	.size	updateItem, .-updateItem
	.align	2
	.global	drawItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawItem, %function
drawItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L301
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L300
	mov	r2, #512
	ldr	r3, .L301+4
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L300:
	b	drawItem.part.6
.L302:
	.align	2
.L301:
	.word	key1
	.word	shadowOAM
	.size	drawItem, .-drawItem
	.align	2
	.global	initStair
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStair, %function
initStair:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #16
	mov	ip, #185
	mov	r0, #155
	mov	r1, #1
	ldr	r3, .L304
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L305:
	.align	2
.L304:
	.word	stair1
	.size	initStair, .-initStair
	.align	2
	.global	updateStair
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStair, %function
updateStair:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L318
	ldr	r3, [r4, #16]
	cmp	r3, #0
	sub	sp, sp, #16
	bne	.L317
.L306:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L317:
	ldr	r5, .L318+4
	add	r0, r5, #16
	ldm	r0, {r0, r1}
	ldm	r5, {ip, lr}
	str	r1, [sp, #12]
	str	r0, [sp, #8]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #4]
	ldr	r0, [r4]
	stm	sp, {ip, lr}
	ldr	r6, .L318+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L306
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L306
	mov	ip, #0
	mov	r0, #512
	mov	r2, #1
	ldr	r1, .L318+12
	ldr	r3, .L318+16
	str	ip, [r4, #16]
	strh	r0, [r1, #24]	@ movhi
	str	r2, [r3, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L319:
	.align	2
.L318:
	.word	stair1
	.word	player
	.word	collision
	.word	shadowOAM
	.word	.LANCHOR0
	.size	updateStair, .-updateStair
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
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r4, .L329
	add	r5, r4, #160
.L322:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L328
.L321:
	add	r4, r4, #32
	cmp	r5, r4
	bne	.L322
	ldr	r0, .L329+4
	bl	updateEnemy
	ldr	r0, .L329+8
	bl	updateEnemy
	ldr	r0, .L329+12
	bl	updateEnemy
	bl	updateItem
	pop	{r4, r5, r6, lr}
	b	updateStair
.L328:
	mov	r0, r4
	bl	updateBullet.part.2
	b	.L321
.L330:
	.align	2
.L329:
	.word	bullets
	.word	enemyL1
	.word	enemyL1+52
	.word	enemyL1+104
	.size	updateGame, .-updateGame
	.align	2
	.global	drawStair
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStair, %function
drawStair:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L334
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L333
	mov	r2, #512
	ldr	r3, .L334+4
	strh	r2, [r3, #24]	@ movhi
	bx	lr
.L333:
	b	drawStair.part.8
.L335:
	.align	2
.L334:
	.word	stair1
	.word	shadowOAM
	.size	drawStair, .-drawStair
	.align	2
	.global	resetGameLevel
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetGameLevel, %function
resetGameLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L337
	str	r2, [r3, #4]
	bx	lr
.L338:
	.align	2
.L337:
	.word	.LANCHOR0
	.size	resetGameLevel, .-resetGameLevel
	.align	2
	.global	resetHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetHealth, %function
resetHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L340
	ldr	r2, .L340+4
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L341:
	.align	2
.L340:
	.word	tooClose
	.word	.LANCHOR0
	.size	resetHealth, .-resetHealth
	.align	2
	.global	cheatToggle
	.syntax unified
	.arm
	.fpu softvfp
	.type	cheatToggle, %function
cheatToggle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L345
	ldr	r2, [r3]
	cmp	r2, #0
	movne	r2, #0
	moveq	r2, #1
	str	r2, [r3]
	bx	lr
.L346:
	.align	2
.L345:
	.word	cheat
	.size	cheatToggle, .-cheatToggle
	.align	2
	.global	getCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	getCheat, %function
getCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L348
	ldr	r0, [r3]
	bx	lr
.L349:
	.align	2
.L348:
	.word	cheat
	.size	getCheat, .-getCheat
	.align	2
	.global	resetCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetCheat, %function
resetCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L351
	str	r2, [r3]
	bx	lr
.L352:
	.align	2
.L351:
	.word	cheat
	.size	resetCheat, .-resetCheat
	.comm	cheat,4,4
	.global	hits
	.global	gameGameLevel
	.comm	numOfKeys,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	tooClose,4,4
	.comm	enemyRemaining,4,4
	.comm	stair1,20,4
	.comm	key1,20,4
	.comm	enemyL1,156,4
	.comm	bullets,160,4
	.comm	player,64,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hits, %object
	.size	hits, 4
hits:
	.space	4
	.type	gameGameLevel, %object
	.size	gameGameLevel, 4
gameGameLevel:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
