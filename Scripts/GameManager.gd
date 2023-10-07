extends Node2D

@export var leaf_scene: PackedScene

var paused = false

var leaf_count = 500

var leafs_collected = 0

func _ready():
	_spawn_leaves()

func _spawn_leaves():
	for i in range(leaf_count):
		var leaf = leaf_scene.instantiate()
		$GamePlay.add_child(leaf)
		leaf.position = Vector2(randi_range(-200, 200), randi_range(-200, 200))
		leaf.rotation = deg_to_rad(randi_range(0, 360))

func _leaf_collected(_body):
	if _body.is_in_group("Leaf"):
		if !_body.in_zone:
			_body.in_zone = true
			leafs_collected += 1
	
			$GamePlay/HUD/Control/ProgressLabel.text = "PROGRESS CLEANED: " + str(100.0 * leafs_collected / leaf_count) + "%"
	
func _leaf_lost(_body):
	if _body.is_in_group("Leaf"):
		if _body.in_zone:
			_body.in_zone = false
			leafs_collected -= 1

			$GamePlay/HUD/Control/ProgressLabel.text = "PROGRESS CLEANED: " + str(100.0 * leafs_collected / leaf_count) + "%"

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
