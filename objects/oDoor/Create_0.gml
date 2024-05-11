event_inherited();

activated = false;
openSpeed /= FPS; // скорость открытия/закрытия
openAccelRate *= openSpeed; // скорость ускорения
versp = 0; // текущая скорость
isOpening = !isOpen; // будет открываться или закрываться
/*
var openClosedPos = function()
{
    var openLength = self.bbox_bottom - self.bbox_top;
    self.openPos = (self.isOpen) ? self.y : self.y + openLength;
    self.closedPos = (self.isOpen) ? self.y - openLength : self.y;
}
*/
var openLength = bbox_bottom - bbox_top;
openPos = (isOpen) ? y : y + openLength;
closedPos = (isOpen) ? y - openLength : y;
with (surface)
{
    var openLength = bbox_bottom - bbox_top;
    openPos = (other.isOpen) ? y : y + openLength;
    closedPos = (other.isOpen) ? y - openLength : y;
}