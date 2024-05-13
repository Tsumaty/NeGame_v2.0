event_inherited();

// максимальные скорости
maxhorsp /= FPS;
maxversp /= FPS;
// текущие скорости
horsp /= FPS;
versp /= FPS;
// скорости ускорения
horAccelRate *= maxhorsp;
verAccelRate *= maxversp;

canChangeDir = true; // может ли менять направление
canChangeDirTime *= FPS; // время перед восстановления возможности смены направления
changeDirPeriod *= FPS; // время проверки смены направления
alarm[0] = changeDirPeriod;