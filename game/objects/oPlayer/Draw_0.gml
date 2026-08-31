// Don't draw the HUD if the game has ended (only show Final Score at the top)
if (gameEnded) {
    draw_set_font(fnt_12);            // Set the font
    draw_set_colour(c_red);           // Set text color to red
    draw_set_halign(fa_center);       // Horizontally center the text
    draw_set_valign(fa_top);          // Align text from the top

    // Display Final Score at the top-center of the screen
    draw_text(room_width / 2, 10, "Final Score: " + string(global.score));

    exit; // Stop drawing the rest of the HUD
}

// Draw the player sprite
draw_self();

// HUD appearance settings
draw_set_font(fnt_12);        // Set font for HUD
draw_set_colour(c_white);     // White text
draw_set_alpha(1);            // Full opacity

// Draw HUD data on the top-left of the screen
draw_text(24, 5, "Score: " + string(global.score));        // Show current score
draw_text(24, 22, "Time: " + string(timeRemaining));       // Show remaining time
draw_text(24, 39, "Lives: " + string(global.lives));       // Show remaining lives
