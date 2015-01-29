q:
    movem.l a0-a6/d0-d7,-(a7)
    bsr.s Init

Loop:
    cmp.b #$ff,$dff006
    bne.s Loop

Mouse:
    btst #6,$bfe001
    bne.s Loop
    beq.s Final

; >>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<
; >>> Tum alt-rutinler buradan sonra ... <<<
; >>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<

Final:
    lea SysCop,a0
    move.l (a0),50(a6)
    movem.l (a7)+,a0-a6/d0-d7
    rts

Init:
    move.l 4,a6
    lea GfxName,a1
    jsr -408(a6)
    move.l d0,a6
    move.l d0,GfxBase
    lea SysCop,a0
    lea Copper,a1
    move.l 50(a6),(a0)
    move.l a1,50(a6)
    rts

; >>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<
; >>> Tum datalar burada sonra ... <<<
; >>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<

GfxName:
    dc.b 'graphics.library',0,0

Copper: 
    dc.w $0100,$4200
        
    dc.w $008e,$3a81,$0090,$40c1
    dc.w $0092,$0038,$0094,$00d0
    dc.w $0108,$0000,$010a,$0000
        
    dc.w $00e0,$0007,$00e2,$0000
    dc.w $00e4,$0007,$00e6,$2800
    dc.w $00e8,$0007,$00ea,$5000
    dc.w $00ec,$0007,$00ee,$7800
    dc.w $00f0,$0007,$00f2,$a000
        
    dc.w $0180,$0000,$0182,$0000
    dc.w $0184,$0000,$0186,$0000
    dc.w $0188,$0000,$018a,$0000
    dc.w $018c,$0000,$018e,$0000
    dc.w $0190,$0000,$0192,$0000
    dc.w $0194,$0000,$0196,$0000
    dc.w $0198,$0000,$019a,$0000
    dc.w $019c,$0000,$019e,$0000
    dc.w $01a0,$0000,$01a2,$0000
    dc.w $01a4,$0000,$01a6,$0000
    dc.w $01a8,$0000,$01aa,$0000
    dc.w $01ac,$0000,$01ae,$0000
    dc.w $01b0,$0000,$01b2,$0000
    dc.w $01b4,$0000,$01b6,$0000
    dc.w $01b8,$0000,$01ba,$0000
    dc.w $01bc,$0000,$01be,$0000
        
    dc.w $0120,$0000,$0122,$0000
    dc.w $0124,$0000,$0126,$0000
    dc.w $0128,$0000,$012a,$0000
    dc.w $012c,$0000,$012e,$0000
    dc.w $0130,$0000,$0132,$0000
    dc.w $0134,$0000,$0136,$0000
    dc.w $0138,$0000,$013a,$0000
    dc.w $013c,$0000,$013e,$0000
        
    dc.w $ffff,$fffe

SysCop:
    dc.l 0
GfxBase:
    dc.l 0