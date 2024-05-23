/// @desc движение
jumped = false;

// проверка опоры stand под ногами
var colBottom = function(stand)
{
    return collision_ellipse(bbox_left + 1, bbox_bottom - (bbox_bottom - bbox_top) / 5 + 2,
                             bbox_right - 1, bbox_bottom + 2, stand, true, true);
}

// движущаяся платформа
var movingPlatf = colBottom(oMovingFloor);

// стоит ли на движущейся платформе
onMovingPlatform = (movingPlatf && versp >= movingPlatf.vspeed);

// скорости движущейся платформы
platfHorsp = (onMovingPlatform) ? movingPlatf.hspeed : 0;
platfVersp = (onMovingPlatform) ? movingPlatf.vspeed : 0;

// движение
if (moveRight)
{
    horsp = min(maxsp + platfHorsp, horsp + accelRate);
    moveRight = false;
}
if (moveLeft)
{
    horsp = max(-maxsp + platfHorsp, horsp - accelRate);
    moveLeft = false;
}

// столкновение с полом или потолком
if (place_meeting(x, y + versp, oObstacle) || (colBottom(oPlatform) && versp > platfVersp))
{
    // при высокой скорости воспроизводится звук падения
    if (versp >= 780 / FPS)
        groundNum = playSound(groundName, groundNum, groundMaxNum);
    /*
    if (place_empty(x, y + platfVersp, oObstacle))
        versp = platfVersp;
    else
        versp = 0;
    */
    versp = platfVersp;
}

// столкновение со стеной
if (place_meeting(x + horsp, y, oObstacle))
{
    var slowedhorsp = platfHorsp;
    if (horsp > platfHorsp)
        slowedhorsp = max(platfHorsp, horsp - decelRate);
    else if (horsp < platfHorsp)
        slowedhorsp = min(platfHorsp, horsp + decelRate);
    var uppedversp = max(-liftMaxSpeed, versp - liftSpeed);
    // если можно подняться
    if (slowedhorsp != 0 && uppedversp != 0 && place_empty(x + slowedhorsp, y + uppedversp, oObstacle))
    {
        // замедляемся и поднимаемся
        horsp = slowedhorsp;
        versp = uppedversp;
    }
    else
    {
        horsp = platfHorsp;
    }
    /*
    // если можно подняться
    if (place_empty(x + horsp, y - liftMaxHeight, oObstacle))
    {
        // поднимаемся и замедляемся
        //versp = max(-liftMaxSpeed, versp - liftSpeed);
        if (horsp > platfHorsp)
            horsp = max(platfHorsp, horsp - decelRate);
        else if (horsp < platfHorsp)
            horsp = min(platfHorsp, horsp + decelRate);
    }
    else
    {
        if (place_empty(x + platfHorsp, y, oObstacle))
            horsp = platfHorsp;
        else
            horsp = 0;
    }
    */
}

// что под ногами
stand = colBottom(oStand); // любая опора

// прыжок
if (doJump)
{
    var char = colBottom(oCharacter); // персонаж
    var bounceChar = (canBounce && char != noone && char.bounceable); // можно ли отпрыгнуть
    if (stand || bounceChar)
    {
        // если оттолкнулся от перса
        if (bounceChar && !stand)
        {
            // воспроизводим звук отскока
            bounceNum = playSound(bounceName, bounceNum, bounceMaxNum);
            // корректируем силу прыжка
            versp = char.platfVersp - jumpForce;
        }
        else
        {
            versp = platfVersp - jumpForce;
        }
        doJump = false;
        jumped = true;
    }
}

// векторный толчок
move_and_collide(horsp, versp, oObstacle, 2, 0, 0, maxsp + abs(platfHorsp), MAXMOVESP);

// падение
versp += GRAVITACCEL;

// трение
if (horsp > platfHorsp)
{
    var frict = (stand == noone) ? WINDAGE : stand.frictForce;
    horsp = max(platfHorsp, horsp - frict);
}
else if (horsp < platfHorsp)
{
    var frict = (stand == noone) ? WINDAGE : stand.frictForce;
    horsp = min(platfHorsp, horsp + frict);
}