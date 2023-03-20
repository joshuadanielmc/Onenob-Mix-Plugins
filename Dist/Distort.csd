<Cabbage>
form caption("Distort") size(370, 400), guiMode("queue") pluginId("def3"), colour (0,0,0) bundle("Distort.png")


image bounds(0, 0, 370, 400) channel("image10001") file("Distort.png")

rslider bounds(38, 42, 294, 296) popupText("0"), trackerInsideRadius(0.9), trackerOutsideRadius(0.8),channel("boost") colour(255, 255, 255, 0) range(0, 1, 0, 1, 0.01) trackerColour(197, 38, 38, 255) fontColour(180, 177, 177, 255) markerColour(96, 96, 96, 255) outlineColour(67, 67, 67, 255)


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

gifn	ftgen	0,0, 257, 9, .5,1,270	
instr 1
//kGain cabbageGetValue "gain"

 

a1 inch 1
a2 inch 2  

;a1,a2 diskin "pinknoise.wav",1,0 

aoutL distort a1, chnget:k("boost"),gifn
aoutR distort a2, chnget:k("boost"),gifn

outs aoutL, aoutR


endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
