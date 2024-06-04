function startGrindingSound()
{
    if (!audio_is_playing(sndGrindingStart) && !audio_is_playing(sndGrindingLoop))
    {
        audio_play_sound(sndGrindingStart, 10, false);
        alarm[0] = 0.44 * FPS;
    }
}