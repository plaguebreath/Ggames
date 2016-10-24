var objid;
objid = argument0;
 
with (objid){
  //if (isflipped) image_angle = -1*image_angle 
  image_yscale = standardspriteyscale;
  direction = 0;
  //y = obj_runway.y - (sprite_height*image_yscale) + 10;
  y = obj_runway.y + 1 - (sprite_height*image_yscale) / 2 ;
  //y = obj_runway.y - image_yscale  -((sprite_height/ 2)*image_yscale) ;
  //y = obj_runway.y  - (sprite_get_height(mask_index) * image_yscale);
  x = obj_runway.x + 30;
  //show_debug_message((sprite_get_height(mask_index) * image_yscale))
  speed = 0;
  vspeed = 0;
  isplanetakeoff = true;
  isflipped = false;
  enginestarted = false;
  soundexplosionplayed = false;
}
