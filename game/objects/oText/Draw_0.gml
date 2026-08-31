// Draw Event

// Set the font and visual appearance
draw_set_font(fnt_12);         // Use font named fnt_12 (make sure it's added in the assets)
draw_set_colour(c_white);      // White text color
draw_set_alpha(1);             // Full opacity

// Coordinates to center the text horizontally and position it close to the top
var centerX = room_width / 2;  // Horizontal center of the room
var startY = 10;               // Y position near the top edge
var lineHeight = 18;           // Vertical spacing between lines

// Short instruction messages to display
var lines = [
    "Training Stage",
    "Move: Arrow Keys",
    "Jump: UP Arrow",
    "Avoid Spikes",
    "Collect Coins"
];

// Draw each instruction line centered horizontally
for (var i = 0; i < array_length(lines); i++) {
    var textWidth = string_width(lines[i]); // Get the width of the current text
    draw_text(centerX - textWidth / 2, startY + (i * lineHeight), lines[i]);
}
