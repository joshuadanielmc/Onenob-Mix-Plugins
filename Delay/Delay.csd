<Cabbage>
form caption("Delay") size(370, 400), guiMode("queue") pluginId("del1"), colour (0,0,0) bundle("Delay.png")
image bounds(0, 0, 370, 400) channel("image10001") file("Delay.png")

rslider bounds(34, 42, 297, 296) popupText("0"), trackerInsideRadius(0.9), trackerOutsideRadius(0.8),channel("boost") colour(255, 255, 255, 0) range(0, 5, 0, 1, 0.01) trackerColour(201, 226, 37, 255) fontColour(180, 177, 177, 255) markerColour(96, 96, 96, 255) outlineColour(67, 67, 67, 255) 

rslider bounds(264, 278, 32, 46) channel("gain") range(0, 1, 1, 1, 0.001) popupText("mix")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


instr 1


aL inch 1 
aR inch 2

kboost chnget "boost" 
kgain chnget "gain"

;aL,aR  diskin2 "Snare sample.wav",1,0 

 
;adl  =	.5		
a2   poscil3 100/2, 1/10, 1		;make an LFO
a2   = a2 + 100/2 

aoutL vdelay aL, a2*kboost, 8000
aoutR vdelay aR, a2*kboost, 8000



     ;outs aL+(aoutL), aR+(aoutR)

     outs aL+(aoutL*kgain), aR+(aoutR*kgain)
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f1 0 8192 10 1
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
