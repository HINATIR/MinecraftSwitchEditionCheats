0x1870000 temp
0x1870100 Pos wchar "Pos : %.0f , %.0f , %.0f"
0x1870200 wstring
0x1870300 caliculate fps space
0x1870400 temp
0x1870500 Fps wchar "Fps : %d"
0x1870600 wstring

_GUI:
    SUB SP, SP, #0x50
    STP X20, X19, [SP,#0x20]
    STP X22, X21, [SP,#0x30]
    STP X29, X30, [SP,#0x40]
    ADD X29, SP, #0x40 
    BL 0x67db90 ; Minecraft::GetInstance
    MOV X20,X0
    BL 0x683b58 ; mc::GlStateManager::disableCull();
    BL 0x6a5d68 ; mc::GlStateManager::disableDepthTest();
    BL 0x683BA0 ; GlStateManager::enableAlphaTest(void)
    BL 0x6824c4 ; mc::GlStateManager::pushMatrix();
    FMOV S0, 5
    MOV W0,#0x100
    SCVTF S1, W0
    FMOV S2, WZR
    BL 0x6824dc ; mc::GlStateManager::translatef(5, 5, 0);
    FMOV S0, 4
    FMOV S1, 4
    FMOV S2, WZR
    BL 0x6827b8 ; mc::GlStateManager::scalef(1, 1, 0);
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
    MOV X1, X19
    LDR X0, [X20,#0x1B0] ; mc::Minecraft::getInstance()->defaultFonts;
    MOV W2, WZR
    MOV W3, WZR
    MOVZ W4, #0xF0FF,LSL #16
    MOVK W4, #0xFFFF
    BL 0x694C0C ; Font::drawShadow(std::wstring const&, int, int, int)
    BL 0x68252c ; mc::GlStateManager::popMatrix();
    BL 0x682818 ; GlStateManager::disableRescaleNormal(void)
    BL 0x6A0BA4 ; GlStateManager::enableDepthTest(void)
    MOV X0, X19
    BL 0x9C9AA8 ; std::wstring::~wstring(void)
    BL 0x683b58 ; mc::GlStateManager::disableCull();
    BL 0x6a5d68 ; mc::GlStateManager::disableDepthTest();
    BL 0x683BA0 ; GlStateManager::enableAlphaTest(void)
    BL 0x6824c4 ; mc::GlStateManager::pushMatrix();
    FMOV S0, 5
    MOV W0,#0x125
    SCVTF S1, W0
    FMOV S2, WZR
    BL 0x6824dc ; mc::GlStateManager::translatef(5, 5, 0);
    FMOV S0, 4
    FMOV S1, 4
    FMOV S2, WZR
    BL 0x6827b8 ; mc::GlStateManager::scalef(1, 1, 0);
    bl #0x37d588
    ADRP X19,#0x1870000
    ADD X19,X19,#0x300
    ldr x1, [x19]
    ldr w8, [x19, #0x10]
    add w8, w8, #1
    sub x9, x0, x1
    cmp x9, #0x3e8
    b.ls #0x6A2840 ; +A
    mov w9, w8
    mov w8, #0
    str x0, [x19]
    str w9, [x19, #0x18]
    str w8, [x19, #0x10]
    ldr w9, [x19, #0x18]
    mov w3,w9 
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
    MOV X1, X19
    LDR X0, [X20,#0x1B0] ; mc::Minecraft::getInstance()->defaultFonts;
    MOV W2, WZR
    MOV W3, WZR
    MOVZ W4, #0xF0FF,LSL #16
    MOVK W4, #0xFFFF
    BL 0x694C0C ; Font::drawShadow(std::wstring const&, int, int, int)
    BL 0x68252c ; mc::GlStateManager::popMatrix();
    BL 0x682818 ; GlStateManager::disableRescaleNormal(void)
    BL 0x6A0BA4 ; GlStateManager::enableDepthTest(void)
    MOV X0, X19
    BL 0x9C9AA8 ; std::wstring::~wstring(void)
    LDP X29, X30, [SP,#0x40]
    LDP X22, X21, [SP,#0x30]
    LDP X20, X19, [SP,#0x20]
    LDR S8, [SP,#0x10]
    ADD SP, SP, #0x50
    RET