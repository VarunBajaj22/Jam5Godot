extends Spatial

var rotatingSpeed = 1
var player

func _ready():
	player = get_node("../")

func _process(delta):
	var direction = Vector3(0,0,0)
	var playerTransform = get_transform()
	var playerRotation = get_rotation() 
	var playerY = playerRotation.y
	var pressed = false

	##Player movements
	if Input.is_action_pressed("ui_camRight"): 
		playerRotation += Vector3(0,0,1) * rotatingSpeed * delta
		playerTransform.origin += playerTransform.basis[2] * rotatingSpeed * delta 
		pressed = true
	if Input.is_action_pressed("ui_camLeft"):  
		playerRotation += Vector3(0,0,-1) * rotatingSpeed * delta 
		playerTransform.origin += playerTransform.basis[2] * -rotatingSpeed * delta
		pressed = true
#	if Input.is_action_pressed("ui_up"): 
#		if rotation_degrees.y > 0 && rotation_degrees.y <= 90: 
#			direction.z += 1
#		if rotation_degrees.y >= 90 && rotation_degrees.y <= 180: 
#			direction.x += 1
#		if rotation_degrees.y >= -180 && rotation_degrees.y <= -90: 
#			direction.z -= 1
#		if rotation_degrees.y >= -90 && rotation_degrees.y <= 0: 
#			direction.x -= 1
#	if Input.is_action_pressed("ui_down"):
#		if rotation_degrees.y > 0 && rotation_degrees.y <= 90:
#			direction.z -= 1
#		if rotation_degrees.y >= 90 && rotation_degrees.y <= 180:
#			direction.x -= 1
#		if rotation_degrees.y >= -180 && rotation_degrees.y <= -90:
#			direction.z += 1
#		if rotation_degrees.y >= -90 && rotation_degrees.y <= 0:
#			direction.x += 1
	if(pressed):
		set_transform(playerTransform)
		set_rotation(playerRotation) 
		rotate(Vector3(0, 1, 0), playerY)
