extends Spatial

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()