 var idplane;
 idplane = argument0;
   
 // Check for plane outside the borders of the room
 if idplane.x  > room_width + idplane.sprite_width || idplane.x  < 0-idplane.sprite_width{
   //X borders bounce on opposite direction
   idplane.direction = 180 - idplane.direction;
   isflipped = !isflipped;
 }
     
 // Take care of the flip of image based on the direction
 if (idplane.direction >= 90 && idplane.direction <= 270){
   idplane.image_yscale = -1 * idplane.standardallignsprite;
 }else{
   idplane.image_yscale = idplane.standardallignsprite;
 }

