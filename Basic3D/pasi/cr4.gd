extends Spatial

# class member variables go here, for example:
var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass



func _on_Area_body_entered(body):
	if body.name=="Player":
		if a<3:
			$Area/MeshInstance.hide()
			$AudioStreamPlayer.play()
			$Area.hide();
			get_node("../../TextureProgress/timebar").value+=1
			$Area/CollisionShape.hide()
			a=5;