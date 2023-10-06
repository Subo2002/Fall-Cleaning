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
