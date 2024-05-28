/// @desc функция проверяет опору stand под ногами
/// @param {Id.Instance | Asset.GMObject} stand объект для проверки
/// @return {Id.Instance} возвращает id опоры
function colBottom(stand)
{
    return collision_ellipse(bbox_left + 1, bbox_bottom - 5,
                             bbox_right - 1, bbox_bottom + 2, stand, true, true);
}