var idplane;
idplane = argument0;

with (idplane){
  timeCurrentbullets = current_time; 
  timeCurrentbombs = current_time; 
  if (timeCurrentbullets - timeInitbullets >= timebeforereloadbullets) { 
    if (bullets + 10 < MAX_bullets){
      bullets += 10;  
    }else{
      bullets = MAX_bullets;
    }
    timeInitbullets = timeCurrentbullets; // update the time to compare to
  }
  
  if (timeCurrentbombs - timeInitbombs >= timebeforereloadbombs) { 
    if (bombs + 1 < MAX_bombs){
      bombs += 1;  
    }else{
      bombs = MAX_bombs;
    }
    timeInitbombs = timeCurrentbombs; // update the time to compare to
  }
  
  if (bullets == MAX_bullets && bombs == MAX_bombs) isreloading = false;
}
//idplane.direction = 0;      


