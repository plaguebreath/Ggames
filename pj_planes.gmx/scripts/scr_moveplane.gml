/// Local Variables
right = keyboard_check(ord('D'))
left =  keyboard_check(ord('A'))
up = keyboard_check(ord('W'))
down = keyboard_check(ord('S'))
speedplanemax = 10
speedplanemin = 0
speedfactorinc = 0.1  //Inc or Dec velocity on LEFT /  RIGHT
turnfactor = 2 //Add or Sub angle when UP o DOWN

sprite_index = sp_fokker;
//obj_plane.image_index = 0;

/// Movement check
if keyboard_check(vk_anykey) 
{ 
  if (right) 
  { 
    if (obj_plane.speed + speedfactorinc <= speedplanemax) 
    {
      obj_plane.speed += speedfactorinc;
    }
  }
  if (left) 
  {
    if (obj_plane.speed - speedfactorinc >= speedplanemin)
    {
      obj_plane.speed -= speedfactorinc;
    }
  }
  if (up) 
  { 
    if (global.isplanelanded)
    {
      if (obj_plane.speed > 4)
      {
        obj_plane.direction += turnfactor ;
        global.isplanelanded = false;
      } 
    }
    else
    {
    obj_plane.direction += turnfactor ;   
    }   
    sprite_index = sp_fokkerup;
  }
  if ((down) && !(global.isplanelanded))
  { 
    obj_plane.direction -= turnfactor ;
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
