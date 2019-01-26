extends RigidBody2D

var dir = 1
var rot_factor = 10

var fired = false

func set_dir(d):
	dir = d

func _physics_process(delta):
	if (not fired):
		apply_impulse(Vector2(0,0), Vector2(1000 * dir, -400))
		fired = true
	
func disableRot():
	rot_factor = 0