# Simple Synthesizer

A simple synthesizer with a GTK interface and ALSA audio output. The synthesizer generates a sine wave tone that can be controlled through a graphical interface.

## Features

- Adjustable frequency (20 Hz to 2000 Hz)
- Adjustable gain (0 to 1)
- Gate button to turn sound on/off
- Real-time parameter control
- ALSA audio output

## Dependencies

The synthesizer requires the following dependencies:

- GTK+ 2.0
- ALSA library
- pthread library

On Ubuntu/Debian, you can install these dependencies with:
```bash
sudo apt-get install libgtk2.0-dev libasound2-dev
```

## Compilation

To compile the synthesizer, run:
```bash
g++ -o simple_synth gtk_interface.cpp -lpthread -lasound `pkg-config --cflags --libs gtk+-2.0`
```

## Running the Synthesizer

To run the synthesizer, simply execute:
```bash
./simple_synth
```

## Usage

1. The interface will show three controls:
   - Frequency slider (20 Hz to 2000 Hz)
   - Gain slider (0 to 1)
   - Gate button (toggle on/off)

2. To produce sound:
   - Click the Gate button to turn the sound on
   - Adjust the frequency and gain using the sliders
   - Click the Gate button again to turn the sound off

## Troubleshooting

### ALSA Issues

If you encounter ALSA errors, try the following:

1. Check if ALSA is properly installed:
```bash
aplay -l
```

2. If you see multiple audio devices, you can specify which one to use by modifying the `init_alsa()` function in `gtk_interface.cpp`:
```cpp
snd_pcm_open(&playback_handle, "hw:1", SND_PCM_STREAM_PLAYBACK, 0)
```
Replace "hw:1" with your desired audio device.

### Real-time Scheduling Issues

If you see messages about real-time scheduling, you may need to add your user to the audio group:
```bash
sudo usermod -a -G audio $USER
```
Then log out and log back in for the changes to take effect.

## License

This project is open source and available under the MIT License. 