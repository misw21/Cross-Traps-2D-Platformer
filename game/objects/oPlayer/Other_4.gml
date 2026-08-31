// Reset lives only when entering specific rooms (Room0 or Room1)
if room == Room1 || room == Room2 {
    global.lives = 5; // Full lives in early rooms (e.g., main menu or tutorial)
} else {
    global.lives = 3; // Fewer lives in regular game levels
}

// Start background music if it's not already playing
if (!audio_is_playing(sndMusic)) {
    audio_play_sound(sndMusic, 1, true);
    // sndMusic: the background music asset
    // 1: priority level (higher = more important)
    // true: loop the music infinitely
}
