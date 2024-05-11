/// @desc функция завершает проигрывание звуков открывания двери
// и проигрывает звук окончания этого действия
function stopGrindingSound()
{
    if (audio_is_playing(sndGrindingLoop) || audio_is_playing(sndGrindingStart))
    {
        audio_stop_sound(sndGrindingStart);
        audio_stop_sound(sndGrindingLoop);
        audio_play_sound(sndGrindingEnd, 1, false);
    }
}