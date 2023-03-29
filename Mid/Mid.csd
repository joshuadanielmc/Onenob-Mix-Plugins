<Cabbage>
form caption("Mid") size(370, 400), guiMode("queue") pluginId("mid1"), colour (0,0,0) bundle("Mid.png")


image bounds(0, 0, 370, 400) channel("image10001") file("Mid.png")

rslider bounds(38, 42, 294, 296) popupText("0"), trackerInsideRadius(0.9), trackerOutsideRadius(0.8),channel("boost") colour(255, 255, 255, 0) range(1, 3, 1, 1, 0.01) trackerColour(149, 55, 190, 255) fontColour(180, 177, 177, 255) markerColour(96, 96, 96, 255) outlineColour(67, 67, 67, 255)


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


instr 1
//kGain cabbageGetValue "gain"

 

a1 inch 1
a2 inch 2  

;a1,a2 diskin "pinknoise.wav",1,0

aoutL pareq a1, 1000, chnget:k("boost"),sqrt(.5),0
aoutR pareq a2, 1000, chnget:k("boost"),sqrt(.5),0



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
