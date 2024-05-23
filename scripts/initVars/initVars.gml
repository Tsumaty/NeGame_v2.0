/// @desc функция перевода переменных в начальное состояние
// (вызывается любым существом)
function initVars()
{
    hp = hpstart;
    x = xstart;
    y = ystart;
    horsp = horspstart;
    versp = verspstart;
    isLookingRight = rightstart;
    if (object_index == oPlayer)
    {
        chatChar = noone;
        chatCloud = noone;
        increasedJumpsNum = increasedJumpsNumstart;
    }
}