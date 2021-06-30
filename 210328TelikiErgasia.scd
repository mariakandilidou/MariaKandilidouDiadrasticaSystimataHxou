Maria Kandilidou TX2019092

s.boot

(
	var seconds;

	{	
		SynthDef(\SoundCheck, {|seconds = 7|
			var sin1 = SinOsc.kr([50, 70], 0, [220, 90]);
			var sin2 = SinOsc.kr(7, 3, 10, 505);
			var sinModDepth = SinOsc.kr(0.01, 0, 10) * SinOsc.ar(0.00033, 0, 1500); //Magic number for 7 seconds
			var sinMod = (sin1 + sin2) * sinModDepth;
			var ampMod = SinOsc.kr(2, 1, 0.5, 1) * SinOsc.kr(1, 0, 0.5, 1);
			var sinLine = SinOsc.ar(Line.kr(20, 7, seconds););
			var sum = SinOsc.ar(sinMod, 4, ampMod).distort;
			var comb1 = (CombL.ar(sum, 0.01, 0.005, 1) + sum) * sinLine;
			var comb2 = (comb1 + (CombL.ar(comb1, 0.008, 0.007, 0.5) * 0.4));
			var clip1 = comb2.clip2(1) * 0.8;
			var env = EnvGen.ar(Env.linen(0.1, seconds - 0.2, 0.1), doneAction:2);
			var output = (clip1 * SinOsc.ar(40) * SinOsc.ar(345)) * env;
			Out.ar(0.5, output * 0.5);
		}).add;

		s.sync;

		seconds = 150; Synth(\SoundCheck, [\seconds, seconds]);
	}.fork
)
