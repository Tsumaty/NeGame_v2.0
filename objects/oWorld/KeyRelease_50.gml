with (oPlayer)
{
    var level = rLevel1;
    if (room_exists(level))
    {
        room_goto(level);
        x = 240;
        y = 4;
        horsp = 0;
        versp = 300 / FPS;
    }
}