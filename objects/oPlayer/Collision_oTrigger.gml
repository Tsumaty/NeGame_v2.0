/// @desc переход на следующий уровень
var newX = other.nextX;
if (other.nextXRelative) newX += x;
var newY = other.nextY;
if (other.nextYRelative) newY += y;
moveToNextLevel(other.nextLevel, newX, newY);
if (other.id == inst_portal_level2_menu && array_index(unlockedLevels, 2) == -1)
    array_push(unlockedLevels, 2);