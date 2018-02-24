extends KinematicBody

var speed=600
var direction=Vector3()
var gravity = -9.8
var velocity = Vector3()
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	direction=Vector3(0,0,0)
	if Input.is_action_pressed("ui_left"):
		direction.z+=1;
	if Input.is_action_pressed("ui_right"):
		direction.z-=1;
	if Input.is_action_pressed("ui_up"):
		direction.x-=1;
	if Input.is_action_pressed("ui_down"):
		direction.x+=1;
	direction=direction.normalized()
	direction=direction*speed*delta
	
	if velocity.y>0:
		gravity=-20
	else:
		gravity=-30
	
	
	velocity.y+= gravity*delta
	velocity.x=direction.x
	velocity.z=direction.z
	
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y=10

