extends Spatial

var player_id
var bullet
# values for direction: 0 = +x, 1 = -x, 2 = +z, 3 = -z
export var bulletDirection = 0

func _ready():
	# finds and stores the player id to later test for collision-based physics
	var player = find_node_by_name(get_tree().get_root(), "Player")
	player_id = player.get_instance_id()
	bullet = get_node("Bullet")
	bullet.passPlayer(player_id)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func fire( body, nodeName, bulletName ):
	bullet.passDirection(bulletDirection)

func _on_Area_body_entered( body ):
	var meta = body.get_instance_id()
	if meta == player_id:
		fire( body, "Area2", "Bullet2" )
		

# returns the first node found the the root and the name of the node
func find_node_by_name(root, name):
	if(root.get_name() == name): return root
	
	for child in root.get_children():
		if child.get_name() == name: return child
		
		var found = find_node_by_name(child, name)
		
		if found : return found
	return null