extends KinematicBody

var speed = 700
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3()
var playerTransform
var playerRotation
var rotatingSpeed = 10 


func _ready():
	add_to_group("Player", true);
	set_process(true)

func _physics_process(delta):
	direction = Vector3(0,0,0)
	playerTransform = get_transform()
	playerRotation = get_rotation() 
	
	##Player movements
	if Input.is_action_pressed("ui_right"): 
		playerRotation += Vector3(0,-1,0) * rotatingSpeed * delta
		playerTransform.origin += playerTransform.basis[2] * -rotatingSpeed * delta 
	if Input.is_action_pressed("ui_left"):  
		playerRotation += Vector3(0,1,0) * rotatingSpeed * delta 
		playerTransform.origin += playerTransform.basis[2] * rotatingSpeed * delta  
	if Input.is_action_pressed("ui_up"): 
		if rotation_degrees.y > 0 && rotation_degrees.y <= 90: 
			direction.z += 1
		if rotation_degrees.y >= 90 && rotation_degrees.y <= 180: 
			direction.x += 1
		if rotation_degrees.y >= -180 && rotation_degrees.y <= -90: 
			direction.z -= 1
		if rotation_degrees.y >= -90 && rotation_degrees.y <= 0: 
			direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		if rotation_degrees.y > 0 && rotation_degrees.y <= 90:
			direction.z -= 1
		if rotation_degrees.y >= 90 && rotation_degrees.y <= 180:
			direction.x -= 1
		if rotation_degrees.y >= -180 && rotation_degrees.y <= -90:
			direction.z += 1
		if rotation_degrees.y >= -90 && rotation_degrees.y <= 0:
			direction.x += 1
	set_transform(playerTransform)
	set_rotation(playerRotation) 
		
	direction = direction.normalized()
	direction = direction*speed*delta
	
	if velocity.y > 0:
		gravity =- 20
	else:
		gravity =- 30
	
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
		
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y = 10

 