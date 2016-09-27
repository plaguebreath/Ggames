/// Variables
right = keyboard_check(ord('D'))
left =  keyboard_check(ord('A'))
up = keyboard_check(ord('W'))
down = keyboard_check(ord('S'))
iskeypressed = false
speedplanemax = 8
speedplanemin = 0
speedfactorinc = 0.1
turnfactor = 2
///

/// Movement
if (right) { 
 if (obj_plane.speed + speedfactorinc <= speedplanemax){
  obj_plane.speed += speedfactorinc
 }
 iskeypressed = true
}
if (left) {
 if (obj_plane.speed - speedfactorinc >= speedplanemin){
  obj_plane.speed -= speedfactorinc
 }
 iskeypressed = true
}
if (up){ 
 obj_plane.direction += turnfactor ;
 iskeypressed = true
}

if (down){ 
 obj_plane.direction -= turnfactor ;
 iskeypressed = true
}

obj_plane.image_angle = obj_plane.direction;

if (obj_plane.speed == 0) obj_plane.image_index = 0;
///

/// Debug Stuff
if (iskeypressed){
  show_debug_message("Speed = " + string(abs(obj_plane.speed)));
}
