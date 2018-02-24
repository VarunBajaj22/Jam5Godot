extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"



func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()


	
