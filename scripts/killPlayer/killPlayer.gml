/// @desc функция убийства игрока (не исп-ся)
function killPlayer()
{
    with (oPlayer)
    {
        deathNum = playSound(deathName, deathNum, deathMaxNum);
        room_restart();
        break; // если игроков оказалось два и более
    }
}