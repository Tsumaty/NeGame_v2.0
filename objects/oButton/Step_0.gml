if (playAnim != 0)
{
    visible = true;
    scalex = animcurve_channel_evaluate(animCurve, animPos);
    scaley = scalex;
    
    if (playAnim == 1)
    {
        animPos += animSpeed;
        if (animPos > 1)
        {
            animPos = 1;
            playAnim = false;
        }
    }
    else
    {
        animPos -= animSpeed;
        if (animPos < 0)
        {
            animPos = 0;
            playAnim = 0;
            visible = false;
        }
    }
}