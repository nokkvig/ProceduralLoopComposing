<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>
<CsInstruments>
#define BEATSPERLOOP #16#
#define BPM          #80#
#define DIRECTORY1   #"Har"#
#define DIRECTORY2   #"Dru"#
#define FADE         #2#
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1
connect "EverythingAfterFirstLoop", "OutLeft", "FadeOut", "InLeft" 
connect "EverythingAfterFirstLoop", "OutRight", "FadeOut", "InRight"
seed 0
giLoopCount random 8, 16
;Length of each loop in seconds
giSecondsPerLoop = (60/$BPM)*$BEATSPERLOOP
alwayson "FadeOut"
gSDirectory1[] directory $DIRECTORY1, ".wav"
gSDirectory2[] directory $DIRECTORY2, ".wav"
giOne lenarray gSDirectory1
giTwo lenarray gSDirectory2

iCnt init 0
until iCnt>=giOne do
	printf_i "Filename = %s \n", 1, gSDirectory1[iCnt]
	iCnt = iCnt+1
od

gifirst random 0, giOne-0.001
gifirst = int(gifirst)
gisecond random 0, giOne-0.001
gisecond = int(gisecond)
while gifirst == gisecond do
gisecond random 0, giOne-0.001
gisecond = int(gisecond)
od
githird random 0, giTwo-0.001
githird = int(githird)
gifourth random 0, giTwo-0.001
gifourth = int(gifourth)
while githird == gifourth do
gifourth random 0, giTwo-0.001
gifourth = int(gifourth)
od

instr 1
schedule "Scheduler", 0, giLoopCount*giSecondsPerLoop
endin

instr Scheduler
schedule "FirstLoop", 0, giSecondsPerLoop
imore = 1
while imore<giLoopCount do
schedule "EverythingAfterFirstLoop", giSecondsPerLoop*imore, giSecondsPerLoop
imore = imore + 1
od
endin

instr FirstLoop
irand random 0, 1.999
irand = int(irand)
if (irand == 0) then
  ione = gifirst
elseif (irand == 1) then
  ione = gisecond
endif
irand random 0, 1.999
irand = int(irand)
if (irand == 0) then
  itwo = githird
elseif (irand == 1) then
  itwo = gifourth
endif
a11, a21 soundin gSDirectory1[ione]
a12, a22 soundin gSDirectory2[itwo]
irandtwo random 0, 1.999
irandtwo = int(irand)
if (irandtwo == 0) then
aselLeft = a11
aselRight = a21
elseif (irandtwo == 1) then
aselLeft = a12
aselRight = a22
endif
outs aselLeft, aselRight
endin

instr EverythingAfterFirstLoop
irand random 0, 1.999
irand = int(irand)
if (irand == 0) then
  ione = gifirst
elseif (irand == 1) then
  ione = gisecond
endif
irand random 0, 1.999
irand = int(irand)
if (irand == 0) then
  itwo = githird
elseif (irand == 1) then
  itwo = gifourth
endif
a11, a21 soundin gSDirectory1[ione]
a12, a22 soundin gSDirectory2[itwo]
outleta "OutLeft", a11+a12
outleta "OutRight", a21+a22
endin

instr FadeOut
aleftin inleta "InLeft"
arightin inleta "InRight"
kres linseg 1, giSecondsPerLoop*(giLoopCount-$FADE), 1, giSecondsPerLoop*$FADE, 0
outs kres*aleftin, kres*arightin
endin

</CsInstruments>

<CsScore>

i1 0 1

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
