   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  62                     ; 6 void myDelay()
  62                     ; 7 {
  64                     	switch	.text
  65  0000               _myDelay:
  67  0000 5204          	subw	sp,#4
  68       00000004      OFST:	set	4
  71                     ; 9    for(i=0;i<4000;i++)
  73  0002 5f            	clrw	x
  74  0003 1f01          	ldw	(OFST-3,sp),x
  76  0005               L33:
  77                     ; 11        for(j=0;j<100;j++);    
  79  0005 5f            	clrw	x
  80  0006 1f03          	ldw	(OFST-1,sp),x
  82  0008               L14:
  86  0008 1e03          	ldw	x,(OFST-1,sp)
  87  000a 1c0001        	addw	x,#1
  88  000d 1f03          	ldw	(OFST-1,sp),x
  92  000f 9c            	rvf
  93  0010 1e03          	ldw	x,(OFST-1,sp)
  94  0012 a30064        	cpw	x,#100
  95  0015 2ff1          	jrslt	L14
  96                     ; 9    for(i=0;i<4000;i++)
  98  0017 1e01          	ldw	x,(OFST-3,sp)
  99  0019 1c0001        	addw	x,#1
 100  001c 1f01          	ldw	(OFST-3,sp),x
 104  001e 9c            	rvf
 105  001f 1e01          	ldw	x,(OFST-3,sp)
 106  0021 a30fa0        	cpw	x,#4000
 107  0024 2fdf          	jrslt	L33
 108                     ; 13 }   
 111  0026 5b04          	addw	sp,#4
 112  0028 81            	ret
 136                     ; 15 main()   
 136                     ; 16 {            
 137                     	switch	.text
 138  0029               _main:
 142                     ; 17      GPIOB->DDR |= 0x20;  // PD.0 as Output
 144  0029 721a5007      	bset	20487,#5
 145                     ; 18      GPIOB->CR1 |= 0x20;  // PD.0 as Push Pull Type Output
 147  002d 721a5008      	bset	20488,#5
 148  0031               L75:
 149                     ; 21             GPIOB->ODR |=1<<5;  // PD.o = 1             
 151  0031 721a5005      	bset	20485,#5
 152                     ; 22             myDelay();                          
 154  0035 adc9          	call	_myDelay
 156                     ; 23             GPIOB->ODR &= ~(1<<5); // PD.0 = 0
 158  0037 721b5005      	bres	20485,#5
 159                     ; 24             myDelay();
 161  003b adc3          	call	_myDelay
 164  003d 20f2          	jra	L75
 177                     	xdef	_main
 178                     	xdef	_myDelay
 197                     	end
