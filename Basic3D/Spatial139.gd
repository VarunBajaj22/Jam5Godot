extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (float) var distanceY = 12;
export (float) var speed = 6;

var direction = 1;
var positionOrigin; 

func _ready():
	positionOrigin = global_transform.origin;

func _process(delta): 
	var newY = global_transform.origin.y; 
	newY += delta * speed * direction ; 
	newY = lerp(global_transform.origin.y, newY , 1);
	
	if(newY - positionOrigin.y >= distanceY):
		direction = -1; 
		
	if(newY <= positionOrigin.y):
		direction = 1; 
			
	self.global_transform.origin.y = newY ; 
	