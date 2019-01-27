extends BaseCharacter
class_name Joe

var weapons = [
	"res://Scenes/Weapons/Hammer.tscn",
	"res://Scenes/Weapons/Pencil.tscn",
	"res://Scenes/Weapons/Floppy.tscn",
	"res://Scenes/Weapons/CD.tscn",
	]

func _process(delta):
	print($DeathTimer.time_left)

#warning-ignore:unused_argument
func move(delta):
	move_and_slide(velocity, Vector2(0,-1))
	
	if (Input.is_action_just_pressed("jump") and is_on_floor()):
		velocity.y = -JUMP_SPEED
	else:
		velocity.y += GRAVITY
	
	if (velocity.y > GRAVITY_CAP):
		velocity.y = GRAVITY_CAP
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		if (not is_flipped): 
			apply_scale(Vector2(-1, 1))
			$HealthBar.flip()
			is_flipped = true
			
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
		if (is_flipped):
			apply_scale(Vector2(-1, 1))
			$HealthBar.flip()
			is_flipped = false
			
	else:
		velocity.x = 0
		$MovementAnimations.play("Stop")
		
	if (abs(velocity.x) > 0 and not $MovementAnimations.is_playing()):
		$MovementAnimations.play("Walk")
	
func attack():
	if (Input.is_action_just_pressed("melee") and not $AttackAnimations.is_playing()):
		$AttackAnimations.play("Punch")
		
	if (Input.is_action_just_pressed("throw") and not $AttackAnimations.is_playing()):
			$AttackAnimations.play("Throw")
			
func spawnRanged():
	var weapon_index = rand_range(0, 4)
	var weapon = load(weapons[weapon_index]).instance()
	#var weapon = load("res://Scenes/Weapons/CD.tscn").instance()
	weapon.position = $"character_Torso/character_Upper Left Arm/character_Lower Left Arm".global_position
	weapon.position.y -= 70.0
	weapon.set_dir(-1 if is_flipped else 1)
	get_parent().add_child(weapon)
	
func loadLevel():
	print("DeathTimer: timeout")
	get_tree().change_scene("res://Scenes/Level/Level1.tscn")
	
	

