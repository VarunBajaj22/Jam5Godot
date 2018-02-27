extends TextureProgress

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	value=value-(delta*2)
	if value < 30 :
		modulate.r=255
		modulate.g=0
		modulate.b=0
	else :
		modulate.r=0
		modulate.g=255
		modulate.b=0
	if value <= 0:
		get_tree().reload_current_scene()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
