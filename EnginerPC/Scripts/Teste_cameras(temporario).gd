extends Spatial

onready var camera1 = $Camera
onready var camera2 = $Camera2
onready var camera3 =  $Camera3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Camera1_pressed_pressed():
	if (camera2.current == true or camera3.current == true):
		camera2.current = false
		camera3.current = false
		camera1.current = true


func _on_Camera2_pressed_pressed():
	if (camera1.current == true or camera3.current == true): 
		camera1.current = false
		camera3.current = false
		camera2.current = true
func _on_Camera3_pressed_pressed():
	if (camera1.current == true or camera2.current == true): 
		camera1.current = false
		camera2.current = false
		camera3.current = true
