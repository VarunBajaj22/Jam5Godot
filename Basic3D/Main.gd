extends Spatial

# class member variables go here, for example:
# var a = 2

# var b = "textvar"
var player_id

func _ready():
	# finds and stores the player id to later test for collision-based physics
	var player = find_node_by_name(get_tree().get_root(), "Player")
	player_id = player.get_instance_id()
	if(player_id): print("Player id: ", player_id)


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()

func fire( body, nodeName, bulletName ):
	print("Firing")
	var bullet = find_node_by_name(get_tree().get_root(), bulletName)
	var area = find_node_by_name(get_tree().get_root(), nodeName)
	#bullet.apply_impulse()

func _on_Area2_body_entered( body ):
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