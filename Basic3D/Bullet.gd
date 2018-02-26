extends KinematicBody

# values for direction: 1 = +x, 2 = -x, 3 = +z, 4 = -z
var direction = 0
var velocity = 5
var positionOrigin

func _ready():
	positionOrigin = global_transform.origin;

func _process(delta):
	# updates position as long as the direction values are correct
	if(direction > 0 && direction < 5):
		var newPos = 0
	
		match direction:
			1:
				newPos = global_transform.origin.x
			2:
				newPos = global_transform.origin.x
			3:
				newPos = global_transform.origin.z
			4:
				newPos = global_transform.origin.z
		newPos += delta * velocity
		newPos = lerp(global_transform.origin.z, newPos , 1)
	
		if direction < 2:
			self.global_transform.origin.x = newPos 
		else:
			self.global_transform.origin.z = newPos

func passVelocity(dir):
	direction = dir

func passPos(pos):
	positionOrigin = pos