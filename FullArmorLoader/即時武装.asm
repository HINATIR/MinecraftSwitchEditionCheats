0x562994: ; Achievement menu
BL 0x569130
B 0x562E5C

0x569130:
SUB SP, SP, #0x40
STP X20, X19, [SP,#0x20]
STP X29, X30, [SP,#0x30]
ADD X29, SP, #0x30 
mov w1, #0x9e
bl #0x569190
mov w1, #0x9f
bl #0x569190
mov w1, #0xa0
bl #0x569190
mov w1, #0xa1
bl #0x569190
mov w1, #0x184
bl #0x569190
mov w20, #0x40
sub w20, w20, #1
mov w1, #0x24
bl #0x569190
cbnz w20, #0x56916c
LDP X29, X30, [SP,#0x30]
LDP X20, X19, [SP,#0x20]
ADD SP, SP, #0x40
RET

0x569190:
SUB SP, SP, #0x40
STP X20, X19, [SP,#0x20]
STP X29, X30, [SP,#0x30]
ADD X29, SP, #0x30 
MOV W20,W1
BL 0x67DB90 ; mc::Minecraft::getInstance();
MOV W1,0
BL 0x6E019C ; Minecraft::getConnection(int)
MOV X19,X0
MOV             W0, #0x60 ;
BL 0x9C9A78 ; _Znwm_0 ; operator new(ulong)
MOV             W1, W20
MOV             W2, WZR
MOV             W3, WZR
MOV             X20, X0
BL 0xF1534 ; mc::CraftItemPacket(int,int,int)
ADD             X0, SP, #0x10
MOV             X1, X20
MOV             X2, XZR
BL 0x29DD3C ; ???
ADD             X1, SP, #0x10
MOV X0, X19 ; getInstance->getconnection(0);
BL 0x5BF198 ; ClientPacketListener::send(std::shared_ptr<Packet>)
ADD             X0, SP, #0x10
BL              0x293C8
ADRP X20, #0x1871000 ; ""
ADRP X19,#0x1871000
ADD X19,X19,#0x200
MOV X0,X20
STP XZR, XZR, [X19,#8]
STR XZR, [X19]
BL 0xB6BBC ; wcslen
MOV X2, X0
MOV X0, X19
MOV X1, X20
BL 0x9C9A98 ; std::wstring::__init(wchar_t const*,ulong)
MOV X1,X19
BL 0x67DB90
LDR X0,[X0,#0x228]
MOV             W2, WZR
MOV             W3, WZR
MOV             W4, WZR
MOV             W5, WZR
MOV             W6, WZR
BL              0x6AA8EC
MOV X0,X19
BL              0x9C9AA8
LDP X29, X30, [SP,#0x30]
LDP X20, X19, [SP,#0x20]
ADD SP, SP, #0x40
RET