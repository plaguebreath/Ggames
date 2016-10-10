var idplane;
idplane = argument0;

with (idplane){
  timeCurrentbullets = current_time; 
  timeCurrentbombs = current_time; 
  if (timeCurrentbullets - timeInitbullets >= timebeforereloadbullets) { 
    if (bullets + 10 < MAX_bullets){
      bullets += 10;
      //if !audio_is_playing(snd_reloadmg){
           audio_play_sound_on(em_player, snd_reloadmg, false, 1); 
      // }           
    }else{
      bullets = MAX_bullets;
      //audio_play_sound_on(em_player, snd_reloadmg, false, 1); 
    }
    timeInitbullets = timeCurrentbullets; // update the time to compare to
  }
  
  if (timeCurrentbombs - timeInitbombs >= timebeforereloadbombs) { 
    if (bombs  < MAX_bombs){
      bombs += 1;
       audio_play_sound_on(em_player, snd_reloadbomb, false, 1);   
    }else{
      bombs = MAX_bombs;
      //audio_play_sound_on(em_player, snd_reloadbomb, false, 1); 
    }
    timeInitbombs = timeCurrentbombs; // update the time to compare to
  }
  
  if (bullets == MAX_bullets && bombs == MAX_bombs) isreloading = false;
}
//idplane.direction = 0;      


