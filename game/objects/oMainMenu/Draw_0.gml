// Make sure this code only runs in the main menu room
if (room != rmMainMenu) {
    exit; // Exit the draw event if we're not in the main menu
}

// Use a larger font for menu items
draw_set_font(fnt_24); // Ensure this font (fnt_24) is created and available in your project
draw_set_halign(fa_center);   // Center-align text horizontally
draw_set_valign(fa_middle);   // Center-align text vertically

// Loop through menu options and draw them centered on screen
for (var i = 0; i < array_length(menu_options); i++) {
    
    // Highlight the currently selected menu item
    if (i == menu_index) {
        draw_set_colour(c_yellow); // Highlight color for selected option
    } else {
        draw_set_colour(c_white);  // Normal color for other options
    }

    // Draw each menu option vertically spaced in the center
    draw_text(room_width / 2, room_height / 2 + i * 50, menu_options[i]);
}
