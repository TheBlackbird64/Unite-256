if tab_index(global.room_save, room_get_name(room)) == -1
{
	array_push(global.room_save, room_get_name(room))
	room_persistent = false
	room_goto(room)
}
else
{
	room_persistent = true
}