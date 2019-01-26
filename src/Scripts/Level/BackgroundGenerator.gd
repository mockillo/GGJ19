tool
extends TileMap

export var width = 20 setget set_width
export var height = 10 setget set_height

func _ready():
	draw()
			
func draw():
	clear()
	
	var tileCount = tile_set.get_tiles_ids().size()
	
	for x in width:
		for y in height:
			set_cell(x, y, round(rand_range(0, tileCount - 1)))

func set_width(new_value):
	width = new_value
	draw()
	
func set_height(new_value):
	height = new_value
	draw()