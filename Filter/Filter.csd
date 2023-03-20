<Cabbage> bounds(0, 0, 0, 0)
form caption("Filter") size(370, 400), guiMode("queue") pluginId("def4"), colour (0,0,0) bundle("Filter.png")


image bounds(0, 0, 370, 400) channel("image10001") file("Filter.png")
combobox bounds(58, 360, 76, 18) channel("Res") value(1) text("None", "Moderate", "Extreme") fontColour(40, 147, 6, 255)

rslider bounds(38, 42, 294, 296) , trackerInsideRadius(0.9), trackerOutsideRadius(0.8),channel("boost") colour(255, 255, 255, 0) range(30, 20000, 20000, 0.3, 1) trackerColour(214, 151, 69, 255) fontColour(180, 177, 177, 255) markerColour(96, 96, 96, 255) outlineColour(67, 67, 67, 255)




label bounds(56, 342, 64, 14) channel("label10002") text("Reso") fontColour(159, 159, 159, 255)
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

kres chnget "Res" 
kmet chnget "met" 

;a1 inch 1
;a2 inch 2  



a1,a2 diskin "pinknoise.wav",1,0

if kres==1 then

aoutL bqrez a1, chnget:k("boost"), 0.1,0
aoutR bqrez a2, chnget:k("boost"), 0.1,0

elseif kres==2 then

aoutL bqrez a1, chnget:k("boost"), 3,0
aoutR bqrez a2, chnget:k("boost"), 3,0

elseif kres==3 then

aoutL bqrez a1, chnget:k("boost"), 6,0
aoutR bqrez a2, chnget:k("boost"), 6,0


endif

outs aoutL,aoutR

;outs a1, a2

endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
