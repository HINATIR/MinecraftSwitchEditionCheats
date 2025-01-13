SUB SP, SP, #0x30
STP X20, X19, [SP,#0x10]
STP X29, X30, [SP,#0x20]
ADD X29, SP, #0x20 
BL #0x37d588
ADRP X19, 0x1777000
LDR X2, [X19]
SUB X1, X0, X2
CMP X1, #100
B.LE _SKIP
STR X0, [X19]
LDR W1, [X19, #0x8]
ADD W1, W1, #1
STR  W1, [X19, #0x8]
SCVTF D0, W1
FMOV D1, #変更するスキンの合計数
BL 0x9C9EB8 ; double fmod_0(double x, double y)
FCVTAS X1, D0 ; 整数に戻す
MOV X0, #0x8
MUL X1, X0, X1
MOV X0, #0x10
ADD X1, X0, X1
ADD X19, X19, X1
BL 0x67db90 ; Minecraft::GetInstance
LDR X0, [X0,#0x58] ; mc::Minecraft::getInstance()->LocalPlayer;
LDR W1, [X19]
BL 0x2CA0FC ; setCustomSkin6PlayerFUi
LDP X29, X30, [SP,#0x20] <= _SKIP
LDP X20, X19, [SP,#0x10]
ADD SP, SP, #0x30
RET

dataspace_0x1777000:
0x0 SavedTime
0x8 Count
0x10 skin1
0x18 skin2
...