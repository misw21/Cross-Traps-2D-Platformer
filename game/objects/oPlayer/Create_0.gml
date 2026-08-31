// Set the window size (width x height in pixels)
window_set_size(1280, 720);

// Initialize movement variables
xsp = 0; // Horizontal speed
ysp = 0; // Vertical speed

// Check if the global score variable exists, and initialize it if not
if !variable_global_exists("score") {
    global.score = 0;
}

// Check if the global lives variable exists, and initialize it if not
// This prevents resetting lives every time the room starts
if !variable_global_exists("lives") {
    global.lives = 5;
}

// This flag indicates whether the game has ended
// Used to stop movement or drawing HUD after completion
gameEnded = false;

// Set up time limits for each room (in seconds)
// Each element in the array represents a room's allowed time
roomTimes = [30, 30, 25, 20, 20, 15];

// Choose the appropriate time for the current room
if (room < array_length(roomTimes)) {
    startTime = roomTimes[room]; // Get the matching time from the array
} else {
    startTime = 30; // Default time if the room index is beyond the array
}

// Initialize the countdown timer
timeRemaining = startTime;

// Store the current timestamp (used to calculate time passed)
startFrame = current_time;

// Initialize the invincibility cooldown timer after taking damage
// Prevents losing multiple lives instantly
hitDelay = 1;

// Reset the game ended flag to false (just to be sure)
gameEnded = false;

// Timer used when the game ends, to wait a few seconds before returning to the menu
endTimer = 0;
