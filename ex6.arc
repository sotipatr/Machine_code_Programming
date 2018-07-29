MICRO
c X=0100 ACC=0101 R1=0110 R2=0111 R3=1010 TEMP=1000 Y=1001
c    BRA  BIN  CON I[2:0] I[5:3] I[8:6] A    B    DD  CS
c BOOTSTRAP
m00 00000 000  000 111    000    011   0000 0011  00  0111010111
m01 00000 000  000 000    000    001   0000 0000  00  0010000000 NEXT(PC)
c LOAD ,R $K
m02 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m03 00000 000  000 111    000    011    0000 0100 00  0110011101 MDR+0->X
m04 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m05 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m06 00000 000  000 111    000    011    0000 0000 00  0010011101 MDR+0->BPORT
m07 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m08 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
c VEM R1, R2, R3
m09 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m0a 00000 000  000 111    000    001    0000 0000 00  0110011101 MDR+0->NOP
m0b 00000 000  000 011    000    000    0000 0000 00  0010011111 BPORT+0->QREG
m0c 00000 000  000 010    000    011    0000 0100 00  0110011111 QREG+0->X
m0d 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m0e 00000 000  000 111    000    001    0000 0000 00  0110011101 MDR+0->NOP
m0f 00000 000  000 011    000    000    0000 0000 00  0010011111 BPORT+0->QREG
m10 00000 000  000 010    000    011    0000 1001 00  0110011111 QREG+0->Y
m11 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m12 00000 000  000 111    000    001    0000 0000 00  0110011101 MDR+0->NOP
m13 00000 000  000 011    000    000    0000 0000 00  0010011111 BPORT+0->QREG
m14 00000 000  000 111    000    011    0000 1000 00  0110011110 0+0->TEMP
m15 00101 100  111 000    000    000    0000 0000 00  0110011111  JSR +5                                            
m16 00010 011  011 000    000    000    0000 0000 00  0110011111 BRZ +2
m17 11110 010  000 000    000    000    0000 0000 00  0110011111 JUMP -2
m18 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m19 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
c vector move
m1a 00000 000  000 100    000    001    0100 0000 00  0111011111 X+0->NOP, MAR
m1b 00000 000  000 111    000    011    0000 0101 00  0110011101 MDR+0->ACC
m1c 00000 000  000 100    000    001    1001 0000 00  0111011111 Y+0->NOP, MAR
m1d 00000 000  000 100    000    001    0101 0000 00  0100011111  ACC+0->NOP, ~MWE
m1e 00000 000  000 101    000    011    0100 0100 01  0110011110 X+1->X
m1f 00000 000  000 101    000    011    1001 1001 01  0110011110 Y+1->Y
m20 00000 000  000 101    000    011    1000 1000 01  0110011110 TEMP+1->TEMP
m21 00000 000  000 000    001    001    1000 0000 00  0110111111 QREG-TEMP->NOP, MSTATUS
m22 00000 110  000 000    000    000    0000 0000 00  0110011111 RTS
c VEMINC R1, R2 
m23 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m24 00000 000  000 111    000    001    0000 0000 00  0110011101 MDR+0->NOP
m25 00000 000  000 011    000    000    0000 0000 00  0010011111 BPORT+0->QREG
m26 00000 000  000 010    000    011    0000 0100 00  0110011111 QREG+0->X
m27 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m28 00000 000  000 111    000    001    0000 0000 00  0110011101 MDR+0->NOP
m29 00000 000  000 011    000    000    0000 0000 00  0010011111 BPORT+0->QREG
m2a 00000 000  000 111    000    011    0000 1000 00  0110011110 0+0->TEMP
m2b 00101 100  000 000    000    000    0000 0000 00  0110011111 JSR +5                                            
m2c 00010 011  011 000    000    000    0000 0000 00  0110011111 BRZ +2
m2d 11110 010  000 000    000    000    0000 0000 00  0110011111 JUMP -2
m2e 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m2f 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
c vector increase 
m30 00000 000  000 100    000    001    0100 0000 00  0111011111 X+0->NOP, MAR
m31 00000 000  000 111    000    011    0000 1001 01  0110011110 0+1->y
m32 00000 000  000 101    000    001    1001 0000 00  0100011101 MDR+Y->NOP, MWE
m33 00000 000  000 101    000    011    0100 0100 01  0110011110 X+1->X
m34 00000 000  000 101    000    011    1000 1000 01  0110011110 TEMP+1->TEMP
m35 00000 000  000 000    001    001    1000 0000 00  0110111111 QREG-TEMP->NOP, MSTATUS
m36 00000 110  000 000    000    000    0000 0000 00  0110011111 RTS
c HALT
m37 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)

MAIN
m00 00 //load R1, 00
m01 06
m02 00
m03 00 //load R2, X
m04 07
m05 11
m06 00 //load R3, 16(10hex)
m07 0a
m08 10
m09 01 //vem R1, R2, R3
m0a 06
m0b 07
m0c 0a
m0d 02 //veminc R2, R3
m0e 07
m0f 0a
m10 03 //halt
m11 00
m12 00
m13 00
m14 00
m15 00
m16 00
m17 00
m18 00
m19 00
m1a 00
m1b 00
m1c 00
m1d 00
m1e 00
m1f 00
m20 00
m21 00

MAPPER
m00 02
m01 09
m02 23
m03 37