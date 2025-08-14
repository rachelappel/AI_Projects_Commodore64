0 ::::::::::::::::::::::::::::::::::
1 REM CELLULAR AUTOMATON - PROGRAM 6
2 REM WRITTEN BY TIMOTHY J. O'MALLEY
3 REM COPYRIGHT 1983, TAB BOOKS INC.
4 REM (WRITTEN FOR THE COMMODORE 64)
5 ::::::::::::::::::::::::::::::::::
9 DIM B%(25,30),D%(25,30)
10 FOR I=1 TO 25:READ B$:FOR J=1 TO 30
20 IF MID$(B$,J,1)<>" " THEN B%(I,J)=1
30 IF MID$(B$,J,I)=" " THEN B%(I,J)=0
40 NEXT J,I
51 DATA"                              "
52 DATA"                              "
53 DATA"                              "
54 DATA"                              "
55 DATA"                              "
56 DATA"                              "
57 DATA"                              "
58 DATA"                              "
59 DATA"                              "
60 DATA"                              "
61 DATA"                              "
62 DATA"             ***              "
63 DATA"             * *              "
64 DATA"             * *              "
65 DATA"                              "
66 DATA"                              "
67 DATA"                              "
68 DATA"                              "
69 DATA"                              "
70 DATA"                              "
71 DATA"                              "
72 DATA"                              "
73 DATA"                              "
74 DATA"                              "
75 DATA"                              "
76 PRINT CHR$(147);
77 FOR I=55296 TO 56295:POKE I,1:NEXT
78 CL=24
80 FOR I=1 TO 25
82 GOSUB 220
85 FOR J=1 TO 30:D%(I,J)=0
90 NEXT J,I:FOR I=2 TO 24
92 GOSUB 220
95 FOR J=2 TO 29
100 IF B%(I,J)=0 THEN 130
110 FOR K=I-1 TO I+1:FOR L=J-1 TO J+1
120 D%(K,L)=D%(K,L)+1:NEXT L,K:D%(I,J)=D%(I,J)-1
130 NEXT J,I:FOR I=2 TO 24
132 GOSUB 220
135 R=983+40*I:U=2413+38*I:FOR J=2 TO 29
140 T=U+J:P=R+J:B%(I,J)=-(D%(I,J)=3 OR (B%(I,J)=1 AND D%(I,J)=2))
150 S=32+10*B%(I,J):POKE P,S
160 POKE T-39,S
170 NEXT J,I:GOTO 80
180 :::::::::::::::::::::::::::::::::::
200 REM CURRENT LINE INDICATOR
210 REM WRITTEN BY DENNIS DIETRICH
220 POKE 40*CL+1062,32
230 CL=I-1
250 POKE 40*CL+1062,31
260 RETURN
300 :::::::::::::::::::::::::::::::::::