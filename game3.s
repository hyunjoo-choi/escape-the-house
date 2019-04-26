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
	.file	"game3.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet3.part.1, %function
fireBullet3.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L13
	ldr	r2, [r3, #36]
	cmp	r2, #0
	str	lr, [sp, #-4]!
	bne	.L2
	ldr	ip, [r3, #20]
	ldr	r0, [r3, #52]
	ldr	r1, [r3, #48]
	ldr	lr, [r3, #16]
	add	ip, ip, ip, lsr #31
	ldr	r3, .L13+4
	add	r0, r0, ip, asr #1
	add	r1, r1, lr
	sub	r0, r0, #5
	sub	r1, r1, #1
	str	r0, [r3, #4]
	str	r2, [r3, #28]
	str	r1, [r3]
.L3:
	mov	r2, #1
	ldr	lr, [sp], #4
	str	r2, [r3, #24]
	bx	lr
.L2:
	cmp	r2, #2
	beq	.L11
	cmp	r2, #3
	beq	.L12
	cmp	r2, #1
	beq	.L7
	mov	r2, #1
	ldr	r3, .L13+4
	ldr	lr, [sp], #4
	str	r2, [r3, #24]
	bx	lr
.L11:
	mov	lr, #1
	ldr	ip, [r3, #16]
	ldr	r0, [r3, #20]
	add	r1, r3, #48
	ldm	r1, {r1, r2}
	add	ip, ip, ip, lsr #31
	add	r0, r0, r0, lsr #31
	ldr	r3, .L13+4
	add	r1, r1, ip, asr lr
	add	r2, r2, r0, asr lr
.L9:
	sub	r2, r2, #5
	sub	r1, r1, #5
	stm	r3, {r1, r2}
	mov	r2, #1
	str	lr, [r3, #28]
	str	r2, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L7:
	mov	r0, #3
	ldr	r1, [r3, #20]
	ldr	r2, [r3, #52]
	add	r1, r1, r1, lsr #31
	add	r2, r2, r1, asr #1
	ldr	r1, [r3, #48]
	ldr	r3, .L13+4
	sub	r2, r2, #5
	stm	r3, {r1, r2}
	str	r0, [r3, #28]
	b	.L3
.L12:
	ldr	ip, [r3, #16]
	ldr	r0, [r3, #20]
	add	r1, r3, #48
	ldm	r1, {r1, r2}
	add	ip, ip, ip, lsr #31
	add	r0, r0, r0, lsr #31
	mov	lr, #2
	add	r1, r1, ip, asr #1
	ldr	r3, .L13+4
	add	r2, r2, r0, asr #1
	b	.L9
.L14:
	.align	2
.L13:
	.word	player3
	.word	bullets3
	.size	fireBullet3.part.1, .-fireBullet3.part.1
	.global	__aeabi_idivmod
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy3.part.4, %function
updateEnemy3.part.4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	ldr	r0, [r0]
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #16]
	lsl	ip, r0, #8
	add	lr, r1, r3
	add	r2, ip, lr
	ldr	r4, .L52
	lsl	r2, r2, #1
	ldrh	r2, [r4, r2]
	cmp	r2, #0
	sub	sp, sp, #16
	ldr	r2, [r5, #12]
	ldr	r6, [r5, #8]
	beq	.L16
	add	r7, r0, r2
	sub	r7, r7, #1
	add	lr, lr, r7, lsl #8
	lsl	lr, lr, #1
	ldrh	lr, [r4, lr]
	cmp	lr, #0
	rsbne	r6, r6, #0
	strne	r6, [r5, #8]
.L16:
	sub	lr, r1, #1
	add	ip, ip, lr
	lsl	ip, ip, #1
	ldrh	ip, [r4, ip]
	cmp	ip, #0
	beq	.L17
	add	ip, r0, r2
	sub	ip, ip, #1
	add	lr, lr, ip, lsl #8
	lsl	lr, lr, #1
	ldrh	ip, [r4, lr]
	cmp	ip, #0
	rsbne	r6, r6, #0
	strne	r6, [r5, #8]
.L17:
	add	r1, r1, r6
	ldr	r4, .L52+4
	str	r1, [r5, #4]
	ldr	r7, .L52+8
	ldr	r9, .L52+12
	ldr	r8, .L52+16
	ldr	r10, .L52+20
	add	r6, r4, #180
.L20:
	ldr	ip, [r4, #24]
	cmp	ip, #0
	bne	.L50
.L18:
	add	r4, r4, #36
	cmp	r6, r4
	bne	.L20
	ldr	r4, .L52+24
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L22
	ldr	r3, .L52+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L24
	ldr	r2, .L52+32
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #4
	str	r3, [r2]
	moveq	r2, #1
	ldreq	r3, .L52+36
	streq	r2, [r3]
.L24:
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #4]
	cmp	r2, r3
	addlt	r3, r3, #4
	strlt	r3, [r4, #4]
	bge	.L51
.L22:
	ldr	r3, [r5, #36]
	ldr	r2, .L52+40
	add	r3, r3, #1
	smull	r0, r1, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #2
	str	r3, [r5, #36]
	bne	.L15
	ldr	r0, [r5, #40]
	ldr	r3, .L52+44
	add	r0, r0, #1
	ldr	r1, [r5, #44]
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+48
	ldr	r2, [r3, #24]
	cmp	r2, #0
	str	r1, [r5, #40]
	moveq	r1, #1
	ldreq	r2, .L52+52
	ldmeq	r2, {r0, r2}
	stmeq	r3, {r0, r2}
	streq	r1, [r3, #24]
.L15:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L50:
	ldr	lr, [r9]
	ldr	ip, [r8]
	sub	r1, r1, lr
	ldr	lr, [r4, #20]
	sub	r0, r0, ip
	ldr	ip, [r4, #16]
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r3, #0
	movne	r2, #512
	strne	r3, [r4, #24]
	strhne	r2, [r10, #8]	@ movhi
	add	r2, r5, #12
	strne	r3, [r5, #28]
	ldmeq	r5, {r0, r1}
	ldrne	r0, [r5]
	ldrne	r1, [r5, #4]
	ldm	r2, {r2, r3}
	b	.L18
.L51:
	subgt	r3, r3, #4
	strgt	r3, [r4, #4]
	bgt	.L22
	ldr	r3, [r4]
	ldr	r2, [r5]
	cmp	r2, r3
	addlt	r3, r3, #4
	strlt	r3, [r4]
	blt	.L22
	subgt	r3, r3, #4
	strgt	r3, [r4]
	b	.L22
.L53:
	.align	2
.L52:
	.word	collisionmap3Bitmap
	.word	bullets3
	.word	collision
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	player3
	.word	cheat3
	.word	.LANCHOR0
	.word	tooClose3
	.word	1717986919
	.word	__aeabi_idivmod
	.word	eBullets3
	.word	enemyL3
	.size	updateEnemy3.part.4, .-updateEnemy3.part.4
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyL3.part.5, %function
drawEnemyL3.part.5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L56
	push	{r4, lr}
	ldr	lr, [r3]
	ldr	r4, .L56+4
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #40]
	ldr	ip, [r0]
	sub	r3, r3, lr
	ldr	r0, [r4]
	ldr	lr, .L56+8
	add	r2, r2, #32
	lsl	r3, r3, #23
	lsl	r1, r1, #3
	sub	ip, ip, r0
	lsl	r2, r2, #1
	lsr	r3, r3, #23
	add	r0, lr, r1
	and	ip, ip, #255
	orr	r2, r2, #8192
	orr	r3, r3, #16384
	strh	ip, [lr, r1]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawEnemyL3.part.5, .-drawEnemyL3.part.5
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawItem3.part.7, %function
drawItem3.part.7:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #70
	ldr	r2, .L59
	ldr	r1, .L59+4
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L59+8
	ldr	r2, [r2]
	sub	r3, r3, ip
	ldr	ip, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L59+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	bx	lr
.L60:
	.align	2
.L59:
	.word	key3
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawItem3.part.7, .-drawItem3.part.7
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStair3.part.9, %function
drawStair3.part.9:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #320
	ldr	r2, .L62
	ldr	r1, .L62+4
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L62+8
	ldr	r2, [r2]
	sub	r3, r3, ip
	ldr	ip, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L62+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #26]	@ movhi
	strh	r2, [r1, #24]	@ movhi
	strh	r0, [r1, #28]	@ movhi
	bx	lr
.L63:
	.align	2
.L62:
	.word	stair3
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawStair3.part.9, .-drawStair3.part.9
	.align	2
	.global	initPlayer3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer3, %function
initPlayer3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	push	{r4, r5, r6, lr}
	mov	r0, #0
	mov	r5, #15
	mov	r4, #10
	mov	lr, #20
	ldr	r3, .L66
	ldr	r2, [r3, #16]
	ldr	r6, .L66+4
	add	r1, r2, r2, lsr #31
	ldr	r6, [r6]
	asr	r1, r1, ip
	ldr	r2, [r3, #20]
	rsb	r1, r1, #80
	add	r1, r1, r6
	ldr	r6, .L66+8
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
.L67:
	.align	2
.L66:
	.word	player3
	.word	vOff
	.word	hOff
	.size	initPlayer3, .-initPlayer3
	.align	2
	.global	animatePlayer3
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer3, %function
animatePlayer3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L87
	ldr	r3, .L87+4
	ldrh	r1, [r0, #48]
	ldr	r2, [r3, #36]
	tst	r1, #64
	push	{r4, r5}
	str	r2, [r3, #40]
	ldr	r2, [r3, #60]
	bne	.L72
	mov	ip, #1
	ldr	r1, .L87+8
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr #3
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #2
	str	ip, [r3, #36]
	bne	.L72
	ldr	r1, [r3, #44]
	ldrh	r0, [r0, #48]
	adds	r1, r1, ip
	and	r1, r1, ip
	rsbmi	r1, r1, #0
	ands	r0, r0, #128
	str	r1, [r3, #44]
	bne	.L71
	str	r0, [r3, #36]
.L81:
	ldr	r1, [r3, #44]
	ldr	r0, .L87
	adds	r1, r1, #1
	ldrh	r0, [r0, #48]
	and	r1, r1, #1
	rsbmi	r1, r1, #0
	tst	r0, #32
	str	r1, [r3, #44]
	bne	.L75
	mov	r1, #2
	str	r1, [r3, #36]
.L82:
	ldr	r1, [r3, #44]
	ldr	r0, .L87
	adds	r1, r1, #1
	ldrh	r0, [r0, #48]
	and	r1, r1, #1
	rsbmi	r1, r1, #0
	tst	r0, #16
	str	r1, [r3, #44]
	moveq	r1, #3
	streq	r1, [r3, #36]
	bne	.L80
.L83:
	ldr	r1, [r3, #44]
	adds	r1, r1, #1
	and	r1, r1, #1
	rsbmi	r1, r1, #0
	str	r1, [r3, #44]
.L80:
	add	r2, r2, #1
	str	r2, [r3, #60]
	pop	{r4, r5}
	bx	lr
.L72:
	ldr	r1, .L87
	ldrh	r1, [r1, #48]
	ands	r1, r1, #128
	bne	.L71
	ldr	r0, .L87+8
	smull	r4, r5, r2, r0
	asr	r0, r2, #31
	rsb	r0, r0, r5, asr #3
	add	r0, r0, r0, lsl #2
	cmp	r2, r0, lsl #2
	str	r1, [r3, #36]
	beq	.L81
.L71:
	ldr	r1, .L87
	ldrh	r1, [r1, #48]
	tst	r1, #32
	bne	.L75
	mov	r0, #2
	ldr	r1, .L87+8
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr #3
	add	r1, r1, r1, lsl r0
	cmp	r2, r1, lsl r0
	str	r0, [r3, #36]
	beq	.L82
.L75:
	ldr	r1, .L87
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L80
	mov	r0, #3
	ldr	r1, .L87+8
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr r0
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #2
	str	r0, [r3, #36]
	beq	.L83
	add	r2, r2, #1
	str	r2, [r3, #60]
	pop	{r4, r5}
	bx	lr
.L88:
	.align	2
.L87:
	.word	67109120
	.word	player3
	.word	1717986919
	.size	animatePlayer3, .-animatePlayer3
	.align	2
	.global	updatePlayer3
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer3, %function
updatePlayer3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L154
	ldrh	r3, [r2, #48]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L154+4
	tst	r3, #32
	ldm	r4, {r3, ip}
	bne	.L90
	cmp	r3, #255
	ldrhhi	r2, [r2, #48]
	bls	.L150
.L146:
	ldr	r1, .L154+8
.L93:
	ldr	r2, .L154
	ldrh	r2, [r2, #48]
	ldr	lr, .L154+12
	tst	r2, #64
	ldr	r2, [lr]
	bne	.L94
	ldr	r0, [r4, #16]
	ldr	r5, .L154+16
	add	r6, r3, r0
	cmp	r6, r5
	movle	r0, #1
	movgt	r0, #0
	cmp	r3, #0
	movle	r0, #0
	cmp	r0, #0
	bne	.L151
.L94:
	ldr	r0, .L154
	ldrh	r0, [r0, #48]
	ands	r0, r0, #128
	bne	.L95
	ldr	r6, [r4, #16]
	add	r5, r6, r3
	cmp	r5, #256
	movgt	r7, #0
	movle	r7, #1
	cmp	r3, #0
	movlt	r7, #0
	cmp	r7, #0
	bne	.L152
.L95:
	mov	r0, #0
	str	r0, [r4, #28]
	str	r0, [r4, #32]
.L96:
	ldr	r0, .L154+20
	ldr	r1, [r1]
	ldrh	r0, [r0]
	sub	r3, r3, r2
	sub	r1, ip, r1
	tst	r0, #1
	str	r1, [r4, #52]
	str	r3, [r4, #48]
	ldr	r2, [r4, #24]
	beq	.L148
	ldr	r3, .L154+24
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L148
	cmp	r2, #12
	bgt	.L100
.L148:
	add	r2, r2, #1
	str	r2, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer3
.L90:
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L146
	cmp	r3, #255
	ldr	r1, .L154+8
	bhi	.L93
	b	.L102
.L150:
	sub	r2, ip, #1
	cmp	r2, #255
	bls	.L140
.L149:
	ldr	r1, .L154+8
.L92:
	ldr	r2, .L154
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L93
.L102:
	ldr	r0, [r4, #20]
	ldr	r2, [r4, #52]
	add	r2, r0, r2
	cmp	r2, #240
	bgt	.L93
	cmp	ip, #0
	blt	.L93
	add	r0, r0, ip
	add	lr, r0, r3, lsl #8
	ldr	r5, .L154+28
	lsl	lr, lr, #1
	ldrh	lr, [r5, lr]
	cmp	lr, #0
	beq	.L93
	ldr	lr, [r4, #16]
	add	lr, r3, lr
	sub	lr, lr, #1
	add	r0, r0, lr, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L93
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
	b	.L93
.L151:
	cmp	ip, #255
	bhi	.L94
	sub	r0, r3, #1
	lsl	r0, r0, #8
	add	r5, r0, ip
	ldr	r6, .L154+28
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	cmp	r5, #0
	beq	.L94
	ldr	r5, [r4, #20]
	add	r0, r0, r5
	add	r0, r0, ip
	add	r0, r6, r0, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	beq	.L94
	mvn	r5, #0
	mov	r0, #1
	ldr	r6, [r4, #8]
	cmp	r2, #0
	sub	r3, r3, r6
	str	r3, [r4]
	str	r5, [r4, #32]
	str	r0, [r4, #36]
	ble	.L94
	ldr	r0, [r4, #48]
	cmp	r0, #80
	addle	r2, r2, r5
	strle	r2, [lr]
	b	.L94
.L152:
	cmp	ip, #255
	bhi	.L95
	lsl	r5, r5, #8
	add	r7, r5, ip
	ldr	r8, .L154+28
	lsl	r7, r7, #1
	ldrh	r7, [r8, r7]
	cmp	r7, #0
	beq	.L95
	ldr	r7, [r4, #20]
	add	r5, r5, r7
	add	r5, r5, ip
	add	r5, r8, r5, lsl #1
	ldrh	r5, [r5, #-2]
	cmp	r5, #0
	beq	.L95
	mov	r5, #1
	ldr	r7, [r4, #8]
	cmp	r2, #95
	add	r3, r3, r7
	str	r0, [r4, #36]
	str	r3, [r4]
	str	r5, [r4, #32]
	bgt	.L96
	ldr	r0, [r4, #48]
	add	r6, r6, r0
	cmp	r6, #80
	addgt	r2, r2, r5
	strgt	r2, [lr]
	b	.L96
.L100:
	ldr	r2, .L154+32
	ldr	r1, .L154+36
	ldr	r0, .L154+40
	ldr	r5, .L154+44
	mov	lr, pc
	bx	r5
	ldr	r3, .L154+48
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L153
.L101:
	mov	r2, #1
	str	r2, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	b	animatePlayer3
.L140:
	add	r1, r2, r3, lsl #8
	ldr	r0, .L154+28
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	beq	.L149
	ldr	r1, [r4, #16]
	add	r1, r3, r1
	sub	r1, r1, #1
	add	r2, r2, r1, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	beq	.L149
	mvn	lr, #0
	mov	r0, #2
	ldr	r1, .L154+8
	ldr	r5, [r4, #12]
	ldr	r2, [r1]
	sub	ip, ip, r5
	cmp	r2, #0
	str	ip, [r4, #4]
	str	lr, [r4, #28]
	str	r0, [r4, #36]
	ble	.L92
	ldr	r0, [r4, #52]
	cmp	r0, #120
	addle	r2, r2, lr
	strle	r2, [r1]
	b	.L92
.L153:
	bl	fireBullet3.part.1
	b	.L101
.L155:
	.align	2
.L154:
	.word	67109120
	.word	player3
	.word	hOff
	.word	vOff
	.word	257
	.word	oldButtons
	.word	buttons
	.word	collisionmap3Bitmap
	.word	11025
	.word	5513
	.word	shoot
	.word	playSoundB
	.word	bullets3
	.size	updatePlayer3, .-updatePlayer3
	.align	2
	.global	drawPlayer3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer3, %function
drawPlayer3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L164
	ldr	r3, [r2, #52]
	ldr	r0, [r2, #36]
	lsl	r3, r3, #23
	ldr	r1, .L164+4
	ldrb	ip, [r2, #48]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	cmp	r0, #0
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	beq	.L161
	cmp	r0, #1
	beq	.L162
	cmp	r0, #2
	beq	.L163
	cmp	r0, #3
	ldreq	r3, [r2, #44]
	addeq	r3, r3, #66
	lsleq	r3, r3, #1
	orreq	r3, r3, #4096
	strheq	r3, [r1, #4]	@ movhi
	bx	lr
.L161:
	ldr	r3, [r2, #44]
	add	r3, r3, #128
	lsl	r3, r3, #1
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L162:
	ldr	r3, [r2, #44]
	add	r3, r3, #130
	lsl	r3, r3, #1
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L163:
	ldr	r3, [r2, #44]
	add	r3, r3, #64
	lsl	r3, r3, #1
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L165:
	.align	2
.L164:
	.word	player3
	.word	shadowOAM
	.size	drawPlayer3, .-drawPlayer3
	.align	2
	.global	initBullets3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets3, %function
initBullets3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #4
	mvn	r4, #3
	mov	r2, #0
	mov	r1, #2
	mov	lr, #1
	ldr	r3, .L172
	add	ip, r3, #180
.L167:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r4, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	lr, [r3, #32]
	add	r3, r3, #36
	cmp	r3, ip
	bne	.L167
	mov	r0, #4
	mvn	lr, #3
	mov	r2, #0
	mov	r1, #2
	ldr	r3, .L172+4
	add	ip, r3, #180
.L168:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	lr, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	add	r3, r3, #36
	cmp	r3, ip
	bne	.L168
	pop	{r4, lr}
	bx	lr
.L173:
	.align	2
.L172:
	.word	bullets3
	.word	eBullets3
	.size	initBullets3, .-initBullets3
	.align	2
	.global	initGame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame3, %function
initGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #48
	mov	r2, #8
	ldr	r1, .L176
	ldr	r3, .L176+4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	r0, [r1]
	str	r2, [r3]
	bl	initPlayer3
	bl	initBullets3
	mov	r1, #2
	mov	r2, #120
	mov	lr, #1
	mov	ip, #16
	mov	r0, #0
	mov	r4, #11
	mov	r9, #160
	mov	r8, #20
	mov	r7, #93
	mov	r6, #75
	mov	r5, #62
	ldr	r3, .L176+8
	str	r1, [r3, #44]
	ldr	r1, .L176+12
	str	r2, [r3, #4]
	str	r2, [r1, #4]
	ldr	r2, .L176+16
	str	r9, [r3]
	str	r8, [r3, #20]
	str	r7, [r1]
	str	lr, [r3, #8]
	str	lr, [r3, #28]
	str	lr, [r1, #16]
	str	lr, [r2, #16]
	str	r6, [r2]
	str	r5, [r2, #4]
	str	r4, [r2, #8]
	str	r4, [r2, #12]
	str	ip, [r3, #12]
	str	ip, [r3, #16]
	str	ip, [r1, #8]
	str	ip, [r1, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #32]
	str	r0, [r3, #36]
	str	r0, [r3, #40]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L177:
	.align	2
.L176:
	.word	vOff
	.word	hOff
	.word	enemyL3
	.word	stair3
	.word	key3
	.size	initGame3, .-initGame3
	.align	2
	.global	fireBullet3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet3, %function
fireBullet3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L180
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxne	lr
	b	fireBullet3.part.1
.L181:
	.align	2
.L180:
	.word	bullets3
	.size	fireBullet3, .-fireBullet3
	.align	2
	.global	fireEBullet3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEBullet3, %function
fireEBullet3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L184
	ldr	r2, [r3, #24]
	cmp	r2, #0
	moveq	r1, #1
	ldreq	r2, .L184+4
	ldmeq	r2, {r0, r2}
	streq	r1, [r3, #24]
	stmeq	r3, {r0, r2}
	bx	lr
.L185:
	.align	2
.L184:
	.word	eBullets3
	.word	enemyL3
	.size	fireEBullet3, .-fireEBullet3
	.align	2
	.global	updateBullet3
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet3, %function
updateBullet3:
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
	bne	.L203
	ldr	r3, [r0]
	ldr	r2, [r0, #16]
	add	r1, r3, r2
	cmp	r1, #0
	bgt	.L204
	mov	r2, #512
	ldr	r3, .L206
	str	r5, [r0, #24]
	strh	r2, [r3]	@ movhi
.L186:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L203:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L190
	ldr	r3, [r0]
	cmp	r3, #159
	ble	.L205
.L191:
	mov	r1, #0
	mov	r2, #512
	ldr	r3, .L206+4
	str	r1, [r0, #24]
	strh	r2, [r3, #8]	@ movhi
	b	.L186
.L190:
	cmp	r3, #1
	bne	.L192
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #20]
	add	r3, r2, r3
	cmp	r3, #0
	ble	.L191
	ldr	r3, [r0, #12]
	sub	r2, r2, r3
	str	r2, [r0, #4]
	b	.L186
.L204:
	mov	r4, r0
	ldr	lr, .L206+8
	ldr	r1, .L206+12
	ldr	ip, [r0, #8]
	ldr	r0, .L206+16
	ldr	r6, [lr]
	ldr	lr, [r1]
	ldr	r1, [r4, #4]
	sub	ip, r3, ip
	ldr	r3, [r0, #20]
	str	r2, [sp, #8]
	sub	r1, r1, r6
	ldr	r2, [r0, #16]
	str	r1, [sp, #4]
	sub	lr, ip, lr
	add	r0, r0, #48
	ldm	r0, {r0, r1}
	str	lr, [sp]
	ldr	lr, [r4, #20]
	str	ip, [r4]
	ldr	r6, .L206+20
	str	lr, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L186
	mov	r1, #512
	ldr	r3, .L206+24
	ldr	r3, [r3]
	ldr	r2, .L206
	cmp	r3, #0
	str	r5, [r4, #24]
	strh	r1, [r2]	@ movhi
	bne	.L186
	ldr	r4, .L206+28
	ldr	ip, [r4]
	ldr	r2, .L206+32
	add	ip, ip, #2
	ldr	r1, .L206+36
	ldr	r0, .L206+40
	ldr	r5, .L206+44
	str	ip, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	cmp	r3, #4
	moveq	r2, #1
	ldreq	r3, .L206+48
	streq	r2, [r3]
	b	.L186
.L192:
	cmp	r3, #2
	bne	.L193
	ldr	r3, [r0, #4]
	cmp	r3, #239
	bgt	.L191
	ldr	r2, [r0, #12]
	add	r3, r2, r3
	str	r3, [r0, #4]
	b	.L186
.L205:
	ldr	r2, [r0, #8]
	add	r3, r2, r3
	str	r3, [r0]
	b	.L186
.L193:
	cmp	r3, #3
	bne	.L191
	ldr	r2, [r0]
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	cmp	r3, #0
	ble	.L191
	ldr	r3, [r0, #8]
	sub	r2, r2, r3
	str	r2, [r0]
	b	.L186
.L207:
	.align	2
.L206:
	.word	shadowOAM+960
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.word	player3
	.word	collision
	.word	cheat3
	.word	.LANCHOR0
	.word	11025
	.word	7451
	.word	playerhit
	.word	playSoundB
	.word	tooClose3
	.size	updateBullet3, .-updateBullet3
	.align	2
	.global	drawBullet3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet3, %function
drawBullet3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #32]
	cmp	r3, #0
	ldrh	r2, [r0]
	ldr	r3, [r0, #4]
	bne	.L214
	ldr	r1, .L215
	ldr	r0, .L215+4
	ldr	r1, [r1]
	ldr	r0, [r0]
	sub	r3, r3, r1
	lsl	r3, r3, #23
	ldr	r1, .L215+8
	sub	r2, r2, r0
	lsr	r3, r3, #23
	ldr	r0, .L215+12
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	bx	lr
.L214:
	mov	r0, #68
	lsl	r3, r3, #23
	ldr	r1, .L215+16
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #10]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	strh	r0, [r1, #12]	@ movhi
	bx	lr
.L216:
	.align	2
.L215:
	.word	hOff
	.word	vOff
	.word	shadowOAM+960
	.word	8390
	.word	shadowOAM
	.size	drawBullet3, .-drawBullet3
	.align	2
	.global	drawGame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame3, %function
drawGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer3
	ldr	r0, .L232
	bl	drawBullet3
	ldr	r0, .L232+4
	bl	drawBullet3
	ldr	r0, .L232+8
	bl	drawBullet3
	ldr	r0, .L232+12
	bl	drawBullet3
	ldr	r0, .L232+16
	bl	drawBullet3
	ldr	r0, .L232+20
	bl	drawBullet3
	ldr	r0, .L232+24
	bl	drawBullet3
	ldr	r0, .L232+28
	bl	drawBullet3
	ldr	r4, .L232+32
	ldr	r0, .L232+36
	bl	drawBullet3
	ldr	r0, .L232+40
	bl	drawBullet3
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L218
	mov	r2, #512
	ldr	r3, .L232+44
	strh	r2, [r3, #96]	@ movhi
.L219:
	ldr	r3, [r4, #76]
	cmp	r3, #0
	bne	.L220
	mov	r2, #512
	ldr	r3, .L232+44
	strh	r2, [r3, #104]	@ movhi
.L221:
	ldr	r3, [r4, #124]
	cmp	r3, #0
	bne	.L229
	mov	r2, #512
	ldr	r3, .L232+44
	strh	r2, [r3, #112]	@ movhi
.L223:
	ldr	r3, .L232+48
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L230
	mov	r2, #512
	ldr	r3, .L232+44
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L232+52
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L231
.L226:
	mov	r2, #512
	ldr	r3, .L232+44
	strh	r2, [r3, #24]	@ movhi
.L227:
	mov	r3, #67108864
	ldr	r2, .L232+56
	ldrh	r1, [r2]
	ldr	r2, .L232+60
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L230:
	bl	drawItem3.part.7
	ldr	r3, .L232+52
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L226
.L231:
	bl	drawStair3.part.9
	b	.L227
.L229:
	mov	r1, #14
	ldr	r0, .L232+64
	bl	drawEnemyL3.part.5
	b	.L223
.L220:
	mov	r1, #13
	ldr	r0, .L232+68
	bl	drawEnemyL3.part.5
	b	.L221
.L218:
	mov	r1, #12
	mov	r0, r4
	bl	drawEnemyL3.part.5
	b	.L219
.L233:
	.align	2
.L232:
	.word	bullets3
	.word	bullets3+36
	.word	bullets3+72
	.word	bullets3+108
	.word	bullets3+144
	.word	eBullets3
	.word	eBullets3+36
	.word	eBullets3+72
	.word	enemyL3
	.word	eBullets3+108
	.word	eBullets3+144
	.word	shadowOAM
	.word	key3
	.word	stair3
	.word	hOff
	.word	vOff
	.word	enemyL3+96
	.word	enemyL3+48
	.size	drawGame3, .-drawGame3
	.align	2
	.global	initEnemy3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy3, %function
initEnemy3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #160
	mov	r4, #120
	mov	lr, #20
	mov	r0, #1
	mov	r1, #16
	mov	ip, #2
	ldr	r3, .L236
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #20]
	str	ip, [r3, #44]
	str	r0, [r3, #8]
	str	r0, [r3, #28]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	pop	{r4, r5, lr}
	bx	lr
.L237:
	.align	2
.L236:
	.word	enemyL3
	.size	initEnemy3, .-initEnemy3
	.align	2
	.global	updateEnemy3
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy3, %function
updateEnemy3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemy3.part.4
	.size	updateEnemy3, .-updateEnemy3
	.align	2
	.global	drawEnemyL3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyL3, %function
drawEnemyL3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r3, r1
	bne	.L242
	mov	r1, #512
	ldr	r2, .L243
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L242:
	b	drawEnemyL3.part.5
.L244:
	.align	2
.L243:
	.word	shadowOAM
	.size	drawEnemyL3, .-drawEnemyL3
	.align	2
	.global	initItem3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initItem3, %function
initItem3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #11
	mov	ip, #75
	mov	r0, #62
	mov	r1, #1
	ldr	r3, .L246
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L247:
	.align	2
.L246:
	.word	key3
	.size	initItem3, .-initItem3
	.align	2
	.global	updateItem3
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateItem3, %function
updateItem3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L257
	ldr	r3, [r4, #16]
	cmp	r3, #0
	sub	sp, sp, #16
	bne	.L256
.L248:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L256:
	ldr	r5, .L257+4
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
	ldr	r6, .L257+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L248
	mov	ip, #0
	mov	r0, #512
	mov	r1, #2
	ldr	r2, .L257+12
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	ldr	r3, .L257+16
	str	ip, [r4, #16]
	strh	r0, [r3, #16]	@ movhi
	str	r1, [r5, #56]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L258:
	.align	2
.L257:
	.word	key3
	.word	player3
	.word	collision
	.word	numOfKeys
	.word	shadowOAM
	.size	updateItem3, .-updateItem3
	.align	2
	.global	drawItem3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawItem3, %function
drawItem3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L262
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L261
	mov	r2, #512
	ldr	r3, .L262+4
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L261:
	b	drawItem3.part.7
.L263:
	.align	2
.L262:
	.word	key3
	.word	shadowOAM
	.size	drawItem3, .-drawItem3
	.align	2
	.global	initStair3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStair3, %function
initStair3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #16
	mov	ip, #93
	mov	r0, #120
	mov	r1, #1
	ldr	r3, .L265
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L266:
	.align	2
.L265:
	.word	stair3
	.size	initStair3, .-initStair3
	.align	2
	.global	updateStair3
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStair3, %function
updateStair3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L279
	ldr	r3, [r4, #16]
	cmp	r3, #0
	sub	sp, sp, #16
	bne	.L278
.L267:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L278:
	ldr	r5, .L279+4
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
	ldr	r6, .L279+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L267
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L267
	mov	ip, #0
	mov	r0, #512
	mov	r2, #3
	ldr	r1, .L279+12
	ldr	r3, .L279+16
	str	ip, [r4, #16]
	strh	r0, [r1, #24]	@ movhi
	str	r2, [r3, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L280:
	.align	2
.L279:
	.word	stair3
	.word	player3
	.word	collision
	.word	shadowOAM
	.word	.LANCHOR0
	.size	updateStair3, .-updateStair3
	.align	2
	.global	updateGame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame3, %function
updateGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer3
	ldr	r0, .L298
	bl	updateBullet3
	ldr	r0, .L298+4
	bl	updateBullet3
	ldr	r0, .L298+8
	bl	updateBullet3
	ldr	r0, .L298+12
	bl	updateBullet3
	ldr	r0, .L298+16
	bl	updateBullet3
	ldr	r0, .L298+20
	bl	updateBullet3
	ldr	r0, .L298+24
	bl	updateBullet3
	ldr	r0, .L298+28
	bl	updateBullet3
	ldr	r4, .L298+32
	ldr	r0, .L298+36
	bl	updateBullet3
	ldr	r0, .L298+40
	bl	updateBullet3
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L295
	ldr	r3, [r4, #76]
	cmp	r3, #0
	bne	.L296
.L283:
	ldr	r3, [r4, #124]
	cmp	r3, #0
	bne	.L297
.L284:
	bl	updateItem3
	pop	{r4, lr}
	b	updateStair3
.L295:
	mov	r0, r4
	bl	updateEnemy3.part.4
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L283
.L296:
	ldr	r0, .L298+44
	bl	updateEnemy3.part.4
	ldr	r3, [r4, #124]
	cmp	r3, #0
	beq	.L284
.L297:
	ldr	r0, .L298+48
	bl	updateEnemy3.part.4
	bl	updateItem3
	pop	{r4, lr}
	b	updateStair3
.L299:
	.align	2
.L298:
	.word	bullets3
	.word	bullets3+36
	.word	bullets3+72
	.word	bullets3+108
	.word	bullets3+144
	.word	eBullets3
	.word	eBullets3+36
	.word	eBullets3+72
	.word	enemyL3
	.word	eBullets3+108
	.word	eBullets3+144
	.word	enemyL3+48
	.word	enemyL3+96
	.size	updateGame3, .-updateGame3
	.align	2
	.global	drawStair3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStair3, %function
drawStair3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L303
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L302
	mov	r2, #512
	ldr	r3, .L303+4
	strh	r2, [r3, #24]	@ movhi
	bx	lr
.L302:
	b	drawStair3.part.9
.L304:
	.align	2
.L303:
	.word	stair3
	.word	shadowOAM
	.size	drawStair3, .-drawStair3
	.align	2
	.global	resetGameLevel3
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetGameLevel3, %function
resetGameLevel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L306
	str	r2, [r3, #4]
	bx	lr
.L307:
	.align	2
.L306:
	.word	.LANCHOR0
	.size	resetGameLevel3, .-resetGameLevel3
	.align	2
	.global	resetHealth3
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetHealth3, %function
resetHealth3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L309
	ldr	r2, .L309+4
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L310:
	.align	2
.L309:
	.word	tooClose3
	.word	.LANCHOR0
	.size	resetHealth3, .-resetHealth3
	.align	2
	.global	cheatToggle3
	.syntax unified
	.arm
	.fpu softvfp
	.type	cheatToggle3, %function
cheatToggle3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L314
	ldr	r2, [r3]
	cmp	r2, #0
	movne	r2, #0
	moveq	r2, #1
	str	r2, [r3]
	bx	lr
.L315:
	.align	2
.L314:
	.word	cheat3
	.size	cheatToggle3, .-cheatToggle3
	.align	2
	.global	getCheat3
	.syntax unified
	.arm
	.fpu softvfp
	.type	getCheat3, %function
getCheat3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L317
	ldr	r0, [r3]
	bx	lr
.L318:
	.align	2
.L317:
	.word	cheat3
	.size	getCheat3, .-getCheat3
	.align	2
	.global	resetCheat3
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetCheat3, %function
resetCheat3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L320
	str	r2, [r3]
	bx	lr
.L321:
	.align	2
.L320:
	.word	cheat3
	.size	resetCheat3, .-resetCheat3
	.comm	cheat3,4,4
	.global	hits3
	.global	gameGameLevel3
	.comm	numOfKeys,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	tooClose3,4,4
	.comm	stair3,20,4
	.comm	key3,20,4
	.comm	enemyL3,240,4
	.comm	eBullets3,180,4
	.comm	bullets3,180,4
	.comm	player3,64,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hits3, %object
	.size	hits3, 4
hits3:
	.space	4
	.type	gameGameLevel3, %object
	.size	gameGameLevel3, 4
gameGameLevel3:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
