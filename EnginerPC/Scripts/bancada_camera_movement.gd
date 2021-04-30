extends Spatial

onready var camerabalcao = $Camera
onready var cameramonitor = $Camera2
onready var camerapc = $Camera3




func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if (camerabalcao.current == true or camerapc.current == true):
		camerabalcao.current = false
		camerapc.current = false
		cameramonitor.current = true


func _on_Button2_pressed():
	if (camerabalcao.current == true or cameramonitor.current == true):
		camerabalcao.current = false
		cameramonitor.current = false
		camerapc.current = true


func _on_Button3_pressed():
	if (cameramonitor.current == true or camerapc.current == true):
		cameramonitor.current = false
		camerapc.current = false
		camerabalcao.current = true
