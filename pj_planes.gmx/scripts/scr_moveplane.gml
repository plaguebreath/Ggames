/// Variables
right = keyboard_check(ord('D'))
left =  keyboard_check(ord('A'))
up = keyboard_check(ord('W'))
down = keyboard_check(ord('X'))

speedplane = 0

/// Movement

if (right) { hspeed += 0.2
    image_speed = 0.1
};
if (left) hspeed -= 0.2;

show_debug_message("Total = " + string(hspeed));

