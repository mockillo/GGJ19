extends Node2D

var paused = false

onready var btns = [
	$VBoxContainer/Quit,
	$VBoxContainer/Play
	]

var current_btn = 1

func set_paused(p: bool):
	paused = p
	
	if (p):
		$VBoxContainer/Play.text = "Continue"

func play():
	if (not paused):
		get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
	
func quit():
	get_tree().quit()
	
func _process(delta):
	if (Input.is_action_pressed("ui_up") && current_btn < btns.size() - 1):
		current_btn += 1
	elif (Input.is_action_pressed("ui_down") && current_btn > 0):
		current_btn -= 1
		
	print(btns)
	print(current_btn)
	print(btns[current_btn])	
	
	btns[current_btn].grab_focus()
	