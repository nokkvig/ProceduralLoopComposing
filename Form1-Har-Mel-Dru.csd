<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
;===========================================================
#define BEATSPERLOOP #16#
#define BPM          #80#
#define DIRECTORY1   #"Har"#
#define DIRECTORY2   #"Mel"#
#define DIRECTORY3   #"Dru"#
;===========================================================
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1
seed 0
;===========================================================
;Length of each loop in seconds
giSecondsPerLoop = (60/$BPM)*$BEATSPERLOOP

;Adds "/" due to Csound bug
gSDir1 strcat $DIRECTORY1, "/"
gSDir2 strcat $DIRECTORY2, "/"
gSDir3 strcat $DIRECTORY3, "/"

;Directory finder
gSDirectory1[] directory gSDir1, ".wav"
gSDirectory2[] directory gSDir2, ".wav"
gSDirectory3[] directory gSDir3, ".wav"

giOne lenarray gSDirectory1
giTwo lenarray gSDirectory2
giThree lenarray gSDirectory3

;File Randomizer
gifirst random 0, giOne-0.001
gifirst = int(gifirst)
gisecond random 0, giTwo-0.001
gisecond = int(gisecond)
githird random 0, giThree-0.001
githird = int(githird)
;===========================================================
instr Songlength
schedule "Scheduler", 0, giSecondsPerLoop*9
endin
;===========================================================
instr Scheduler
;Schedules Directory 1
schedule "Directory1", 0, giSecondsPerLoop
schedule "Directory1", giSecondsPerLoop, giSecondsPerLoop
schedule "Directory1", giSecondsPerLoop*2, giSecondsPerLoop
schedule "Directory1", giSecondsPerLoop*4, giSecondsPerLoop
schedule "Directory1", giSecondsPerLoop*5, giSecondsPerLoop
schedule "Directory1silence", giSecondsPerLoop*6, giSecondsPerLoop
schedule "Directory1", giSecondsPerLoop*8, giSecondsPerLoop

;Schedules Directory 2
schedule "Directory2silence", giSecondsPerLoop, giSecondsPerLoop
schedule "Directory2", giSecondsPerLoop*2, giSecondsPerLoop
schedule "Directory2", giSecondsPerLoop*3, giSecondsPerLoop
schedule "Directory2", giSecondsPerLoop*5, giSecondsPerLoop
schedule "Directory2silence", giSecondsPerLoop*6, giSecondsPerLoop
schedule "Directory2", giSecondsPerLoop*7, giSecondsPerLoop

;Schedules Directory 3
schedule "Directory3", giSecondsPerLoop*2, giSecondsPerLoop
schedule "Directory3silence", giSecondsPerLoop*3, giSecondsPerLoop
schedule "Directory3", giSecondsPerLoop*4, giSecondsPerLoop
schedule "Directory3", giSecondsPerLoop*6, giSecondsPerLoop
schedule "Directory3", giSecondsPerLoop*7, giSecondsPerLoop
schedule "Directory3silence", giSecondsPerLoop*8, giSecondsPerLoop
endin
;===========================================================
instr Directory1
ione = gifirst
a11, a21 soundin gSDirectory1[ione]
outs a11, a21
endin
instr Directory1silence
ione = gifirst
a11, a21 soundin gSDirectory1[ione]
kres linseg 1, ((7*giSecondsPerLoop)/8)-0.1, 1, 0.1, 0
outs kres*a11, kres*a21
endin
;===========================================================
instr Directory2
itwo = gisecond
a11, a21 soundin gSDirectory2[itwo]
outs a11, a21
endin
instr Directory2silence
itwo = gisecond
a11, a21 soundin gSDirectory2[itwo]
kres linseg 1, ((7*giSecondsPerLoop)/8)-0.1, 1, 0.1, 0
outs kres*a11, kres*a21
endin
;===========================================================
instr Directory3
ithree = githird
a11, a21 soundin gSDirectory3[ithree]
outs a11, a21
endin
instr Directory3silence
ithree = githird
a11, a21 soundin gSDirectory3[ithree]
kres linseg 1, ((7*giSecondsPerLoop)/8)-0.1, 1, 0.1, 0
outs kres*a11, kres*a21
endin
;===========================================================
</CsInstruments>
<CsScore>
i"Songlength" 0 1
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
