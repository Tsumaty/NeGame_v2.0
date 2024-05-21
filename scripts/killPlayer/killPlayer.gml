/// @desc функция убийства игрока
function killPlayer()
{
    deathNum = playSound(deathName, deathNum, deathMaxNum);
    initVars();
    chatChar = noone;
    increasedJumpsNum = increasedJumpsNumstart;
}