event_inherited();

activated = false;
openSpeed /= FPS; // скорость открытия/закрытия
openAccelRate *= openSpeed; // скорость ускорения
versp = 0; // текущая скорость
isOpening = !isOpen; // будет открываться или закрываться

var openLength = bbox_bottom - bbox_top;
openPos = (isOpen) ? y : y + openLength;
closedPos = (isOpen) ? y - openLength : y;
with (surface)
{
    var surfaceOpenLength = bbox_bottom - bbox_top;
    openPos = (other.isOpen) ? y : y + surfaceOpenLength;
    closedPos = (other.isOpen) ? y - surfaceOpenLength : y;
}