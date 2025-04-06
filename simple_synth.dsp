import("stdfaust.lib");

// Parameters
freq = hslider("freq", 440, 20, 2000, 0.1);
gain = hslider("gain", 0.5, 0, 1, 0.01);
gate = button("gate");

// Simple oscillator using basic Faust functions
process = os.osc(freq) * gain * gate;
