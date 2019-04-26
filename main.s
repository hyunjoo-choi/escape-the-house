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
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #1
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	ldr	r0, .L4+16
	mov	lr, pc
	bx	r4
	mov	r1, #4
	mov	r4, #0
	ldr	ip, .L4+20
	ldr	r0, .L4+24
	ldr	r3, .L4+28
	ldr	r2, .L4+32
	str	r4, [ip]
	str	r4, [r0]
	str	r1, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	mov	lr, pc
	bx	r2
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+64
	mov	lr, pc
	bx	r3
	ldr	r5, .L4+68
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+72
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #3216
	mov	r2, #100663296
	ldr	r1, .L4+76
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L4+80
	ldr	r1, .L4+84
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	mov	r1, #5120
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r4, [r3, #16]	@ movhi
	ldr	r2, .L4+88
	strh	r4, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L4+92
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1571328
	.word	thecarnival
	.word	numOfKeys
	.word	gameLevel
	.word	health
	.word	resetGameLevel
	.word	resetGameLevel2
	.word	resetGameLevel3
	.word	resetHealth
	.word	resetHealth2
	.word	resetHealth3
	.word	resetCheat
	.word	resetCheat2
	.word	resetCheat3
	.word	DMANow
	.word	startBGPal
	.word	startBGTiles
	.word	100704256
	.word	startBGMap
	.word	waitForVBlank
	.word	state
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
	mov	r3, #67108864
	mov	r2, #4352
	strh	r2, [r3]	@ movhi
	b	goToStart
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L9
	mov	r2, #83886080
	ldr	r1, .L9+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L9+8
	mov	r2, #100663296
	ldr	r1, .L9+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L9+16
	ldr	r1, .L9+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #6656
	mov	r1, #256
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L9+24
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r2, #1
	ldr	r3, .L9+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L10:
	.align	2
.L9:
	.word	DMANow
	.word	instructionsBGPal
	.word	5472
	.word	instructionsBGTiles
	.word	100716544
	.word	instructionsBGMap
	.word	waitForVBlank
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	mov	r1, #0
	push	{r4, lr}
	mov	lr, #4
	ldr	r2, .L13
	ldr	r0, .L13+4
	ldr	ip, .L13+8
	ldr	r4, .L13+12
	str	r1, [r2]
	str	r1, [r0]
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L13+16
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #11712
	mov	r2, #100663296
	ldr	r1, .L13+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L13+24
	ldr	r1, .L13+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L13+32
	ldr	r2, .L13+36
	ldr	r1, .L13+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L13+44
	ldr	r1, .L13+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L13+52
	ldr	r1, .L13+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L13+60
	ldr	r1, .L13+64
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L13+68
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	lr, #4864
	mov	r4, #6528
	mov	ip, #2
	ldr	r3, .L13+72
	ldr	r2, [r3]
	lsl	r3, r2, #16
	lsr	r3, r3, #16
	strh	r3, [r1, #16]	@ movhi
	ldr	r3, .L13+76
	ldr	r3, [r3]
	add	r2, r2, r2, lsr #31
	lsl	r0, r3, #16
	add	r3, r3, r3, lsr #31
	lsr	r0, r0, #16
	asr	r2, r2, #1
	asr	r3, r3, #1
	strh	r0, [r1, #18]	@ movhi
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	ldr	r0, .L13+80
	strh	lr, [r1]	@ movhi
	lsr	r2, r2, #16
	add	lr, lr, #392
	lsr	r3, r3, #16
	strh	r4, [r1, #8]	@ movhi
	strh	lr, [r1, #10]	@ movhi
	strh	r2, [r1, #20]	@ movhi
	pop	{r4, lr}
	strh	r3, [r1, #22]	@ movhi
	str	ip, [r0]
	bx	lr
.L14:
	.align	2
.L13:
	.word	gameLevel
	.word	hits
	.word	health
	.word	DMANow
	.word	skyPal
	.word	room1Tiles
	.word	100714496
	.word	room1Map
	.word	7712
	.word	100696064
	.word	skyTiles
	.word	100704256
	.word	skyMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	hOff
	.word	vOff
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
	ldr	r4, .L27
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L16
	ldr	r2, .L27+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L25
.L16:
	tst	r3, #4
	beq	.L15
	ldr	r3, .L27+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L26
.L15:
	pop	{r4, lr}
	bx	lr
.L26:
	pop	{r4, lr}
	b	goToInstructions
.L25:
	bl	goToGame
	ldr	r3, .L27+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L16
.L28:
	.align	2
.L27:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L41
	ldr	r3, .L41+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L30
	ldr	r2, .L41+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L39
.L30:
	tst	r3, #8
	beq	.L29
	ldr	r3, .L41+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
.L29:
	pop	{r4, lr}
	bx	lr
.L40:
	bl	goToGame
	ldr	r3, .L41+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L39:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L30
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+4
	ldr	r0, .L45+8
	ldr	r1, [r3]
	ldr	ip, .L45+12
	rsb	lr, r1, #4
	ldr	r4, .L45+16
	str	r1, [r0]
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L45+20
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+24
	mov	r2, #100663296
	ldr	r1, .L45+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L45+32
	ldr	r1, .L45+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L45+40
	ldr	r1, .L45+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L45+48
	ldr	r1, .L45+52
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+56
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #6784
	mov	ip, #4352
	mov	r1, #3
	ldr	r2, .L45+60
	ldrh	r2, [r2]
	strh	r2, [r3, #16]	@ movhi
	ldr	r2, .L45+64
	ldrh	lr, [r2]
	ldr	r2, .L45+68
	strh	lr, [r3, #18]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	pop	{r4, lr}
	str	r1, [r2]
	bx	lr
.L46:
	.align	2
.L45:
	.word	initGame2
	.word	hits
	.word	hits2
	.word	health
	.word	DMANow
	.word	basementPal
	.word	18048
	.word	basementTiles
	.word	100716544
	.word	basementMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	hOff
	.word	vOff
	.word	state
	.size	goToGame2, .-goToGame2
	.align	2
	.global	goToGame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame3, %function
goToGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	ldr	r0, .L49+8
	ldr	r1, [r3]
	ldr	ip, .L49+12
	rsb	lr, r1, #4
	ldr	r4, .L49+16
	str	r1, [r0]
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L49+20
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldr	r3, .L49+24
	mov	r2, #100663296
	ldr	r1, .L49+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L49+32
	ldr	r1, .L49+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L49+40
	ldr	r1, .L49+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L49+48
	ldr	r1, .L49+52
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L49+56
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #6784
	mov	ip, #4352
	mov	r1, #4
	ldr	r2, .L49+60
	ldrh	r2, [r2]
	strh	r2, [r3, #16]	@ movhi
	ldr	r2, .L49+64
	ldrh	lr, [r2]
	ldr	r2, .L49+68
	strh	lr, [r3, #18]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	pop	{r4, lr}
	str	r1, [r2]
	bx	lr
.L50:
	.align	2
.L49:
	.word	initGame3
	.word	hits2
	.word	hits3
	.word	health
	.word	DMANow
	.word	hallwayPal
	.word	5472
	.word	hallwayTiles
	.word	100716544
	.word	hallwayMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	hOff
	.word	vOff
	.word	state
	.size	goToGame3, .-goToGame3
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
	mov	r3, #16
	ldr	r4, .L53
	mov	r2, #83886080
	ldr	r1, .L53+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2848
	mov	r2, #100663296
	ldr	r1, .L53+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L53+12
	ldr	r1, .L53+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #6656
	mov	r1, #256
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L53+20
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r2, #5
	ldr	r3, .L53+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	DMANow
	.word	pauseBGPal
	.word	pauseBGTiles
	.word	100716544
	.word	pauseBGMap
	.word	waitForVBlank
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
	ldr	r3, .L70
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r2, .L70+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L56
	ldr	r3, .L70+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L67
	cmp	r3, #1
	beq	.L68
	cmp	r3, #2
	beq	.L69
.L55:
	pop	{r4, lr}
	bx	lr
.L56:
	tst	r3, #4
	beq	.L55
	ldr	r3, .L70+8
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L55
	pop	{r4, lr}
	b	goToStart
.L67:
	pop	{r4, lr}
	b	goToGame
.L69:
	pop	{r4, lr}
	b	goToGame3
.L68:
	pop	{r4, lr}
	b	goToGame2
.L71:
	.align	2
.L70:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	gameLevel
	.size	pause, .-pause
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
	ldr	r3, .L74
	mov	lr, pc
	bx	r3
	ldr	r4, .L74+4
	mov	r3, #0
	ldr	r2, .L74+8
	ldr	r1, .L74+12
	ldr	r0, .L74+16
	mov	lr, pc
	bx	r4
	ldr	r4, .L74+20
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L74+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2096
	mov	r2, #100663296
	ldr	r1, .L74+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L74+32
	ldr	r1, .L74+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #6656
	mov	r1, #256
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L74+40
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r2, #6
	ldr	r3, .L74+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L75:
	.align	2
.L74:
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	59490
	.word	cheer
	.word	DMANow
	.word	winBGPal
	.word	winBGTiles
	.word	100716544
	.word	winBGMap
	.word	waitForVBlank
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
	ldr	r3, .L83
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
	ldr	r3, .L83+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
.L76:
	pop	{r4, lr}
	bx	lr
.L82:
	pop	{r4, lr}
	b	goToStart
.L84:
	.align	2
.L83:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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
	mov	r3, #16
	ldr	r4, .L87
	mov	r2, #83886080
	ldr	r1, .L87+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1808
	mov	r2, #100663296
	ldr	r1, .L87+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L87+12
	ldr	r1, .L87+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #6656
	mov	r1, #256
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L87+20
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r2, #7
	ldr	r3, .L87+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L88:
	.align	2
.L87:
	.word	DMANow
	.word	loseBGPal
	.word	loseBGTiles
	.word	100716544
	.word	loseBGMap
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
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
	.align	2
	.global	drawHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHealth, %function
drawHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #4
	str	lr, [sp, #-4]!
	beq	.L97
	cmp	r0, #3
	beq	.L98
	cmp	r0, #2
	beq	.L99
	cmp	r0, #1
	mov	r2, #512
	beq	.L100
	ldr	r3, .L101
	ldr	lr, [sp], #4
	strh	r2, [r3, #56]	@ movhi
	strh	r2, [r3, #48]	@ movhi
	strh	r2, [r3, #40]	@ movhi
	strh	r2, [r3, #32]	@ movhi
	bx	lr
.L98:
	mov	lr, #512
	ldr	r3, .L101+4
	ldr	r0, [r3, #8]
	ldrh	ip, [r3, #4]
	lsl	r2, r0, #16
	ldr	r3, .L101
	lsr	r2, r2, #16
	orr	r0, r0, #16384
	rsb	r1, r1, #97
	lsl	r1, r1, #17
	strh	r0, [r3, #34]	@ movhi
	add	r0, r2, #12
	add	r2, r2, #24
	lsr	r1, r1, #16
	orr	r0, r0, #16384
	orr	r2, r2, #16384
	strh	lr, [r3, #56]	@ movhi
	strh	r1, [r3, #36]	@ movhi
	strh	r1, [r3, #44]	@ movhi
	strh	r1, [r3, #52]	@ movhi
	strh	ip, [r3, #32]	@ movhi
	strh	ip, [r3, #40]	@ movhi
	strh	ip, [r3, #48]	@ movhi
	strh	r0, [r3, #42]	@ movhi
	strh	r2, [r3, #50]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L97:
	ldr	r3, .L101+4
	ldr	ip, [r3, #8]
	ldrh	r0, [r3, #4]
	lsl	r2, ip, #16
	ldr	r3, .L101
	lsr	r2, r2, #16
	orr	ip, ip, #16384
	rsb	r1, r1, #97
	add	lr, r2, #12
	lsl	r1, r1, #17
	strh	ip, [r3, #34]	@ movhi
	add	ip, r2, #24
	add	r2, r2, #36
	lsr	r1, r1, #16
	orr	lr, lr, #16384
	orr	ip, ip, #16384
	orr	r2, r2, #16384
	strh	lr, [r3, #42]	@ movhi
	strh	r1, [r3, #36]	@ movhi
	strh	r1, [r3, #44]	@ movhi
	strh	r1, [r3, #52]	@ movhi
	strh	r1, [r3, #60]	@ movhi
	strh	r0, [r3, #32]	@ movhi
	strh	r0, [r3, #40]	@ movhi
	strh	r0, [r3, #48]	@ movhi
	strh	r0, [r3, #56]	@ movhi
	strh	ip, [r3, #50]	@ movhi
	strh	r2, [r3, #58]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L99:
	mov	ip, #512
	ldr	r3, .L101+4
	ldr	r2, [r3, #8]
	rsb	r1, r1, #97
	ldrh	lr, [r3, #4]
	add	r0, r2, #12
	ldr	r3, .L101
	lsl	r1, r1, #17
	lsr	r1, r1, #16
	orr	r0, r0, #16384
	orr	r2, r2, #16384
	strh	lr, [r3, #32]	@ movhi
	strh	lr, [r3, #40]	@ movhi
	strh	r0, [r3, #42]	@ movhi
	strh	r2, [r3, #34]	@ movhi
	strh	r1, [r3, #36]	@ movhi
	strh	r1, [r3, #44]	@ movhi
	strh	ip, [r3, #56]	@ movhi
	strh	ip, [r3, #48]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L100:
	ldr	ip, .L101+4
	ldr	r0, [ip, #8]
	ldr	r3, .L101
	rsb	r1, r1, #97
	ldr	ip, [ip, #4]
	lsl	r1, r1, #1
	orr	r0, r0, #16384
	strh	r1, [r3, #36]	@ movhi
	strh	ip, [r3, #32]	@ movhi
	strh	r0, [r3, #34]	@ movhi
	strh	r2, [r3, #56]	@ movhi
	strh	r2, [r3, #48]	@ movhi
	strh	r2, [r3, #40]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L102:
	.align	2
.L101:
	.word	shadowOAM
	.word	health
	.size	drawHealth, .-drawHealth
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
	ldr	r3, .L122
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r2, [r3]
	ldr	r4, .L122+4
	ldr	r3, .L122+8
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L122+12
	ldr	r3, [r3]
	ldr	r6, .L122+16
	ldr	r5, .L122+20
	ldr	r2, .L122+24
	rsb	r3, r3, #4
	str	r0, [r6]
	str	r3, [r5]
	mov	lr, pc
	bx	r2
	ldr	r3, .L122+28
	mov	lr, pc
	bx	r3
	ldr	r7, .L122+32
	ldr	r1, [r6]
	ldr	r0, [r5]
	bl	drawHealth
	ldr	r3, .L122+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r7]
	tst	r3, #8
	beq	.L104
	ldr	r2, .L122+40
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L118
.L104:
	tst	r3, #4
	beq	.L105
	ldr	r3, .L122+40
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L119
.L105:
	ldr	r3, .L122+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L120
.L106:
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L121
.L107:
	ldr	r4, .L122+48
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L122+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L120:
	bl	goToLose
	ldr	r3, [r4]
	cmp	r3, #1
	bne	.L107
.L121:
	bl	goToGame2
	b	.L107
.L119:
	ldr	r3, .L122+56
	mov	lr, pc
	bx	r3
	b	.L106
.L118:
	bl	goToPause
	ldrh	r3, [r7]
	b	.L104
.L123:
	.align	2
.L122:
	.word	gameGameLevel
	.word	gameLevel
	.word	getCheat
	.word	hits
	.word	.LANCHOR0
	.word	health
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	tooClose
	.word	DMANow
	.word	shadowOAM
	.word	cheatToggle
	.size	game, .-game
	.align	2
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L143
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+8
	ldr	r2, .L143+12
	ldr	r3, [r3]
	ldr	r1, [r2]
	ldr	r5, .L143+16
	ldr	r4, .L143+20
	rsb	r3, r3, #4
	ldr	r2, .L143+24
	str	r3, [r5]
	str	r1, [r4]
	mov	lr, pc
	bx	r2
	mov	r3, r0
	ldr	r2, .L143+28
	ldr	r0, [r5]
	mov	r1, r3
	ldr	r5, .L143+32
	str	r3, [r2]
	bl	drawHealth
	ldr	r3, .L143+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L125
	ldr	r2, .L143+40
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L139
.L125:
	tst	r3, #4
	beq	.L126
	ldr	r3, .L143+40
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L140
.L126:
	ldr	r3, .L143+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L141
.L127:
	ldr	r3, [r4]
	cmp	r3, #2
	beq	.L142
.L128:
	ldr	r4, .L143+48
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L143+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L141:
	bl	goToLose
	ldr	r3, [r4]
	cmp	r3, #2
	bne	.L128
.L142:
	bl	goToGame3
	b	.L128
.L140:
	ldr	r3, .L143+56
	mov	lr, pc
	bx	r3
	b	.L127
.L139:
	bl	goToPause
	ldrh	r3, [r5]
	b	.L125
.L144:
	.align	2
.L143:
	.word	updateGame2
	.word	drawGame2
	.word	hits2
	.word	gameGameLevel2
	.word	health
	.word	gameLevel
	.word	getCheat2
	.word	.LANCHOR0
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	tooClose2
	.word	DMANow
	.word	shadowOAM
	.word	cheatToggle2
	.size	game2, .-game2
	.align	2
	.global	game3
	.syntax unified
	.arm
	.fpu softvfp
	.type	game3, %function
game3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L164
	mov	lr, pc
	bx	r3
	ldr	r3, .L164+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L164+8
	ldr	r2, .L164+12
	ldr	r3, [r3]
	ldr	r1, [r2]
	ldr	r4, .L164+16
	ldr	r5, .L164+20
	rsb	r3, r3, #4
	ldr	r2, .L164+24
	str	r3, [r4]
	str	r1, [r5]
	mov	lr, pc
	bx	r2
	mov	r3, r0
	ldr	r2, .L164+28
	ldr	r0, [r4]
	mov	r1, r3
	ldr	r4, .L164+32
	str	r3, [r2]
	bl	drawHealth
	ldr	r3, .L164+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L146
	ldr	r2, .L164+40
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L160
.L146:
	tst	r3, #4
	beq	.L147
	ldr	r3, .L164+40
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L161
.L147:
	ldr	r3, [r5]
	cmp	r3, #3
	beq	.L162
	ldr	r3, .L164+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L163
.L148:
	ldr	r4, .L164+48
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L164+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L163:
	bl	goToLose
	b	.L148
.L160:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L146
.L161:
	ldr	r3, .L164+56
	mov	lr, pc
	bx	r3
	b	.L148
.L162:
	bl	goToWin
	b	.L148
.L165:
	.align	2
.L164:
	.word	updateGame3
	.word	drawGame3
	.word	hits3
	.word	gameGameLevel3
	.word	health
	.word	gameLevel
	.word	getCheat3
	.word	.LANCHOR0
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	tooClose3
	.word	DMANow
	.word	shadowOAM
	.word	cheatToggle3
	.size	game3, .-game3
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
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, r7, fp, lr}
	ldr	r3, .L180
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L180+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L180+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L180+12
	ldr	r8, .L180+16
	ldr	r5, .L180+20
	ldr	fp, .L180+24
	ldr	r10, .L180+28
	ldr	r9, .L180+32
	ldr	r7, .L180+36
	ldr	r4, .L180+40
.L167:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L168:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L168
.L170:
	.word	.L169
	.word	.L171
	.word	.L172
	.word	.L173
	.word	.L174
	.word	.L175
	.word	.L176
	.word	.L176
.L176:
	mov	lr, pc
	bx	r7
	b	.L167
.L175:
	ldr	r3, .L180+44
	mov	lr, pc
	bx	r3
	b	.L167
.L174:
	ldr	r3, .L180+48
	mov	lr, pc
	bx	r3
	b	.L167
.L173:
	ldr	r3, .L180+52
	mov	lr, pc
	bx	r3
	b	.L167
.L172:
	mov	lr, pc
	bx	r9
	b	.L167
.L171:
	mov	lr, pc
	bx	r10
	b	.L167
.L169:
	mov	lr, pc
	bx	fp
	b	.L167
.L181:
	.align	2
.L180:
	.word	goToStart
	.word	setupSounds
	.word	setupInterrupts
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	win
	.word	67109120
	.word	pause
	.word	game3
	.word	game2
	.size	main, .-main
	.global	gameCheat
	.comm	health,12,4
	.comm	gameLevel,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	gameCheat, %object
	.size	gameCheat, 4
gameCheat:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
