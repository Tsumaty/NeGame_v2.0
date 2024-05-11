/// @desc включение анимации текста и проигрывание звука
if (msgTimer <= -1)
    exit;

if (msgTimer > 0)
{
    --msgTimer;
}
else
{
    msgAnimPos = 0;
    //playAnimForwards = true;
    playMsgAnim = 1;
    chatNum = playSound(chatName, chatNum, chatMaxNum);
    msgTimer = -1;
}