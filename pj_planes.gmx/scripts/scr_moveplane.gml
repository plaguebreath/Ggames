/// Local Variables
right = keyboard_check(ord('D'))
left =  keyboard_check(ord('A'))
up = keyboard_check(ord('W'))
down = keyboard_check(ord('S'))
fire = keyboard_check(vk_space)

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
    if (obj_plane.speed + facceleration < speedplanemax){ 
      motion_add(obj_plane.direction, facceleration);
    }else{
      obj_plane.speed = speedplanemax;
    }
  }
  if (left){
    //if (obj_plane.speed - speedfactorinc >= speedplanemin)
    //{
    //  obj_plane.speed -= speedfactorinc;
    //}
    if (obj_plane.speed > 1) motion_add(obj_plane.direction, -1 * (facceleration / 2))
  }
  if (up){ 
    if (isplanelanded){
      if (obj_plane.speed > takeoffspeed)
      {
        obj_plane.direction += turnfactor ;
        isplanelanded = false;
      } 
    }
    else{
      obj_plane.direction += turnfactor ;   
    }   
    sprite_index = sp_fokkerup;
  }
  if ((down) && !(isplanelanded)){ 
    obj_plane.direction -= turnfactor ;
    sprite_index = sp_fokkerdown;
  }
  
  if (fire) {
    timeCurrent = current_time; 
    if (timeCurrent - timeInit >= interval) { 
      with (instance_create(x +hspeed +20 , y + vspeed, obj_bullet)) {
        direction = obj_plane.direction;
        speed = 20;
      }     
    timeInit = timeCurrent; // update the time to compare to
    }
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
