extends Node2D

onready var fruit_scn = preload("res://scene/Fruit.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn_fruit(type, x_offset):
	var fruit = fruit_scn.instance()
	fruit.filter_food(type)
	fruit.position = Vector2(x_offset, 100)
	print("[SPAWN] ", type, " at ", fruit.position)
	add_child(fruit)

func _process(delta):
	if randf() < 0.01:
		var i = randi() % 2
		spawn_fruit(['Banana', 'Apple'][i], randi() % 450)
	if randf() < 0.011 and get_child_count() > 0:
		get_children()[0].queue_free()