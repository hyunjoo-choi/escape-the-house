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
	.file	"game2.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet2.part.1, %function
fireBullet2.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L11
	ldr	r1, [r2, #36]
	cmp	r1, #0
	bne	.L2
	ldr	r3, .L11+4
	ldm	r2, {r0, r2}
	stm	r3, {r0, r2}
	str	r1, [r3, #28]
.L3:
	mov	r2, #1
	str	r2, [r3, #24]
	bx	lr
.L2:
	cmp	r1, #2
	beq	.L9
	cmp	r1, #3
	beq	.L10
	cmp	r1, #1
	moveq	r0, #3
	ldreq	r3, .L11+4
	ldmeq	r2, {r1, r2}
	ldrne	r3, .L11+4
	streq	r0, [r3, #28]
	stmeq	r3, {r1, r2}
	b	.L3
.L9:
	mov	r0, #1
	ldm	r2, {r1, ip}
	ldr	r3, .L11+4
	add	r2, r1, #2
	stm	r3, {r2, ip}
	str	r0, [r3, #28]
	b	.L3
.L10:
	mov	r0, #2
	ldm	r2, {r1, ip}
	ldr	r3, .L11+4
	add	r2, r1, r0
	stm	r3, {r2, ip}
	str	r0, [r3, #28]
	b	.L3
.L12:
	.align	2
.L11:
	.word	player2
	.word	bullets2
	.size	fireBullet2.part.1, .-fireBullet2.part.1
	.global	__aeabi_idivmod
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy2.part.4, %function
updateEnemy2.part.4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	ldr	ip, [r0]
	ldr	r3, [r5, #16]
	ldr	r0, [r0, #4]
	lsl	r1, ip, #8
	add	lr, r0, r3
	add	r2, r1, lr
	ldr	r6, .L48
	lsl	r2, r2, #1
	ldrh	r2, [r6, r2]
	cmp	r2, #0
	sub	sp, sp, #16
	ldr	r2, [r5, #12]
	ldr	r4, [r5, #8]
	beq	.L14
	add	r7, ip, r2
	sub	r7, r7, #1
	add	lr, lr, r7, lsl #8
	lsl	lr, lr, #1
	ldrh	lr, [r6, lr]
	cmp	lr, #0
	rsbne	r4, r4, #0
	strne	r4, [r5, #8]
.L14:
	sub	lr, r0, #1
	add	r1, r1, lr
	lsl	r1, r1, #1
	ldrh	r1, [r6, r1]
	cmp	r1, #0
	beq	.L15
	add	ip, ip, r2
	sub	ip, ip, #1
	add	ip, lr, ip, lsl #8
	lsl	ip, ip, #1
	ldrh	r1, [r6, ip]
	cmp	r1, #0
	rsbne	r4, r4, #0
	strne	r4, [r5, #8]
.L15:
	mov	r8, #0
	mov	r10, #512
	add	r0, r0, r4
	str	r0, [r5, #4]
	ldr	r4, .L48+4
	add	r0, r5, #48
	ldm	r0, {r0, r1}
	ldr	r7, .L48+8
	ldr	r9, .L48+12
	add	r6, r4, #220
.L18:
	ldr	ip, [r4, #24]
	cmp	ip, #0
	bne	.L47
.L16:
	add	r4, r4, #44
	cmp	r6, r4
	bne	.L18
	ldr	r4, .L48+16
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #52]
	str	ip, [sp, #8]
	ldr	ip, [r4, #48]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L19
	ldr	r6, [r5, #4]
	ldr	r7, [r5]
.L20:
	ldr	r3, [r5, #36]
	ldr	r2, .L48+20
	add	r3, r3, #1
	smull	r0, r1, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #2
	str	r3, [r5, #36]
	bne	.L28
	ldr	r0, [r5, #40]
	ldr	r3, .L48+24
	add	r0, r0, #1
	ldr	r1, [r5, #44]
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+28
	ldr	r2, [r3, #24]
	cmp	r2, #0
	str	r1, [r5, #40]
	moveq	r1, #1
	ldreq	r2, .L48+32
	ldmeq	r2, {r0, r2}
	stmeq	r3, {r0, r2}
	streq	r1, [r3, #24]
.L28:
	ldr	r2, .L48+36
	ldr	r3, .L48+40
	ldr	r2, [r2]
	ldr	r3, [r3]
	sub	r7, r7, r2
	sub	r6, r6, r3
	str	r7, [r5, #48]
	str	r6, [r5, #52]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L47:
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #40]
	str	ip, [sp, #8]
	ldr	ip, [r4, #36]
	sub	r0, r0, #5
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r8, [r4, #24]
	addeq	r0, r5, #48
	add	r2, r5, #12
	strhne	r10, [r9, #8]	@ movhi
	ldmeq	r0, {r0, r1}
	ldrne	r0, [r5, #48]
	strne	r8, [r5, #28]
	ldrne	r1, [r5, #52]
	ldm	r2, {r2, r3}
	b	.L16
.L19:
	ldr	r3, .L48+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L22
	ldr	r2, .L48+48
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #4
	str	r3, [r2]
	moveq	r2, #1
	ldreq	r3, .L48+52
	streq	r2, [r3]
.L22:
	ldr	r3, [r4, #4]
	ldr	r6, [r5, #4]
	cmp	r6, r3
	addlt	r3, r3, #4
	ldr	r7, [r5]
	strlt	r3, [r4, #4]
	blt	.L20
	subgt	r3, r3, #4
	strgt	r3, [r4, #4]
	bgt	.L20
	ldr	r3, [r4]
	cmp	r3, r7
	addgt	r3, r3, #4
	strgt	r3, [r4]
	bgt	.L20
	sublt	r3, r3, #4
	strlt	r3, [r4]
	b	.L20
.L49:
	.align	2
.L48:
	.word	collisionmap2Bitmap
	.word	bullets2
	.word	collision
	.word	shadowOAM
	.word	player2
	.word	1717986919
	.word	__aeabi_idivmod
	.word	eBullets2
	.word	enemyL2
	.word	vOff
	.word	hOff
	.word	cheat2
	.word	.LANCHOR0
	.word	tooClose2
	.size	updateEnemy2.part.4, .-updateEnemy2.part.4
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawItem2.part.7, %function
drawItem2.part.7:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #70
	ldr	r2, .L51
	ldr	r1, .L51+4
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L51+8
	ldr	r2, [r2]
	sub	r3, r3, ip
	ldr	ip, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L51+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	bx	lr
.L52:
	.align	2
.L51:
	.word	key2
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawItem2.part.7, .-drawItem2.part.7
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStair2.part.9, %function
drawStair2.part.9:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #320
	ldr	r2, .L54
	ldr	r1, .L54+4
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L54+8
	ldr	r2, [r2]
	sub	r3, r3, ip
	ldr	ip, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L54+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #26]	@ movhi
	strh	r2, [r1, #24]	@ movhi
	strh	r0, [r1, #28]	@ movhi
	bx	lr
.L55:
	.align	2
.L54:
	.word	stair2
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawStair2.part.9, .-drawStair2.part.9
	.align	2
	.global	initPlayer2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer2, %function
initPlayer2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	push	{r4, r5, r6, lr}
	mov	r0, #0
	mov	r5, #15
	mov	r4, #10
	mov	lr, #20
	ldr	r3, .L58
	ldr	r2, [r3, #16]
	ldr	r6, .L58+4
	add	r1, r2, r2, lsr #31
	ldr	r6, [r6]
	asr	r1, r1, ip
	ldr	r2, [r3, #20]
	rsb	r1, r1, #80
	add	r1, r1, r6
	ldr	r6, .L58+8
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
.L59:
	.align	2
.L58:
	.word	player2
	.word	vOff
	.word	hOff
	.size	initPlayer2, .-initPlayer2
	.align	2
	.global	animatePlayer2
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer2, %function
animatePlayer2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L79
	ldr	r3, .L79+4
	ldrh	r1, [r0, #48]
	ldr	r2, [r3, #36]
	tst	r1, #64
	push	{r4, r5}
	str	r2, [r3, #40]
	ldr	r2, [r3, #60]
	bne	.L64
	mov	ip, #1
	ldr	r1, .L79+8
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr #3
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #2
	str	ip, [r3, #36]
	bne	.L64
	ldr	r1, [r3, #44]
	ldrh	r0, [r0, #48]
	adds	r1, r1, ip
	and	r1, r1, ip
	rsbmi	r1, r1, #0
	ands	r0, r0, #128
	str	r1, [r3, #44]
	bne	.L63
	str	r0, [r3, #36]
.L73:
	ldr	r1, [r3, #44]
	ldr	r0, .L79
	adds	r1, r1, #1
	ldrh	r0, [r0, #48]
	and	r1, r1, #1
	rsbmi	r1, r1, #0
	tst	r0, #32
	str	r1, [r3, #44]
	bne	.L67
	mov	r1, #2
	str	r1, [r3, #36]
.L74:
	ldr	r1, [r3, #44]
	ldr	r0, .L79
	adds	r1, r1, #1
	ldrh	r0, [r0, #48]
	and	r1, r1, #1
	rsbmi	r1, r1, #0
	tst	r0, #16
	str	r1, [r3, #44]
	moveq	r1, #3
	streq	r1, [r3, #36]
	bne	.L72
.L75:
	ldr	r1, [r3, #44]
	adds	r1, r1, #1
	and	r1, r1, #1
	rsbmi	r1, r1, #0
	str	r1, [r3, #44]
.L72:
	add	r2, r2, #1
	str	r2, [r3, #60]
	pop	{r4, r5}
	bx	lr
.L64:
	ldr	r1, .L79
	ldrh	r1, [r1, #48]
	ands	r1, r1, #128
	bne	.L63
	ldr	r0, .L79+8
	smull	r4, r5, r2, r0
	asr	r0, r2, #31
	rsb	r0, r0, r5, asr #3
	add	r0, r0, r0, lsl #2
	cmp	r2, r0, lsl #2
	str	r1, [r3, #36]
	beq	.L73
.L63:
	ldr	r1, .L79
	ldrh	r1, [r1, #48]
	tst	r1, #32
	bne	.L67
	mov	r0, #2
	ldr	r1, .L79+8
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr #3
	add	r1, r1, r1, lsl r0
	cmp	r2, r1, lsl r0
	str	r0, [r3, #36]
	beq	.L74
.L67:
	ldr	r1, .L79
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L72
	mov	r0, #3
	ldr	r1, .L79+8
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr r0
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #2
	str	r0, [r3, #36]
	beq	.L75
	add	r2, r2, #1
	str	r2, [r3, #60]
	pop	{r4, r5}
	bx	lr
.L80:
	.align	2
.L79:
	.word	67109120
	.word	player2
	.word	1717986919
	.size	animatePlayer2, .-animatePlayer2
	.align	2
	.global	updatePlayer2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer2, %function
updatePlayer2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L146
	ldrh	r3, [r2, #48]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L146+4
	tst	r3, #32
	ldm	r4, {r3, ip}
	bne	.L82
	cmp	r3, #255
	ldrhhi	r2, [r2, #48]
	bls	.L142
.L138:
	ldr	r1, .L146+8
.L85:
	ldr	r2, .L146
	ldrh	r2, [r2, #48]
	ldr	lr, .L146+12
	tst	r2, #64
	ldr	r2, [lr]
	bne	.L86
	ldr	r0, [r4, #16]
	ldr	r5, .L146+16
	add	r6, r3, r0
	cmp	r6, r5
	movle	r0, #1
	movgt	r0, #0
	cmp	r3, #0
	movle	r0, #0
	cmp	r0, #0
	bne	.L143
.L86:
	ldr	r0, .L146
	ldrh	r0, [r0, #48]
	ands	r0, r0, #128
	bne	.L87
	ldr	r6, [r4, #16]
	add	r5, r6, r3
	cmp	r5, #256
	movgt	r7, #0
	movle	r7, #1
	cmp	r3, #0
	movlt	r7, #0
	cmp	r7, #0
	bne	.L144
.L87:
	mov	r0, #0
	str	r0, [r4, #28]
	str	r0, [r4, #32]
.L88:
	ldr	r0, .L146+20
	ldr	r1, [r1]
	ldrh	r0, [r0]
	sub	r3, r3, r2
	sub	r1, ip, r1
	tst	r0, #1
	str	r1, [r4, #52]
	str	r3, [r4, #48]
	ldr	r2, [r4, #24]
	beq	.L140
	ldr	r3, .L146+24
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L140
	cmp	r2, #12
	bgt	.L92
.L140:
	add	r2, r2, #1
	str	r2, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer2
.L82:
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L138
	cmp	r3, #255
	ldr	r1, .L146+8
	bhi	.L85
	b	.L94
.L142:
	sub	r2, ip, #1
	cmp	r2, #255
	bls	.L132
.L141:
	ldr	r1, .L146+8
.L84:
	ldr	r2, .L146
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L85
.L94:
	ldr	r0, [r4, #20]
	ldr	r2, [r4, #52]
	add	r2, r0, r2
	cmp	r2, #240
	bgt	.L85
	cmp	ip, #0
	blt	.L85
	add	r0, r0, ip
	add	lr, r0, r3, lsl #8
	ldr	r5, .L146+28
	lsl	lr, lr, #1
	ldrh	lr, [r5, lr]
	cmp	lr, #0
	beq	.L85
	ldr	lr, [r4, #16]
	add	lr, r3, lr
	sub	lr, lr, #1
	add	r0, r0, lr, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L85
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
	b	.L85
.L143:
	cmp	ip, #255
	bhi	.L86
	sub	r0, r3, #1
	lsl	r0, r0, #8
	add	r5, r0, ip
	ldr	r6, .L146+28
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	cmp	r5, #0
	beq	.L86
	ldr	r5, [r4, #20]
	add	r0, r0, r5
	add	r0, r0, ip
	add	r0, r6, r0, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	beq	.L86
	mvn	r5, #0
	mov	r0, #1
	ldr	r6, [r4, #8]
	cmp	r2, #0
	sub	r3, r3, r6
	str	r3, [r4]
	str	r5, [r4, #32]
	str	r0, [r4, #36]
	ble	.L86
	ldr	r0, [r4, #48]
	cmp	r0, #80
	addle	r2, r2, r5
	strle	r2, [lr]
	b	.L86
.L144:
	cmp	ip, #255
	bhi	.L87
	lsl	r5, r5, #8
	add	r7, r5, ip
	ldr	r8, .L146+28
	lsl	r7, r7, #1
	ldrh	r7, [r8, r7]
	cmp	r7, #0
	beq	.L87
	ldr	r7, [r4, #20]
	add	r5, r5, r7
	add	r5, r5, ip
	add	r5, r8, r5, lsl #1
	ldrh	r5, [r5, #-2]
	cmp	r5, #0
	beq	.L87
	mov	r5, #1
	ldr	r7, [r4, #8]
	cmp	r2, #95
	add	r3, r3, r7
	str	r0, [r4, #36]
	str	r3, [r4]
	str	r5, [r4, #32]
	bgt	.L88
	ldr	r0, [r4, #48]
	add	r6, r6, r0
	cmp	r6, #80
	addgt	r2, r2, r5
	strgt	r2, [lr]
	b	.L88
.L92:
	ldr	r2, .L146+32
	ldr	r1, .L146+36
	ldr	r0, .L146+40
	ldr	r5, .L146+44
	mov	lr, pc
	bx	r5
	ldr	r3, .L146+48
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L145
.L93:
	mov	r2, #1
	str	r2, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer2
.L132:
	add	r1, r2, r3, lsl #8
	ldr	r0, .L146+28
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	beq	.L141
	ldr	r1, [r4, #16]
	add	r1, r3, r1
	sub	r1, r1, #1
	add	r2, r2, r1, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	beq	.L141
	mvn	lr, #0
	mov	r0, #2
	ldr	r1, .L146+8
	ldr	r5, [r4, #12]
	ldr	r2, [r1]
	sub	ip, ip, r5
	cmp	r2, #0
	str	ip, [r4, #4]
	str	lr, [r4, #28]
	str	r0, [r4, #36]
	ble	.L84
	ldr	r0, [r4, #52]
	cmp	r0, #120
	addle	r2, r2, lr
	strle	r2, [r1]
	b	.L84
.L145:
	bl	fireBullet2.part.1
	b	.L93
.L147:
	.align	2
.L146:
	.word	67109120
	.word	player2
	.word	hOff
	.word	vOff
	.word	257
	.word	oldButtons
	.word	buttons
	.word	collisionmap2Bitmap
	.word	11025
	.word	5513
	.word	shoot
	.word	playSoundB
	.word	bullets2
	.size	updatePlayer2, .-updatePlayer2
	.align	2
	.global	drawPlayer2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer2, %function
drawPlayer2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L156
	ldr	r3, [r2, #52]
	ldr	r0, [r2, #36]
	lsl	r3, r3, #23
	ldr	r1, .L156+4
	ldrb	ip, [r2, #48]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	cmp	r0, #0
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	beq	.L153
	cmp	r0, #1
	beq	.L154
	cmp	r0, #2
	beq	.L155
	cmp	r0, #3
	ldreq	r3, [r2, #44]
	addeq	r3, r3, #66
	lsleq	r3, r3, #1
	orreq	r3, r3, #4096
	strheq	r3, [r1, #4]	@ movhi
	bx	lr
.L153:
	ldr	r3, [r2, #44]
	add	r3, r3, #128
	lsl	r3, r3, #1
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L154:
	ldr	r3, [r2, #44]
	add	r3, r3, #130
	lsl	r3, r3, #1
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L155:
	ldr	r3, [r2, #44]
	add	r3, r3, #64
	lsl	r3, r3, #1
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L157:
	.align	2
.L156:
	.word	player2
	.word	shadowOAM
	.size	drawPlayer2, .-drawPlayer2
	.align	2
	.global	initBullets2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets2, %function
initBullets2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L164
	push	{r4, r5, lr}
	mov	ip, #4
	mov	r3, r0
	mvn	r5, #3
	mov	r2, #0
	mov	r1, #2
	mov	r4, #1
	add	lr, r0, #220
.L159:
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r5, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r4, [r3, #32]
	add	r3, r3, #44
	cmp	r3, lr
	bne	.L159
	mov	lr, #6
	mov	r2, #0
	mov	ip, #2
	ldr	r3, .L164+4
	add	r4, r3, #220
.L160:
	ldr	r1, [r0, #16]
	rsb	r1, r1, #0
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r1, [r3]
	stmib	r3, {r2, ip}
	add	r3, r3, #44
	cmp	r3, r4
	add	r0, r0, #44
	bne	.L160
	pop	{r4, r5, lr}
	bx	lr
.L165:
	.align	2
.L164:
	.word	bullets2
	.word	eBullets2
	.size	initBullets2, .-initBullets2
	.align	2
	.global	fireBullet2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet2, %function
fireBullet2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L168
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxne	lr
	b	fireBullet2.part.1
.L169:
	.align	2
.L168:
	.word	bullets2
	.size	fireBullet2, .-fireBullet2
	.align	2
	.global	fireEBullet2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEBullet2, %function
fireEBullet2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L172
	ldr	r2, [r3, #24]
	cmp	r2, #0
	moveq	r1, #1
	ldreq	r2, .L172+4
	ldmeq	r2, {r0, r2}
	streq	r1, [r3, #24]
	stmeq	r3, {r0, r2}
	bx	lr
.L173:
	.align	2
.L172:
	.word	eBullets2
	.word	enemyL2
	.size	fireEBullet2, .-fireEBullet2
	.align	2
	.global	updateBullet2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet2, %function
updateBullet2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	ldr	r5, [r0, #32]
	cmp	r5, #0
	sub	sp, sp, #16
	ldr	ip, [r0]
	bne	.L196
	ldr	lr, [r0, #16]
	add	r3, lr, ip
	cmp	r3, #0
	mov	r4, r0
	bgt	.L197
	mov	r2, #512
	ldr	r3, .L198
	str	r5, [r0, #24]
	strh	r2, [r3]	@ movhi
.L184:
	ldr	r2, .L198+4
	ldr	r3, .L198+8
	ldr	r1, [r2]
	ldr	r2, [r3]
	ldr	r3, [r4, #4]
	sub	ip, ip, r1
	sub	r3, r3, r2
	str	ip, [r4, #36]
	str	r3, [r4, #40]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L196:
	ldr	r2, [r0, #28]
	cmp	r2, #0
	ldr	r3, [r0, #4]
	bne	.L177
	cmp	ip, #255
	bgt	.L178
	ldr	r2, [r0, #8]
	add	ip, ip, r2
	str	ip, [r0]
.L179:
	ldr	r2, .L198+4
	ldr	r1, .L198+8
	ldr	r2, [r2]
	ldr	r1, [r1]
	sub	ip, ip, r2
	sub	r3, r3, r1
	str	ip, [r0, #36]
	str	r3, [r0, #40]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L177:
	cmp	r2, #1
	bne	.L180
	ldr	r2, [r0, #20]
	add	r2, r3, r2
	cmp	r2, #0
	ldrgt	r2, [r0, #12]
	subgt	r3, r3, r2
	strgt	r3, [r0, #4]
	bgt	.L179
.L178:
	mov	lr, #0
	mov	r1, #512
	ldr	r2, .L198+12
	str	lr, [r0, #24]
	strh	r1, [r2, #8]	@ movhi
	b	.L179
.L197:
	ldr	r0, .L198+16
	ldr	r6, [r4, #8]
	add	r2, r0, #16
	add	r0, r0, #48
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	sub	ip, ip, r6
	ldr	r6, [r4, #20]
	str	lr, [sp, #8]
	str	ip, [r4]
	ldr	lr, [r4, #40]
	ldr	ip, [r4, #36]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L198+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L195
	mov	r1, #512
	ldr	r3, .L198+24
	ldr	r3, [r3]
	ldr	r2, .L198
	cmp	r3, #0
	str	r5, [r4, #24]
	strh	r1, [r2]	@ movhi
	beq	.L185
.L195:
	ldr	ip, [r4]
	b	.L184
.L180:
	cmp	r2, #2
	bne	.L181
	cmp	r3, #255
	bgt	.L178
	ldr	r2, [r0, #12]
	add	r3, r3, r2
	str	r3, [r0, #4]
	b	.L179
.L185:
	ldr	r5, .L198+28
	ldr	ip, [r5]
	ldr	r2, .L198+32
	add	ip, ip, #1
	ldr	r1, .L198+36
	ldr	r0, .L198+40
	ldr	r6, .L198+44
	str	ip, [r5]
	mov	lr, pc
	bx	r6
	ldr	r3, [r5]
	cmp	r3, #4
	bne	.L195
	mov	r2, #1
	ldr	r3, .L198+48
	ldr	ip, [r4]
	str	r2, [r3]
	b	.L184
.L181:
	cmp	r2, #3
	bne	.L178
	ldr	r2, [r0, #16]
	add	r2, ip, r2
	cmp	r2, #0
	ble	.L178
	ldr	r2, [r0, #8]
	sub	ip, ip, r2
	str	ip, [r0]
	b	.L179
.L199:
	.align	2
.L198:
	.word	shadowOAM+960
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	player2
	.word	collision
	.word	cheat2
	.word	.LANCHOR0
	.word	11025
	.word	7451
	.word	playerhit
	.word	playSoundB
	.word	tooClose2
	.size	updateBullet2, .-updateBullet2
	.align	2
	.global	drawBullet2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet2, %function
drawBullet2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	ldr	r2, [r0, #32]
	cmp	r2, #0
	ldr	r3, [r0, #40]
	ldrb	r1, [r0, #36]	@ zero_extendqisi2
	movne	r0, #68
	moveq	r0, #196
	lsl	r3, r3, #23
	ldrne	r2, .L206
	ldreq	r2, .L206+4
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strhne	r0, [r2, #12]	@ movhi
	strhne	r1, [r2, #8]	@ movhi
	strhne	r3, [r2, #10]	@ movhi
	strheq	r0, [r2, #4]	@ movhi
	strheq	r1, [r2]	@ movhi
	strheq	r3, [r2, #2]	@ movhi
	bx	lr
.L207:
	.align	2
.L206:
	.word	shadowOAM
	.word	shadowOAM+960
	.size	drawBullet2, .-drawBullet2
	.align	2
	.global	drawGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame2, %function
drawGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	drawPlayer2
	ldr	r0, .L221
	bl	drawBullet2
	ldr	r0, .L221+4
	bl	drawBullet2
	ldr	r0, .L221+8
	bl	drawBullet2
	ldr	r0, .L221+12
	bl	drawBullet2
	ldr	r0, .L221+16
	bl	drawBullet2
	ldr	r0, .L221+20
	bl	drawBullet2
	ldr	r0, .L221+24
	bl	drawBullet2
	ldr	r0, .L221+28
	bl	drawBullet2
	ldr	r4, .L221+32
	ldr	r0, .L221+36
	bl	drawBullet2
	ldr	r0, .L221+40
	bl	drawBullet2
	mov	r2, r4
	mov	lr, #512
	ldr	r3, .L221+44
	ldr	r5, .L221+48
	add	ip, r3, #168
.L211:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	strheq	lr, [r2, #96]	@ movhi
	bne	.L218
.L210:
	add	r3, r3, #56
	cmp	ip, r3
	add	r2, r2, #8
	bne	.L211
	ldr	r3, .L221+52
	ldr	r3, [r3, #16]
	cmp	r3, #0
	moveq	r3, #512
	strheq	r3, [r4, #16]	@ movhi
	bne	.L219
.L213:
	ldr	r3, .L221+56
	ldr	r3, [r3, #16]
	cmp	r3, #0
	moveq	r3, #512
	strheq	r3, [r4, #24]	@ movhi
	bne	.L220
.L215:
	mov	r3, #67108864
	ldr	r2, .L221+60
	ldrh	r1, [r2]
	ldr	r2, .L221+64
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L218:
	ldr	r0, [r3, #52]
	ldr	r1, [r3, #40]
	and	r0, r0, r5
	orr	r0, r0, #16384
	add	r1, r1, #2
	strh	r0, [r2, #98]	@ movhi
	ldrb	r0, [r3, #48]	@ zero_extendqisi2
	lsl	r1, r1, #1
	strh	r1, [r2, #100]	@ movhi
	strh	r0, [r2, #96]	@ movhi
	b	.L210
.L219:
	bl	drawItem2.part.7
	b	.L213
.L220:
	bl	drawStair2.part.9
	b	.L215
.L222:
	.align	2
.L221:
	.word	bullets2
	.word	bullets2+44
	.word	bullets2+88
	.word	bullets2+132
	.word	bullets2+176
	.word	eBullets2
	.word	eBullets2+44
	.word	eBullets2+88
	.word	shadowOAM
	.word	eBullets2+132
	.word	eBullets2+176
	.word	enemyL2
	.word	511
	.word	key2
	.word	stair2
	.word	hOff
	.word	vOff
	.size	drawGame2, .-drawGame2
	.align	2
	.global	initEnemy2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy2, %function
initEnemy2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	r5, #185
	mov	r4, #20
	mov	lr, #2
	mov	r0, #16
	ldr	r3, .L225
	ldr	r2, [r3, #12]
	ldr	r6, .L225+4
	add	r2, r2, r2, lsr #31
	ldr	r6, [r6]
	asr	r2, r2, ip
	rsb	r2, r2, #120
	add	r2, r2, r6
	str	r5, [r3]
	str	r4, [r3, #20]
	str	lr, [r3, #44]
	str	r2, [r3, #4]
	str	ip, [r3, #8]
	str	ip, [r3, #28]
	str	r0, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #24]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	pop	{r4, r5, r6, lr}
	bx	lr
.L226:
	.align	2
.L225:
	.word	enemyL2
	.word	hOff
	.size	initEnemy2, .-initEnemy2
	.align	2
	.global	initGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame2, %function
initGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #8
	mov	r4, #48
	ldr	r1, .L229
	ldr	r3, .L229+4
	str	r4, [r1]
	str	r2, [r3]
	bl	initPlayer2
	bl	initBullets2
	bl	initEnemy2
	mov	r3, #103
	mov	ip, #11
	mov	r0, #1
	mov	r5, #80
	mov	lr, #118
	mov	r1, #16
	ldr	r2, .L229+8
	stm	r2, {r3, r4}
	ldr	r3, .L229+12
	str	ip, [r2, #8]
	stm	r3, {r5, lr}
	str	ip, [r2, #12]
	str	r0, [r2, #16]
	str	r0, [r3, #16]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L230:
	.align	2
.L229:
	.word	vOff
	.word	hOff
	.word	key2
	.word	stair2
	.size	initGame2, .-initGame2
	.align	2
	.global	updateEnemy2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy2, %function
updateEnemy2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemy2.part.4
	.size	updateEnemy2, .-updateEnemy2
	.align	2
	.global	drawEnemyL2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyL2, %function
drawEnemyL2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L240
	mov	r2, #512
	ldr	r3, .L241
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L240:
	ldr	r3, [r0, #52]
	ldr	r2, [r0, #40]
	ldr	ip, .L241
	lsl	r3, r3, #23
	str	lr, [sp, #-4]!
	lsl	r1, r1, #3
	ldrb	lr, [r0, #48]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r2, r2, #2
	add	r0, ip, r1
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	lr, [ip, r1]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L242:
	.align	2
.L241:
	.word	shadowOAM
	.size	drawEnemyL2, .-drawEnemyL2
	.align	2
	.global	initItem2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initItem2, %function
initItem2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #11
	mov	ip, #103
	mov	r0, #48
	mov	r1, #1
	ldr	r3, .L244
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L245:
	.align	2
.L244:
	.word	key2
	.size	initItem2, .-initItem2
	.align	2
	.global	updateItem2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateItem2, %function
updateItem2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L255
	ldr	r3, [r4, #16]
	cmp	r3, #0
	sub	sp, sp, #16
	bne	.L254
.L246:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L254:
	ldr	r5, .L255+4
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
	ldr	r6, .L255+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L246
	mov	ip, #0
	mov	r0, #512
	mov	r1, #2
	ldr	r2, .L255+12
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	ldr	r3, .L255+16
	str	ip, [r4, #16]
	strh	r0, [r3, #16]	@ movhi
	str	r1, [r5, #56]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L256:
	.align	2
.L255:
	.word	key2
	.word	player2
	.word	collision
	.word	numOfKeys
	.word	shadowOAM
	.size	updateItem2, .-updateItem2
	.align	2
	.global	drawItem2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawItem2, %function
drawItem2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L260
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L259
	mov	r2, #512
	ldr	r3, .L260+4
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L259:
	b	drawItem2.part.7
.L261:
	.align	2
.L260:
	.word	key2
	.word	shadowOAM
	.size	drawItem2, .-drawItem2
	.align	2
	.global	initStair2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStair2, %function
initStair2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #16
	mov	ip, #80
	mov	r0, #118
	mov	r1, #1
	ldr	r3, .L263
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L264:
	.align	2
.L263:
	.word	stair2
	.size	initStair2, .-initStair2
	.align	2
	.global	updateStair2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStair2, %function
updateStair2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L277
	ldr	r3, [r4, #16]
	cmp	r3, #0
	sub	sp, sp, #16
	bne	.L276
.L265:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L276:
	ldr	r5, .L277+4
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
	ldr	r6, .L277+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L265
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L265
	mov	ip, #0
	mov	r0, #512
	mov	r2, #2
	ldr	r1, .L277+12
	ldr	r3, .L277+16
	str	ip, [r4, #16]
	strh	r0, [r1, #24]	@ movhi
	str	r2, [r3, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L278:
	.align	2
.L277:
	.word	stair2
	.word	player2
	.word	collision
	.word	shadowOAM
	.word	.LANCHOR0
	.size	updateStair2, .-updateStair2
	.align	2
	.global	updateGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame2, %function
updateGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer2
	ldr	r0, .L296
	bl	updateBullet2
	ldr	r0, .L296+4
	bl	updateBullet2
	ldr	r0, .L296+8
	bl	updateBullet2
	ldr	r0, .L296+12
	bl	updateBullet2
	ldr	r0, .L296+16
	bl	updateBullet2
	ldr	r0, .L296+20
	bl	updateBullet2
	ldr	r0, .L296+24
	bl	updateBullet2
	ldr	r0, .L296+28
	bl	updateBullet2
	ldr	r4, .L296+32
	ldr	r0, .L296+36
	bl	updateBullet2
	ldr	r0, .L296+40
	bl	updateBullet2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L293
	ldr	r3, [r4, #84]
	cmp	r3, #0
	bne	.L294
.L281:
	ldr	r3, [r4, #140]
	cmp	r3, #0
	bne	.L295
.L282:
	bl	updateItem2
	pop	{r4, lr}
	b	updateStair2
.L293:
	mov	r0, r4
	bl	updateEnemy2.part.4
	ldr	r3, [r4, #84]
	cmp	r3, #0
	beq	.L281
.L294:
	ldr	r0, .L296+44
	bl	updateEnemy2.part.4
	ldr	r3, [r4, #140]
	cmp	r3, #0
	beq	.L282
.L295:
	ldr	r0, .L296+48
	bl	updateEnemy2.part.4
	bl	updateItem2
	pop	{r4, lr}
	b	updateStair2
.L297:
	.align	2
.L296:
	.word	bullets2
	.word	bullets2+44
	.word	bullets2+88
	.word	bullets2+132
	.word	bullets2+176
	.word	eBullets2
	.word	eBullets2+44
	.word	eBullets2+88
	.word	enemyL2
	.word	eBullets2+132
	.word	eBullets2+176
	.word	enemyL2+56
	.word	enemyL2+112
	.size	updateGame2, .-updateGame2
	.align	2
	.global	drawStair2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStair2, %function
drawStair2:
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
	strh	r2, [r3, #24]	@ movhi
	bx	lr
.L300:
	b	drawStair2.part.9
.L302:
	.align	2
.L301:
	.word	stair2
	.word	shadowOAM
	.size	drawStair2, .-drawStair2
	.align	2
	.global	resetGameLevel2
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetGameLevel2, %function
resetGameLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L304
	str	r2, [r3, #4]
	bx	lr
.L305:
	.align	2
.L304:
	.word	.LANCHOR0
	.size	resetGameLevel2, .-resetGameLevel2
	.align	2
	.global	resetHealth2
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetHealth2, %function
resetHealth2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L307
	ldr	r2, .L307+4
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L308:
	.align	2
.L307:
	.word	tooClose2
	.word	.LANCHOR0
	.size	resetHealth2, .-resetHealth2
	.align	2
	.global	cheatToggle2
	.syntax unified
	.arm
	.fpu softvfp
	.type	cheatToggle2, %function
cheatToggle2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L312
	ldr	r2, [r3]
	cmp	r2, #0
	movne	r2, #0
	moveq	r2, #1
	str	r2, [r3]
	bx	lr
.L313:
	.align	2
.L312:
	.word	cheat2
	.size	cheatToggle2, .-cheatToggle2
	.align	2
	.global	getCheat2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getCheat2, %function
getCheat2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L315
	ldr	r0, [r3]
	bx	lr
.L316:
	.align	2
.L315:
	.word	cheat2
	.size	getCheat2, .-getCheat2
	.align	2
	.global	resetCheat2
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetCheat2, %function
resetCheat2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L318
	str	r2, [r3]
	bx	lr
.L319:
	.align	2
.L318:
	.word	cheat2
	.size	resetCheat2, .-resetCheat2
	.comm	cheat2,4,4
	.global	hits2
	.global	gameGameLevel2
	.comm	numOfKeys,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	tooClose2,4,4
	.comm	stair2,20,4
	.comm	key2,20,4
	.comm	enemyL2,280,4
	.comm	eBullets2,220,4
	.comm	bullets2,220,4
	.comm	player2,64,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hits2, %object
	.size	hits2, 4
hits2:
	.space	4
	.type	gameGameLevel2, %object
	.size	gameGameLevel2, 4
gameGameLevel2:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
