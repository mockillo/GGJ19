extends KinematicBody2D

const GRAVITY = 100.0
const GRAVITY_CAP = 600.0
const JUMP_SPEED = 1200.0
const WALK_SPEED = 200.0

var is_flipped = false

var velocity = Vector2()

var joe

var init_pos

func _ready():
	init_pos = self.position.x

func _physics_process(delta):
	move(delta)
	attack()

func move(delta):
	move_and_slide(velocity, Vector2(0,-1))
	
	if joe == null:	
		if is_flipped:
			velocity.x = -WALK_SPEED/2
			if position.x < init_pos-128:
				apply_scale(Vector2(-1, 1))
				is_flipped = false
		else:
			velocity.x = WALK_SPEED/2
			if position.x > init_pos+128:
				apply_scale(Vector2(-1, 1))
				is_flipped = true
	else:
		if joe.position.x < position.x:
			velocity.x = -WALK_SPEED
			if !is_flipped:
				apply_scale(Vector2(-1, 1))
				is_flipped = true
		else:
			velocity.x = WALK_SPEED
			if is_flipped:
				apply_scale(Vector2(-1, 1))
				is_flipped = false

	if (Input.is_action_just_pressed("jump") and is_on_floor()):
		velocity.y = 0
	else:
		velocity.y += GRAVITY

	if (velocity.y > GRAVITY_CAP):
		velocity.y = GRAVITY_CAP

	if (abs(velocity.x) > 0 and not $MovementAnimations.is_playing()):
		$MovementAnimations.play("Walk")

func attack():
	if (Input.is_action_just_pressed("melee") and not $AttackAnimations.is_playing()):
		$AttackAnimations.play("Punch")

	if (Input.is_action_just_pressed("throw") and not $AttackAnimations.is_playing()):
			$AttackAnimations.play("Throw")

func _on_Area2D_body_entered(body):
	if body.get_name()=="Joe":
		joe = body
		print(joe.name+" has been spotted by "+name)


func _on_Area2D_body_exited(body):
	if body.get_name()=="Joe":
		joe = null
