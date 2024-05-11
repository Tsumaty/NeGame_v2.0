with (oPlayer)
{
    var level = rTest;
    if (room_exists(level))
    {
        room_goto(level);
        x = 416;
        y = 4;
        horsp = 0;
        versp = 300 / FPS;
    }
}