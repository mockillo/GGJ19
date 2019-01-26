extends Node2D

func reload_level(body):
	print("ALARMAAAA! COLLIZIONE!")
	if (body.get_name() == "Joe"):
		get_tree().reload_current_scene()