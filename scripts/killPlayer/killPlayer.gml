/// @desc функция убийства игрока
// (вызывается игроком)
function killPlayer()
{
    deathNum = playSound(deathName, deathNum, deathMaxNum);
    initVars();
    changeTeacherMsg();
}