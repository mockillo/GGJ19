extends KinematicBody2D

const SPEED = 2000.0
var velocity = Vector2()

var dir = 1

func set_dir(d):
	dir = d

func _ready():
	velocity.y = -300.0
	velocity.x = dir * SPEED

func _physics_process(delta):
	if (velocity.x > 0):
		 velocity.x -= 20.0
	else:
		velocity.x += 20.0
		
	velocity.y += 10.0
	move_and_slide(velocity, Vector2(0, -1))