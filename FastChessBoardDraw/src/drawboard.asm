*=$C000                ; Start of upper RAM area

    color    = $02
    colorram = $FB
    pos      = $FD
    counters = $0334
    temp     = $03FC

    lda #$f8           ; Initialize pos to 1016
    sta pos
    lda #$03
    sta pos + 1

    lda #$03           ; Initialize color to 3 (cyan)
    sta color

    ldy #$01           ; Start of rows draw loop

rowsloop

    sty counters       ; Start lines draw loop
    ldy #$01

linesloop

    lda #$07           ; Increment pos by 7
    sta temp
    jsr incpos

    sty counters + 1   ; Start squares draw loop
    ldy #$01

squaresloop

    sty counters + 2   ; Start square draw loop
    ldy #$01

squareloop

    lda #$01           ; Incremet pos by 1
    sta temp
    jsr incpos

    ldx #$00           ; Write space to screen
    lda #$a0
    sta (pos,X)

    clc
    lda pos            ; Calculate next color RAM address
    sta colorram
    lda pos + 1
    adc #$d4
    sta colorram + 1
    lda color          ; Setting color
    sta (colorram,X)

    iny                ; End of square draw loop
    cpy #$05
    bne squareloop
    ldy counters + 2

    jsr switchcolor

    iny                ; End of squares draw loop
    cpy #$09
    bne squaresloop
    ldy counters + 1

    lda #$01           ; Increment pos by 1
    sta temp
    jsr incpos

    iny                ; End of lines draw loop
    cpy #$04
    bne linesloop
    ldy counters

    jsr switchcolor

    iny                ; End of rows draw loop
    cpy #$09
    bne rowsloop

    rts


incpos
    clc                ; Increments value of pos by the value of temp
    lda pos            ; Adding temp to low byte
    adc temp
    sta pos
    lda pos + 1        ; Adding carry to high byte
    adc #$00
    sta pos + 1
    rts


switchcolor
    ldx color          ; Check current color
    cpx #$00
    bne setblack
    ldx #$03           ; Set color to cyan
    stx color
    rts
setblack
    ldx #$00           ; Set color to black
    stx color
    rts