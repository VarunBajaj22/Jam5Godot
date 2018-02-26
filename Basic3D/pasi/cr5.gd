extends Spatial
# class member variables go here, for example:
var a = Vector3();
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var sha=get_rotation();
	sha.y+=0.05
	set_rotation(sha);

	
	

 