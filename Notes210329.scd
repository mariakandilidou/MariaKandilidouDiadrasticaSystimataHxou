Server.default.boot;
Server.default.quit;
().play;
{SinOsc.ar}.play
SinOsc.ar
{ SinOsc.ar(MouseX.kr(40, 10000, 1), 0, 0.1) }.play;
{ SinOsc.ar(MouseY.kr(40, 10000, 1), 0, 0.1) }.play;
{ SinOsc.ar(MouseX.kr(40, 10000, 1), 0, MouseY.kr(0, 0.1)) }.play;
