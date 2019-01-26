extends KinematicBody2D

const GRAVITY = 100.0
const GRAVITY_CAP = 600.0
const JUMP_SPEED = 1200.0
const WALK_SPEED = 200.0

var is_flipped = false

var velocity = Vector2()

var weapons = [
	"res://Scenes/Weapons/Hammer.tscn",
	"res://Scenes/Weapons/Pencil.tscn",
	"res://Scenes/Weapons/Floppy.tscn",
	"res://Scenes/Weapons/CD.tscn",
	]

func _physics_process(delta):
	move(delta)
	attack()

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
			is_flipped = true
			
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
		if (is_flipped):
			apply_scale(Vector2(-1, 1))
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
	var weapon_index = rand_range(0, 3)
	print(weapon_index)
	print(weapons[weapon_index])
	var weapon = load(weapons[weapon_index]).instance()
	weapon.position = $"character_Torso/character_Upper Left Arm/character_Lower Left Arm".global_position
	weapon.set_dir(-1 if is_flipped else 1)
	get_parent().add_child(weapon)