/// @desc функция загрузки
function loadGame(fileName)
{
    with (oCreature)
    {
        initVars();
    }
    with (oPlayer)
    {
        initCamera();
        changeTeacherMsg();
    }
    
    var dataBuffer = buffer_load(fileName);
    if (dataBuffer != -1)
    {
    var dataString = buffer_read(dataBuffer, buffer_string);
    buffer_delete(dataBuffer);
    
    var data = json_parse(dataString);
    for (var i = 0; i < array_length(data); ++i) 
    {
        switch (data[i].obj)
        {
            case "oDoor":
                with (data[i].identNum)
                {
                    isOpen = data[i].open;
                    y = (isOpen) ? openPos : closedPos;
                    with (surface) y = (other.isOpen) ? openPos : closedPos;
                }
            break;
            
            case "oActivator":
                with (data[i].identNum)
                {
                    unlocked = data[i].available;
                }
            break;
            
            case "oMovingFloor":
                with (data[i].identNum)
                {
                    x = data[i].posX;
                    y = data[i].posY;
                    with (surface)
                    {
                        x += other.xprevious;
                        y += other.yprevious;
                    }
                    with (oPlayer)
                    {
                        if (x == playerStartX && y == playerStartY)
                        {
                            y = other.y - 28;
                            updateStartVars();
                        }
                    }
                    horsp = data[i].horSpeed;
                    versp = data[i].verSpeed;
                    maxhorsp = data[i].maxHorSpeed;
                    maxversp = data[i].maxVerSpeed;
                    movesCyclically = data[i].backwards;
                    alarm[0] = data[i].alarm0;
                    alarm[1] = data[i].alarm1;
                }
            break;
        }
    }
    }
    
    with (oPlayer)
    {
        if (place_meeting(x, y, oObstacle))
        {
            do {
                y -= 2;
            } until (!place_meeting(x, y, oObstacle));
        }
    }
}