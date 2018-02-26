extends Spatial

var player_id
var bullet
# values for direction: 1 = +x, 2 = -x, 3 = +z, 4 = -z
export var bulletDirection = 1

func _ready():
	# finds and stores the player id to later test for collision-based physics
	var player = find_node_by_name(get_tree().get_root(), "Player")
	player_id = player.get_instance_id()
	if(player_id): print("Player id: ", player_id)
	bullet = get_node("Bullet")
	print("Bullet", bullet)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func fire( body, nodeName, bulletName ):
	print("Firing")
	var area = find_node_by_name(get_tree().get_root(), nodeName)
	bullet.passVelocity(bulletDirection)

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