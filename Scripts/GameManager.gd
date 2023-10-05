extends Node2D

@export var leaf_scene: PackedScene

func _ready():
	_spawn_leaves()

func _spawn_leaves():
	for i in range(500):
		var leaf = leaf_scene.instantiate()
		add_child(leaf)
		leaf.position = Vector2(randi_range(-200, 200), randi_range(-200, 200))

func _process(_delta):
	pass
