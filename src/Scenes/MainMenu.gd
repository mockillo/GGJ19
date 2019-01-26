extends Node2D

var paused = false

func set_paused(p: bool):
	paused = p
	
	if (p):
		$VBoxContainer/Play.text = "Continue"

func play():
	if (not paused):
		get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
	
func quit():
	get_tree().quit()
