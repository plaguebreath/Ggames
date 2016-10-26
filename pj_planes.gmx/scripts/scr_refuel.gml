var idplane;
idplane = argument0;

with (idplane){
  // update time to compare
  timeCurrentbullets = current_time; 
  timeCurrentbombs = current_time; 
  timeCurrentrefuel = current_time;
  
  //reload MG
  if (timeCurrentbullets - timeInitbullets >= timebeforereloadbullets) { 
    if (bullets < MAX_bullets){
      bullets += 10;
      audio_play_sound_on(em_player, snd_reloadmg, false, 1);        
    }else{
      bullets = MAX_bullets;
    }
    timeInitbullets = timeCurrentbullets; // update the time to compare to
  }
  //reload BOMB
  if (timeCurrentbombs - timeInitbombs >= timebeforereloadbombs) { 
    if (bombs < MAX_bombs){
      bombs += 1;
       audio_play_sound_on(em_player, snd_reloadbomb, false, 1);   
    }else{
      bombs = MAX_bombs;
    }
    timeInitbombs = timeCurrentbombs; // update the time to compare to
  }
  
   //reload Fuel
  if (timeCurrentrefuel - timeInitrefuel >= timebeforerefuel) { 
    if (planefuel  < MAX_planefuel){
      planefuel += 10;
      if !(audio_is_playing(snd_refuel)) audio_play_sound_on(em_player, snd_refuel, false, 1);   
    }else{
      planefuel = MAX_planefuel;
    }
    timeInitrefuel = timeCurrentrefuel; // update the time to compare to
  }
  //if all reload done set isreload as false
  if (bullets == MAX_bullets && bombs == MAX_bombs && planefuel == MAX_planefuel ) isreloading = false;
}


