	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {lr}

	mov r4, #-1 @previous
	mov r5, #1  @result
        mov r6, #0  @i
	mov r7, #0  @sum

.L1:
	add r7, r4, r5
        mov r4, r5
	mov r5, r7
	add r6, r6, #1
	cmp r6, r0     
        ble .L1

	mov r0,r5
	pop {pc}

	@ ADD/MODIFY CODE BELOW
	@ PROLOG
@	push {r3, r4, r5, lr}

	@ R4 = R0 - 0 (update flags)
	@ if(R0 <= 0) goto .L3 (which returns 0)

	@ Compare R4 wtih 1
	@ If R4 == 1 goto .L4 (which returns 1)

	@ R0 = R4 - 1
	@ Recursive call to fibonacci with R4 - 1 as parameter

	@ R5 = R0
	@ R0 = R4 - 2
	@ Recursive call to fibonacci with R4 - 2 as parameter

	@ R0 = R5 + R0 (update flags)

@	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
@.L3:
@	mov r0, #0			@ R0 = 0
@	pop {r3, r4, r5, pc}		@ EPILOG
@
@.L4:
@	mov r0, #1			@ R0 = 1
@	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
