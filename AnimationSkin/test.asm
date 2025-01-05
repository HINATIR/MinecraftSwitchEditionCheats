;--スタックポインタ処理
BL #0x37d588 ; SystemtimeInMilisec 現在時間をミリ秒で取得
ADRP X19, 0x1777000
LDR X2, [X19] ; X2 = SavedTime
SUB X1, X0, X2 ; X1 = 現時点の時間 - 過去の時間
CMP X1, #ループ間隔(ミリ秒)
B.LS #skip ; 条件満たさなかったらスキップ
STR X0, [X19] ; 次の処理のため、今の時間を過去の時間としてストア
LDR W1, [X19, #0x8]
ADD W1, W1, #1
STR  W1, [X19, #0x8] ; ループ回数ロードして+1してストア
SCVTF D0, W1 ; ループ回数の余剰を知るためにDoubleに変換
FMOV D1, #変更するスキンの合計数
BL 0x9C9EB8 ; double fmod_0(double x, double y)
FCVTAS X1, D0 ; 整数に戻す
MOV X0, #0x8
MUL X1, X0, X1
MOV X0, #0x10
ADD X1, X0, X1
ADD X19, X19, X1 ; ループ回数に応じてスキンidの場所の調整
BL 0x67db90 ; Minecraft::GetInstance
LDR X0, [X0,#0x58] ; mc::Minecraft::getInstance()->LocalPlayer;
LDR W1, [X19] ; skinid
BL 0x2CA0FC ; setCustomSkin6PlayerFUi
#skip
;--スタックポインタ処理
RET

dataspace_0x1777000:
0x0 SavedTime
0x8 Count
0x10 skin1
0x18 skin2
...