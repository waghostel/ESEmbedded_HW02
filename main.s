.syntax unified

.word 0x20000100
.word _start

.global _start
.type _start, %function
_start:
	//mov move value in
	mov r0, #1
	mov r1, #2
	mov r2, #3

	// push & pop1
	push {r0,r1,r2}
	pop {r3,r4,r5}

	// push & pop2
	push {r2,r0,r1}
	pop {r3,r4,r5}


	//
	//branch w/o link
	//
	b	label01

label01:
	nop

	//
	//branch w/ link
	//

	bl	sleep

sleep:
	nop
	b	.
