extends KinematicBody

var speed = 7

var acelleration = 10

var jump = 10
var gravity = 0.08

var motion = Vector3()
var velocity = Vector3()
var fall = Vector3()
var direction = Vector3()

var mouse_sensivity = 0.1

onready var head = $Head
onready var camera = $Head/Camera

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sensivity))
		head.rotate_x(deg2rad(-event.relative.y * mouse_sensivity))
		head.rotation.x - clamp(head.rotation.x, deg2rad(-90), deg2rad(90))
		
func _physics_process(delta):
	motion = Vector3()
	
	if not is_on_floor():
		fall.y -= gravity
	
	if Input.is_action_pressed("Jump") and is_on_floor():
		fall.y = gravity
	
	if Input.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if Input.is_action_pressed("W"):
		motion -= transform.basis.z
	elif Input.is_action_pressed("S"):
		motion += transform.basis.z

	
	if Input.is_action_pressed("A"):
		motion -= transform.basis.x
	elif Input.is_action_pressed("D"):
		motion += transform.basis.x

	
	if motion != Vector3():
		pass
		
	move_and_slide(fall, Vector3.UP)
	motion = motion.normalized()
	motion = move_and_slide(motion)
	velocity = velocity.linear_interpolate(direction * speed, acelleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)
