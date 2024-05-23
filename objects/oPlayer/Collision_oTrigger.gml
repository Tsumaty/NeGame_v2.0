/// @desc переход на следующий уровень
var newX = other.nextX;
if (other.nextXRelative) newX += x;
var newY = other.nextY;
if (other.nextYRelative) newY += y;
moveToNextLevel(other.nextLevel, newX, newY);