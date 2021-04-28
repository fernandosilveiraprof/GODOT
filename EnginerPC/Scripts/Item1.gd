extends RigidBody


var dropped = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if dropped == true:
		apply_impulse(transform.basis.z, -transform.basis.z * 10)
		dropped = false
