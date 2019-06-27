extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("[INIT] Fruit Scene size ", OS.get_window_size())
	pass # Replace with function body.

func filter_food(name): 
	var fruits = get_children()
	for fruit in fruits:
		if fruit.get_name() != name:
			remove_child(fruit)
