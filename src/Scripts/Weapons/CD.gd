extends RigidBody2D

var dir = 1
var rot_factor = 10

var fired = false

var hit = false

func set_dir(d):
	dir = d

func _physics_process(delta):
	if (not fired):
		apply_impulse(Vector2(0,0), Vector2(1000 * dir, -400))
		fired = true
	

func ranged_hit(body):
	if hit: return
	if body is MiddleManagement:
		(body as MiddleManagement).take_damage(15)
	if not body is Joe:
		get_tree().get_current_scene().remove_child(self)
		hit = true	