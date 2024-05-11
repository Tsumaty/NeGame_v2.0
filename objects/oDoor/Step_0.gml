if (activated)
{
    var startGrindingSound = function()
    {
        if (!audio_is_playing(sndGrindingStart) && !audio_is_playing(sndGrindingLoop))
        {
            audio_play_sound(sndGrindingStart, 10, false);
            self.alarm[0] = 0.44 * FPS;
        } 
    }
    if (isOpening)
    {
        if (y < openPos)
        {
            versp = min(openSpeed, versp + openAccelRate);
            startGrindingSound();
        }
        else
        {
            activated = false;
            isOpening = false;
            stopGrindingSound();
            with (surface) y = openPos;//other.surfaceOpenPos;
            isOpen = true;
        }
    }
    else
    {
        with (surface) y = closedPos;//other.surfaceClosedPos;
        if (y > closedPos)
        {
            versp = max(-openSpeed, versp - openAccelRate);
            startGrindingSound();
        }
        else
        {
            activated = false;
            isOpening = true;
            stopGrindingSound();
            isOpen = false;
            if (place_meeting(x, y, oPlayer))
            {
                with (oPlayer)
                {
                    deathNum = playSound(deathName, deathNum, deathMaxNum);
                    initVars();
                }
            }
        }
    }
}

vspeed = versp;

if (versp > 0)
    versp = max(0, versp - openAccelRate);
else if (versp < 0)
    versp = min(0, versp + openAccelRate);