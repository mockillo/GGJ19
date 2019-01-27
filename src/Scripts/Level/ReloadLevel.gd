extends Node2D

func reload_level(body):
	if (body.get_name() == "Joe"):
		get_tree().change_scene("res://Scenes/Conditions/Success.tscn")