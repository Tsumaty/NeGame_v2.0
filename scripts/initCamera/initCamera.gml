/// @desc функция инициализации камеры
// (вызывается игроком)
function initCamera()
{
    // устанавливаем границы и скорость наблюдения за игроком
    var mainCamera = view_get_camera(0);
    camera_set_view_border(mainCamera, camera_get_view_width(mainCamera) / 2 * 0.97,
                           camera_get_view_height(mainCamera) / 2 * 0.95);
    camera_set_view_speed(mainCamera, 600 / FPS, 600 / FPS);
    view_enabled = true;
    view_visible[0] = true;
    camera_set_view_target(mainCamera, spriteCenter);
}