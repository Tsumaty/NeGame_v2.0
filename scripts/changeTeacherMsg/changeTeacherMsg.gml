/// @desc функция изменения реплик учителя
// (вызывается игроком)
function changeTeacherMsg()
{
    with (inst_teacher1)
    {
        if (other.deathsNumLevelJumpTrain == 3)
        {
            chatCloud.msg = teacherMsgSet[3];
            other.endChatChar = id;
            other.endChatEvent = EndChatEvents.Talk;
        }
        else if (other.deathsNumLevelJumpTrain >= 2)
        {
            chatCloud.msg = teacherMsgSet[2];
            other.endChatChar = id;
            other.endChatEvent = EndChatEvents.IncreaseJumpForce;
        }
        else if (other.deathsNumLevelJumpTrain >= 1)
        {
            chatCloud.msg = teacherMsgSet[1];
            other.endChatChar = id;
            other.endChatEvent = EndChatEvents.CanBounce;
        }
        else
        {
            chatCloud.msg = teacherMsgSet[0];
            other.endChatChar = noone;
            other.endChatEvent = pointer_null;
        }
        hasChatted = false;
        with (buttonE) image_index = 0;
    }
}