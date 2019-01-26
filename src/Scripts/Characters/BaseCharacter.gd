extends KinematicBody2D

const GRAVITY = 100.0
const GRAVITY_CAP = 600.0
const JUMP_SPEED = 1200.0
const WALK_SPEED = 200.0

var is_flipped = false

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move(delta)
	attack()
	
func move(delta):
	print("do something")	
	
func attack():
	print("ATTACK!")