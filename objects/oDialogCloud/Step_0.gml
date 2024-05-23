/// @desc анимации
if (playAnim != 0)
{
    visible = true;
    scalex = animcurve_channel_evaluate(animCurve, animPos);
    scaley = scalex;
    if (!isLookingRight) scalex *= -1;
    
    if (playAnim == 1)
    {
        animPos += animSpeed;
        if (animPos > 1)
        {
            animPos = 1;
            playAnim = 0; 
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
            if (endChatEvent == EndChatEvents.DestroyChatCloud)
                instance_destroy();
        }
    }
}

if (playMsgAnim != 0)
{
    msgVisible = true;
    msgScalex = animcurve_channel_evaluate(msgAnimCurve, msgAnimPos);
    msgScaley = msgScalex;
    //if (!isLookingRight) msgx = bbox_left + (bbox_left - bbox_right) / 2 + 30;
    
    if (playMsgAnim == 1)
    {
        msgAnimPos += msgAnimSpeed;
        if (msgAnimPos > 1)
        {
            msgAnimPos = 1;
            playMsgAnim = 0;
        }
    }
    else
    {
        msgAnimPos -= msgAnimSpeed;
        if (msgAnimPos < 0)
        {
            msgAnimPos = 0;
            playMsgAnim = 0;
            msgVisible = false;
        }
    }
}