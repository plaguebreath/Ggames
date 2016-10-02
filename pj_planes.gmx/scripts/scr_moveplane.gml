/// Local Variables
right = keyboard_check(ord('D'))
left =  keyboard_check(ord('A'))
up = keyboard_check(ord('W'))
down = keyboard_check(ord('S'))

sprite_index = sp_fokker;
//obj_plane.image_index = 0;

/// Movement check
if keyboard_check(vk_anykey) 
{ 
  if (right){ 
    //if (obj_plane.speed + speedfactorinc <= speedplanemax) 
    //{
    //  obj_plane.speed += speedfactorinc;
    //}
    if (obj_plane.speed + global.facceleration < global.speedplanemax){ 
      motion_add(obj_plane.direction, global.facceleration);
    }else{
      obj_plane.speed = global.speedplanemax;
    }
  }
  if (left){
    //if (obj_plane.speed - speedfactorinc >= speedplanemin)
    //{
    //  obj_plane.speed -= speedfactorinc;
    //}
    if (obj_plane.speed > 1) motion_add(obj_plane.direction, -1 * (global.facceleration / 2))
  }
  if (up){ 
    if (global.isplanelanded){
      if (obj_plane.speed > global.takeoffspeed)
      {
        obj_plane.direction += global.turnfactor ;
        global.isplanelanded = false;
      } 
    }
    else{
      obj_plane.direction += global.turnfactor ;   
    }   
    sprite_index = sp_fokkerup;
  }
  if ((down) && !(global.isplanelanded)){ 
    obj_plane.direction -= global.turnfactor ;
    sprite_index = sp_fokkerdown;
  }
}

// Assign sprite rotation direction same as object direction
obj_plane.image_angle = obj_plane.direction;

//Check sprite animation based on speed of object
//if (obj_plane.speed == 0)
//{ 
//  obj_plane.image_index = 0;
//}
//else if (obj_plane.speed <= 3)
//{
//  obj_plane.image_speed = 0.5;
//}
//else if (obj_plane.speed <= 8)
//{
//  obj_plane.image_speed = 1;
//}
//else obj_plane.image_speed = 1.5;
/// Debug Stuff
//show_debug_message("Speed = " + string(abs(obj_plane.speed)));
