extends BaseCharacter
class_name MiddleManagement

var joe

var init_pos

func _ready():
	init_pos = self.position.x

func move(delta):
	move_and_slide(velocity, Vector2(0,-1))
	
	if joe == null:	
		if is_flipped:
			velocity.x = -WALK_SPEED/2
			if position.x < init_pos-128:
				apply_scale(Vector2(-1, 1))
				$HealthBar.flip()
				is_flipped = false
		else:
			velocity.x = WALK_SPEED/2
			if position.x > init_pos+128:
				apply_scale(Vector2(-1, 1))
				$HealthBar.flip()
				is_flipped = true
	else:
		if joe.position.x < position.x:
			velocity.x = -WALK_SPEED
			if !is_flipped:
				apply_scale(Vector2(-1, 1))
				$HealthBar.flip()
				is_flipped = true
		else:
			velocity.x = WALK_SPEED
			if is_flipped:
				apply_scale(Vector2(-1, 1))
				$HealthBar.flip()
				is_flipped = false

	if (is_on_floor()):
		velocity.y = 0
	else:
		velocity.y += GRAVITY

	if (velocity.y > GRAVITY_CAP):
		velocity.y = GRAVITY_CAP

	if (abs(velocity.x) > 0 and not $MovementAnimations.is_playing()):
		$MovementAnimations.play("Walk")

func attack():
	if (joe and not $AttackAnimations.is_playing() and abs(joe.position.x-position.x)<100):
		$AttackAnimations.play("Punch")

func _on_Area2D_body_entered(body):
	if body.get_name()=="Joe":
		joe = body
		print(joe.name+" has been spotted by "+name)


func _on_Area2D_body_exited(body):
	if body.get_name()=="Joe":
		joe = null
