extends Node

var menu

# Yes, we're looking up root and current_scene all the time, as these may change.
# This is after all a global singleton.

func _process(delta):
	if (Input.is_action_pressed("ui_cancel")):
		var root = get_tree().get_root()
		var current_scene = root.get_child(root.get_child_count() -1)
		
		menu = load("res://Scenes/MainMenu.tscn").instance()
		menu.get_node("VBoxContainer/Play").connect("pressed", self, "unpause")
		menu.set_paused(true)
		
		get_tree().paused = true
		current_scene.add_child(menu)

func unpause():
	var root = get_tree().get_root()
	var current_scene = root.get_child(root.get_child_count() -1)
	current_scene.remove_child(menu)
	get_tree().paused = false