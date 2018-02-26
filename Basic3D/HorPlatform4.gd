extends RigidBody

export (float) var distanceZ = 25;
export (float) var speed = 6;

var direction = 1;
var positionOrigin; 

func _ready():
	positionOrigin = global_transform.origin;
	
	
func _process(delta): 

	var newZ = global_transform.origin.z; 
	newZ += delta * speed * direction ; 
	newZ = lerp(global_transform.origin.z, newZ , 1);
	
	if(newZ - positionOrigin.z >= distanceZ):
		direction = -1; 
		
	if(newZ <= positionOrigin.z):
		direction = 1; 
			
	self.global_transform.origin.z = newZ ; 
	