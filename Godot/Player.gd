extends KinematicBody

onready var WPressed = false
onready var SPressed = false 
onready var APressed = false 
onready var DPressed = false 

onready var CurrentVelocity = Vector3(0, 0, 0)
onready var WeightVector = Vector3(0, 0, 0)
onready var MovementVector = Vector3(0, 0, 0)

export(float , 0 , 1000 ) var PlayerSpeed = 0

onready var WeightLimit = 100
export(float, 0, 30) var Weight = 30 


func _ready():
	
	
	pass

func _input(event):
	
	if (event is InputEventKey):
		
		match(event.scancode):
			
			KEY_W:
				
				if(event.is_pressed()):
					
					WPressed = true
					
				else:
					
					WPressed = false 
					
			KEY_S:
				
				if(event.is_pressed()):
					
					SPressed = true
					
				else:
					
					SPressed = false 
					
			KEY_D:
				
				if(event.is_pressed()):
					
					DPressed = true
					
				else:
					
					DPressed = false 
					
			KEY_A:
				
				if (event.is_pressed()):
					
					APressed = true
					
				else:
					
					APressed = false 
					
	pass
	
func MovementHandler():
	
	MovementVector = Vector3(0, 0, 0)
	var Velocity = Vector3(0, 0, 0)
	
	if (WPressed):
		
		MovementVector += Vector3(0, 0, -1)
		
	if (SPressed):
		
		MovementVector += Vector3(0, 0, 1)
		
	if (DPressed):
		
		MovementVector += Vector3(1, 0, 0)
		
	if (APressed):
		
		MovementVector += Vector3(-1, 0, 0 )
		
		
	MovementVector = MovementVector.normalized() * PlayerSpeed
	WeightVector = (MovementVector * -1) * clamp((Weight / WeightLimit), 0, 1)
	
	CurrentVelocity = CurrentVelocity.linear_interpolate(MovementVector + WeightVector, get_physics_process_delta_time() * 2 )
	
	self.move_and_slide(CurrentVelocity, Vector3(0, 1, 0) )
	
	pass
	
func _physics_process(delta):
	
	MovementHandler()
	
	pass
	
	
	

