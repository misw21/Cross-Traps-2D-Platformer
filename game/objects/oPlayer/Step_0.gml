// Apply gravity
ysp += 0.1; // Add vertical speed
xsp = 0;    // Reset horizontal speed every frame (to be set by key input)

// Horizontal movement input
if keyboard_check(vk_left) xsp = -1;   // Move left
if keyboard_check(vk_right) xsp = 1;   // Move right

// Jumping logic
if place_meeting(x, y + 1, oSolid) {   // Check if player is standing on a solid object
    ysp = 0;                           // Stop downward speed
    if keyboard_check(vk_up) ysp = -2; // Jump if up arrow is pressed
}

// Move with collision against solids
move_and_collide(xsp, ysp, oSolid);

// Timer system for room countdown
var elapsedTime = (current_time - startFrame) div 1000; // Time passed in seconds
timeRemaining = startTime - elapsedTime;                // Time left to finish level
if timeRemaining <= 0 {
    room_restart(); // Restart the level if time runs out
}

// Decrease hit cooldown timer
if (hitDelay > 0) {
    hitDelay -= 1; // Reduce invincibility after damage
}

// Collision with spikes (hazards) while not in cooldown
if (place_meeting(x, y, oSpike) && hitDelay <= 0) {
    // Subtract score
    global.score -= 5;
    if global.score < 0 global.score = 0;

    // Lose one life
    global.lives -= 1;

    // Activate invincibility for 1 second (60 frames if game runs at 60 FPS)
    hitDelay = 60;

    // If no lives left
    if global.lives <= 0 {
        // Go back to Room1 if in advanced rooms, otherwise to Room0
        if (room == Room3 || room == Room4 || room == Room5 || room == Room6 || room == Room7) {
            room_goto(Room2);
        } else {
            room_goto(Room1);
        }
    } else {
        // Respawn player at starting point instead of restarting the whole room
        if (object_exists(oStartPoint)) {
            var start = instance_find(oStartPoint, 0);
            if (instance_exists(start)) {
                x = start.x;
                y = start.y;
            }
        }
    }
}

// Collision with coin
if place_meeting(x, y, oCoin) {
    global.score += 20; // Add score
    instance_destroy(instance_place(x, y, oCoin)); // Remove coin from room
}

// Collision with flag (level goal)
if place_meeting(x, y, oFlag) {
    if room == Room7 {
        gameEnded = true; // Trigger end screen if it's the final level
    } else {
        room_goto_next(); // Go to the next room
    }
}

// Handle game end logic
if (gameEnded) {
    endTimer += 1; // Start counting frames after game ended
    
    // After 5 seconds (room_speed is frames per second), go to main menu
    if (endTimer >= room_speed * 5) {
        room_goto(rmMainMenu);
    }
}
