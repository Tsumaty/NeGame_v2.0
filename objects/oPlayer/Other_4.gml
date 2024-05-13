if (place_meeting(x, y, oObstacle))
{
    do {
        y -= 2;
    } until (!place_meeting(x, y, oObstacle));
}