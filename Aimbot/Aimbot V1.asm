branched from 5535D0

0x9CBC30:

SUB SP, SP, #0x50
STP X21, X20, [SP,#0x30]
STP X29, X30, [SP,#0x40]
ADD X29, SP, #0x40 
BL 0x67db90 ; Minecraft::GetInstance
LDR X1, [X0,#0x58] ; mc::Minecraft::getInstance()->LocalPlayer;
ADRP X21,#0x1045000
ADD X21,X21,#0x5C0
LDR X2,[X21] ; get recent attacked player
CBZ X2,#0x9CBD9C; +52 END
MOV X20,X1 ; X1 = lPlayer
MOV X21,X2 ; X2 = target
LDR D8,[X20,#0x78]
LDR D9,[X21,#0x78]
FSUB D1,D9,D8 ; D1 = diffX
LDR D9,[X20,#0x88]
LDR D10,[X21,#0x88]
FSUB D0,D10,D9 ; D0 = diffZ
BL 0x9C9C48 ; double atan2_0(double)
MOV W8,#180
SCVTF D1,W8
FMUL D0,D0,D1
ADRP X8,#0xD6A000
ADD X8,X8,#0x808
LDR D1,[X8] ; gee Double PI
FDIV D0,D0,D1
MOV W8,#90
SCVTF D1,W8
FSUB D0,D0,D1
MOV W8,#360
SCVTF D1,W8 ; D1 = 360
FSUB D2,D0,D1 ; D2 = yaw - 360
FCMP D0,0.0
B.LT #0x9CBCBC; +4
FADD D0,D0,D1
FCMP D2,0.0
B.GT #0x9CBCC8; +4
FSUB D0,D0,D1
FCVT S0,D0
STR S0,[X20,#0xA8]
LDR D8,[X20,#0x78]
LDR D9,[X21,#0x78]
FSUB D8,D9,D8 ; D8 = diffX
LDR D9,[X20,#0x88]
LDR D10,[X21,#0x88]
FSUB D9,D10,D9 ; D9 = diffZ
FMOV D1,2
FMOV D0,D8
BL 0x9C9CD8 ; double pow(double , double);
FMOV D8,D0
FMOV D0,D9
FMOV D1,2
BL 0x9C9CD8 ; double pow(double , double);
FADD D0,D0,D8
BL 0x9C9B88 ; double sqrt(double);
FMOV D10,D0 ; D10 = dist
LDR D0,[X21,#0x80] ; D0 = target->y
FMOV D1,#1.875
FADD D0,D0,D1
LDR D1,[X20,#0x80] ; D1 = lPlayer->y
FSUB D0,D0,D1
MOV X0,X20
Bl 0x2D16E8 ; LocalPlayer::getEyeHeight(void)
FCVT D9,S0 ; D9 = lPlayer->eyeHeight
FSUB D0,D0,D9
FCMP D0,#0.0
B.LT #0x9CBD48; +8
FMOV D1,D10
BL 0x9C9C48 ; double atan2_0(double)
B #0x9CBD70; +B
LDR D0,[X21,#0x80] ; D0 = target->y
LDR D1,[X20,#0x80] ; D1 = lPlayer->y
FSUB D0,D0,D1
FSUB D0,D0,D9
FCMP D0,#0.0
B.GT #0x9CBD6C; +8
FMOV D1,D10
BL 0x9C9C48 ; double atan2_0(double)
B #0x9CBD70; +2
FMOV D0,#0.0
MOV W8,#180 ; 集合地点
SCVTF D1,W8
FMUL D0,D0,D1
ADRP X8,#0xD6A000
ADD X8,X8,#0x808
LDR D1,[X8] ; gee Double PI
FDIV D0,D0,D1
FMOV D1,-1.0
FMUL D0,D0,D1
FCVT S0,D0
STR S0,[X20,#0xAC]
LDP X29, X30, [SP,#0x40]
LDP X21, X20, [SP,#0x30]
ADD SP, SP, #0x50
RET