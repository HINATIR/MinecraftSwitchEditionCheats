0x1870000 temp
0x1870100 Pos wchar "Pos : %.0f , %.0f , %.0f"
0x1870200 wstring
0x1870300 caliculate fps space
0x1870400 temp
0x1870500 Fps wchar "Fps : %d"
0x1870600 wstring

0x6A2700:
SUB SP, SP, #0x40
STP X20, X19, [SP,#0x10]
STP X22, X21, [SP,#0x20]
STP X29, X30, [SP,#0x30]
ADD X29, SP, #0x30 
BL 0x67db90 ; Minecraft::GetInstance
MOV X20, X0
LDR X19, [X20,#0x58] ; mc::Minecraft::getInstance()->LocalPlayer;
LDR D0,[X19,#0x78]
LDR D1,[X19,#0x80]
FMOV D2,1
FADD D1,D1,D2
LDR D2,[X19,#0x88]
ADRP X21, 0x1870000
ADRP X2,#0x1870000
ADD X2,X2,#0x100
MOV W1, #0x100
MOV X0, X21
ADRP X19,#0x1870000
ADD X19,X19,#0x200
BL 0x9C9C58 ; swprintf
MOV X0, X21
STP XZR, XZR, [X19,#8]
STR XZR, [X19]
BL 0xB6BBC ; wcslen
MOV X2, X0
MOV X0, X19
MOV X1, X21
BL 0x9C9A98; std::wstring::__init(wchar_t const*,ulong)
MOV X0, X19
MOV W1, 5
MOV W2, 5
MOVZ W3, #0xF0FF,LSL #16
MOVK W3, #0xFFFF
MOV W4, 0
FMOV S0, 4
BL 0x521530 ; wstring displayString(std::wstring const&, int x, int y, int textcolor, int textalign, float scale):
BL 0x9C9AA8 ; std::wstring::~wstring(void)
BL #0x37D588 ; getSystemtime
ADRP X19, #0x1870000
ADD X19, X19, #0x300
LDR X1, [X19]
LDR W8, [X19, #0x10]
ADD W8, W8, #1
SUB X9, X0, X1
CMP X9, #0x3E8
B.LS _skip1
MOV W9, W8
MOV W8, #0
STR X0, [X19]
STR W9, [X19, #0x18]
STR W8, [X19, #0x10] <= _skip1
LDR W9, [X19, #0x18]
MOV W3, W9
ADRP X21,#0x1870000
ADD X21,X21,#0x400
ADRP X2,#0x1870000
ADD X2,X2,#0x500
MOV W1, #0x100
MOV X0, X21
ADRP X19,#0x1870000
ADD X19,X19,#0x600
BL 0x9C9C58 ; swprintf
MOV X0, X21
STP XZR, XZR, [X19,#8]
STR XZR, [X19]
BL 0xB6BBC ; wcslen
MOV X2, X0
MOV X0, X19
MOV X1, X21
BL 0x9C9A98; std::wstring::__init(wchar_t const*,ulong)
MOV X0, X19
MOV W1, 5
MOV W2, #15
MOVZ W3, #0xF0FF,LSL #16
MOVK W3, #0xFFFF
MOV W4, 0
FMOV S0, 4
BL 0x521530 ; wstring  displayString(std::wstring const&, int x, int y, int textcolor, int textalign, float scale):
BL 0x9C9AA8 ; std::wstring::~wstring(void)
LDP X29, X30, [SP,#0x30]
LDP X22, X21, [SP,#0x20]
LDP X20, X19, [SP,#0x10]
ADD SP, SP, #0x40
RET