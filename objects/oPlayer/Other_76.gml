/// @desc звуки шагов
if (event_data[? "event_type"] == "sprite event")
{
    switch (event_data[? "message"])
    {
        case "stomp":
            if (stand != noone || place_meeting(x, y + 8, oObstacle))
                stompNum = playSound(stompName, stompNum, stompMaxNum);
        break;
    }
}