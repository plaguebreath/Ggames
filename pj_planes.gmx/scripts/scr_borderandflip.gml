 var idplane;
 idplane = argument0;
   
 // Check for plane outside the borders of the room
 if idplane.x  > room_width + idplane.sprite_width || idplane.x  < -1 * idplane.sprite_width{
   //X borders bounce on opposite direction
   idplane.direction = 180 - idplane.direction;
   
  // Take care of the flip of image based on the direction
 if (idplane.direction >= 90 && idplane.direction <= 270){
   idplane.image_yscale = -1 * idplane.standardspriteyscale;
 }else{
   idplane.image_yscale = idplane.standardspriteyscale;
 }
   idplane.isflipped = false;
   if ( idplane.x > room_width + idplane.sprite_width )
     idplane.isflipped = true;
     
 }
     


