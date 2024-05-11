if (room != rMenu && room_exists(rMenu))
{
    with (oPlayer)
    {
        hp = 10;
        x = 804;
        y = 16;
        horsp = 0;
        versp = 0;
        isLookingRight = true;
        increasedJumpsNum = 0;
        chatChar = noone;
    }
    room_goto(rMenu);
}
else
{
    game_end();
}