extends KinematicBody2D
class_name BaseCharacter

const GRAVITY = 100.0
const GRAVITY_CAP = 600.0
const JUMP_SPEED = 1200.0
const WALK_SPEED = 200.0

var is_flipped = false

var velocity = Vector2()

var health = 100

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
	
func take_damage(amount):
	health -= amount
	if health<1:
		print ("YOU ARE DEAD, "+self.name)
		if self.get_name() == "Joe":
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
		else:
			get_tree().get_current_scene().remove_child(self)
		

func melee_hit(body:BaseCharacter):
	if body != self:
		body.take_damage(10)
		
		
		
		