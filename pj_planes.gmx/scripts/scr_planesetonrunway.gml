var objid;
objid = argument0;
 
with (objid){ 
  direction = 0;
  y = obj_runway.y - (sprite_height*image_yscale) + 10;
  x = obj_runway.x + 30;
  speed = 0;
  vspeed = 0;
  isflipped = false;
  enginestarted = false;
  soundexplosionplayed = false;
}