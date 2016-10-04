/// Local Variables
right = keyboard_check(ord('D'));
left =  keyboard_check(ord('A'));
up = keyboard_check(ord('W'));
down = keyboard_check(ord('S'));
firemg = keyboard_check(vk_space);
firebomb = keyboard_check(vk_enter);

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
    if (isplanelanded){
      if (speed == 0){
        enginestarted = true;
      }
      if (speed <= 1) {
        motion_add(obj_plane.direction, facceleration/10);
      }else{ 
        motion_add(obj_plane.direction, facceleration/2);
      }        
    }else{
      if (obj_plane.speed + facceleration < speedplanemax){ 
        motion_add(obj_plane.direction, facceleration);
      }else{
        obj_plane.speed = speedplanemax;
      }
    }
  }
  if (left){
    //if (obj_plane.speed - speedfactorinc >= speedplanemin)
    //{
    //  obj_plane.speed -= speedfactorinc;
    //}
    if (isplanelanded){ 
      if (obj_plane.speed <= takeoffspeed && obj_plane.speed - facceleration > 0) motion_add(obj_plane.direction, -1 * (facceleration))
    }else{
      if (obj_plane.speed > 1) motion_add(obj_plane.direction, -1 * (facceleration / 2))
    }
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
  if (down && !isplanelanded){ 
    obj_plane.direction -= turnfactor ;
    sprite_index = sp_fokkerdown;
  }
  
  if (firemg && !isplanelanded && obj_plane.bullets > 0) {
    timeCurrentmg = current_time; 
    if (timeCurrentmg - timeInitmg >= fireintervalmg) { 
      with (instance_create(x+lengthdir_x(offsetlenmg,direction),y+lengthdir_y(offsetlenmg,direction) -5, obj_bullet)) {    
        direction = obj_plane.direction;
        image_angle =  direction;
        speed = bulletspeed;
        obj_plane.bullets -= 1;   
        if !audio_is_playing(snd_mg){
          audio_play_sound(snd_mg,5,false);
        }
      }     
    timeInitmg = timeCurrentmg; // update the time to compare to
    }
  }
  
  if (firebomb && !isplanelanded && obj_plane.bombs > 0) {
    timeCurrentbomb = current_time; 
    if (timeCurrentbomb - timeInitbomb >= fireintervalbomb) { 
      //with (instance_create(x+lengthdir_x(offsetlenbomb,direction),y+lengthdir_y(offsetlenbomb,direction) , obj_bomb)) {         
      with (instance_create(x+lengthdir_x(offsetlenbomb,direction),y+lengthdir_y(offsetlenbomb,direction) +25 , obj_bomb)) {
        direction = obj_plane.direction;
        image_angle =  direction;       
        speed = obj_plane.speed; 
        obj_plane.bombs -= 1;   
      }     
    timeInitbomb = timeCurrentbomb; // update the time to compare to
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
