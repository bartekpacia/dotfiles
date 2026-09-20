// Firefox user preferences
// Managed via dotfiles. Do not edit directly.

// Use native PipeWire audio backend instead of PulseAudio compatibility layer.
// Fixes WebRTC microphone stuttering on Linux with PipeWire.
user_pref("media.cubeb.backend", "pipewire");

// Disable Firefox's own WebRTC audio processing stack (AEC, AGC, noise suppression).
// PipeWire/WirePlumber handles this at the system level instead.
user_pref("media.getusermedia.audio.processing.aec.enabled", false);
user_pref("media.getusermedia.audio.processing.agc.enabled", false);
user_pref("media.getusermedia.audio.processing.agc2.forced", false);
user_pref("media.getusermedia.audio.processing.noise.enabled", false);
