<Cabbage>
form caption("Compress") size(370, 400), guiMode("queue") pluginId("com8"), colour (0,0,0) bundle("Compress.png")


image bounds(0, 0, 370, 400) channel("image10001") file("Compress.png")

rslider bounds(34, 44, 299, 296) popupText("0"), trackerInsideRadius(0.9), trackerOutsideRadius(0.8),channel("boost") colour(255, 255, 255, 0) range(0, 1, 0, 1, 0.01) trackerColour(185, 14, 53, 255) fontColour(180, 177, 177, 255) markerColour(96, 96, 96, 255) outlineColour(67, 67, 67, 255) 


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
    
 

aL inch 1
aR inch 2  
                          
;aL,aR  diskin2 "Pinknoise.wav",1,0                                         ; read in live audio
 
; ar compress2 aasig, acsig, kthresh, kloknee, khiknee, kratio, katt, krel, ilook

 aC_L          compress2   aL, aL,  -90,-50, -30, 4, 0, 0.2, 0.01; compress both channels
 aC_R          compress2   aR, aR, -90,-50, -30, 4, 0, 0.2, 0.01
 
aoutL gain aC_L, chnget:k("boost")
aoutR gain aC_R, chnget:k("boost")

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
