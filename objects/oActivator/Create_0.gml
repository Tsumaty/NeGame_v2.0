activated = false;
prevActivated = false; // предыдущее состояние активации
colPlayerPeriod *= FPS; // период проверки на столкн-е с игроком
alarm[0] = colPlayerPeriod;
with (device)
    unlocked = other.unlocked;