extends Node2D

@export var leaf_scene: PackedScene

var paused = false

func _ready():
	_spawn_leaves()

func _spawn_leaves():
	for i in range(500):
		var leaf = leaf_scene.instantiate()
		$GamePlay.add_child(leaf)
		leaf.position = Vector2(randi_range(-200, 200), randi_range(-200, 200))
		leaf.rotation = deg_to_rad(randi_range(0, 360))
		leaf.modulate = _leaf_colour()

func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		_toggle_pause()

func _toggle_pause():
	paused = !paused
	if paused:
		get_tree().paused = true
		$PauseMenu.visible = true
	else:
		get_tree().paused = false
		$PauseMenu.visible = false

func _leaf_colour() -> Color:
	var colour = Color()
	var rand = randf()
	if rand < 0.2:
		colour = Color(1.0, 0.3, 0.15)
	elif rand < 0.4:
		colour = Color(1.0, 1.0, 0.0)
	elif rand < 0.6:
		colour = Color(1.0, 0.2, 0.2)
	elif rand < 0.8:
		colour = Color(0.8, 0.3, 0.2)
	else:
		colour = Color(0.9, 0.5, 0.3)
	return colour