if (activated)
{
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
            with (instance_place(x, y, oPlayer)) killPlayer();
        }
    }
}

vspeed = versp;

if (versp > 0)
    versp = max(0, versp - openAccelRate);
else if (versp < 0)
    versp = min(0, versp + openAccelRate);