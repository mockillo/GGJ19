extends KinematicBody2D

const GRAVITY = 200.0
const GRAVITY_CAP = 600.0
const WALK_SPEED = 200

var is_flipped = false

var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move(delta)

func move(delta):
	velocity.y += delta * GRAVITY
	
	if (velocity.y > GRAVITY_CAP):
		velocity.y = GRAVITY_CAP
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		if (not is_flipped): 
			apply_scale(Vector2(-1, 1))
			is_flipped = true
			
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
		if (is_flipped):
			apply_scale(Vector2(-1, 1))
			is_flipped = false
			
	else:
		velocity.x = 0
		$AnimationPlayer.play("Stop")
		
	if (abs(velocity.x) > 0 and not $AnimationPlayer.is_playing()):
		$AnimationPlayer.play("Walk")
	
	move_and_slide(velocity, Vector2(0,-1))
	