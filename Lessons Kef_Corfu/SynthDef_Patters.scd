s.boot

{SinOsc.ar(440, 0 , 0.5)}.play;
{Saw.ar(440, 0.5)}.play;

{SinOsc.ar(Line.kr(50, 440*3, 4), 0, 0.5).dup}.play;
{SinOsc.ar(440, 0, XLine.kr(0.2, 0.8, 4, doneAction:2)).dup}.play;

{SinOsc.ar(XLine.kr(1200, 50, 2), 0, XLine.kr(0.2, 0.6, 2, doneAction:2)).dup}.play;

(
{
	arg freq = 440, amp = 0.5, time = 1;
	var src, env, envgen;
	src = SinOsc.ar(freq, 0, amp);
	env = Env.perc(0.05, 1, 1, -4);
	envgen = EnvGen.kr(env, doneAction:2);
	Out.ar([0,1], src * envgen);
}.play;
)


(
SynthDef(\sound, {|freq = 440, amp = 0.5, pan = 0|
	var src, env;
	src = Mix(Saw.ar((0..10).normalize / 20 + 1 * freq, amp));
	env = Env.perc.kr(doneAction:2);
	Out.ar(0, Pan2.ar(src, pan, env))
}).add;


//Synth(\sound);


SynthDef(\sound2, {|freq = 440, amp = 0.5, pan = 0|
	var src, env;
	src = Mix(SinOsc.ar((0..10).normalize / 12 + 1 * freq, 0, amp));
	env = Env.perc.kr(doneAction:2);
	Out.ar(0, Pan2.ar(src, pan, env))
}).add;
)

(
p = Pbind(\instrument, \sound,
	\freq, Pseq([100, 230, 88, 440], inf),
	\amp, Pwhite(0.1, 0.3, inf),
	\pan, Pseq([-1, 1], inf),
	\dur, Pseq([0.5, 0.25, 0.25, 1, 0.125, 0.125, 0.25, 0.25, 0.25 , 0.5, 0.5], inf)
).play;



k = Pbind(\instrument, \sound2,
	\freq, Pseq([100, 230, 88, 440], inf),
	\amp, Pwhite(0.1, 0.3, inf),
	\pan, Pseq([-1, 1], inf),
	\dur, Pseq([1, 0.25, 0.25, 0.5, 0.125, 0.125, 0.25, 0.25, 0.25 , 0.5, 0.5].normalizeSum * 4), inf)
).play;
)

[1, 0.25, 0.25, 0.5, 0.125, 0.125, 0.25, 0.25, 0.25 , 0.5, 0.5].sum

([0.5, 0.25, 0.25, 1, 0.125, 0.125, 0.25, 0.25, 0.25 , 0.5, 0.5].normalizeSum * 4).sum



(
p = Pbind(\instrument, \sound,
	\freq, Pseq([100, 230, 88, 440], inf),
	\amp, Pwhite(0.1, 0.3, inf),
	\pan, Pseq([-1, 1], inf),
	\dur, Pseq([0.5, 0.25, 0.25, 1, 0.125, 0.125, 0.25, 0.25, 0.25 , 0.5, 0.5], inf)
);



k = Pbind(\instrument, \sound2,
	\freq, Pseq([100, 230, 88, 440], inf),
	\amp, Pwhite(0.1, 0.3, inf),
	\pan, Pseq([-1, 1], inf),
	\dur, Pseq([1, 0.25, 0.25, 0.5, 0.125, 0.125, 0.25, 0.25, 0.25 , 0.5, 0.5].normalizeSum * 4, inf);
g = Ppar([p, k]).play;
)




(
p = Pbind(\instrument, \sound,
	\freq, Pseq([100, 230, 88, 440], inf),
	\amp, Pwhite(0.1, 0.3, inf),
	\pan, Pseq([-1, 1], inf),
	\dur, Pseq([0.5, 0.25, 0.25, 1, 0.125, 0.125, 0.25, 0.25, 0.25 , 0.5, 0.5], inf)
);
)

(
k = Pbind(\instrument, \sound2,
	\freq, Pseq([100, 230, 88, 440], inf),
	\amp, Pwhite(0.1, 0.3, inf),
	\pan, Pseq([-1, 1], inf),
	\dur, Pseq([1, 0.25, 0.25, 0.5, 0.125, 0.125, 0.25, 0.25, 0.25 , 0.5, 0.5].normalizeSum * 4, inf);
);
)









