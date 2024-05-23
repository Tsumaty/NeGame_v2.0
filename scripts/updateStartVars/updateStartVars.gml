/// @desc функция обновления начальных переменных
// (вызывается любым существом)
function updateStartVars()
{
    hpstart = hp;
    xstart = x;
    ystart = y;
    horspstart = horsp;
    verspstart = versp;
    rightstart = isLookingRight;
    if (object_index == oPlayer)
    {
        increasedJumpsNumstart = increasedJumpsNum;
    }
}