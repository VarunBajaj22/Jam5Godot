extends KinematicBody

# values for direction: 0 = +x, 1 = -x, 2 = +z, 3 = -z
var direction = -1
var velocity = 15
var positionOrigin
var playerObj
var player_id

func _ready():
	positionOrigin = global_transform.origin;
	playerObj = get_node("../../../Player")
	print(playerObj)

func _process(delta):
	# updates position as long as the direction values are correct
	if(direction > -1 && direction < 5):
		var newPos = 0
		var dir = 1
		
		# Changes newPos variable based on direction it's going (+x, -x, +z, -z)
		match direction:
			0:
				newPos = global_transform.origin.x
			1:
				newPos = global_transform.origin.x
				dir = -1
			2:
				newPos = global_transform.origin.z
			3:
				newPos = global_transform.origin.z
				dir = -1
		
		# Sets what the new position should be based on time passed, speed, and direction of the bullet
		newPos += delta * velocity * dir
		
		# lerps the newPos value and sets the new position as either x or z values
		if direction < 2:
			newPos = lerp(global_transform.origin.x, newPos , 1)
			self.global_transform.origin.x = newPos
		else:
			newPos = lerp(global_transform.origin.z, newPos , 1)
			self.global_transform.origin.z = newPos
		
		# If the bullet has travelled a distance of 10, reset the position
		if (abs(positionOrigin.distance_to(self.global_transform.origin)) > 10):
			passDirection(0)

func passPlayer(play):
	player_id = play

func passDirection(dir):
	direction = dir
	self.global_transform.origin = positionOrigin

func passPos(pos):
	positionOrigin = pos

func _on_Area_body_entered( body ):
	var meta = body.get_instance_id()
	if meta == player_id:
		passDirection(0)
		playerObj.hit()