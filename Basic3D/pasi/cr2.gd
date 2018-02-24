extends KinematicBody

# class member variables go here, for example:
var a = Vector3(0,0,0)
var b
# var b = "textvar"

func _ready():
	b = get_node(".")
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
 a*=0.98
 if Input.is_action_pressed("ui_left"):
    if a.x>-5:
	    a.x-=0.5;
 if Input.is_action_pressed("ui_right"):
	 if a.x<5:
	    a.x+=0.5;
 if Input.is_action_pressed("ui_up"):
     if a.z>-5:
	     a.z-=0.5;
 if Input.is_action_pressed("ui_down"):
	 if a.z<1:
	     a.z+=0.5;

	 var angle=atan2(a.x,a.z)
	 var char_rot=b.get_rotation()
	 char_rot.y=angle
	 b.set_rotation(char_rot)
	
 move_and_slide(a,Vector3(0,0,0))

