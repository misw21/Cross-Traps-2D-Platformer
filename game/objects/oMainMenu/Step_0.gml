// Navigate down through menu options
if (keyboard_check_pressed(vk_down)) {
    // Increase the index, loop back to 0 if it goes past the end
    menu_index = (menu_index + 1) mod array_length(menu_options);
}

// Navigate up through menu options
if (keyboard_check_pressed(vk_up)) {
    // Decrease the index, wrap around if it goes below 0
    menu_index = (menu_index - 1 + array_length(menu_options)) mod array_length(menu_options);
}

// Execute the selected menu option when Enter is pressed
if (keyboard_check_pressed(vk_enter)) {
    switch (menu_index) {
        case 0:
            room_goto(Room1); // Go to the first gameplay room (change Room1 to your actual level)
            break;
        case 1:
            game_end(); // Exit the game
            break;
    }
}
