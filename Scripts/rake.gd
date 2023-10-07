extends AnimatableBody2D

class_name Rake

var raking = false

var player: Player

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	collision_layer = 0
	visible = false

func _physics_process(_delta):
	if !raking:
		global_position = player.position + Vector2(0, 30)

func _rake_action():
	if raking:
		return

	raking = true
	visible = true
	
	global_position = player.position + Vector2(0, 30)
	var tween = create_tween()
	tween.tween_property(self, "global_position", player.position + Vector2(0, 70), 0.2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_callback(Callable(_collision))
	tween.tween_property(self, "global_position", player.position + Vector2(0, 30), 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_callback(Callable(_end_rake_action))

func _collision():
	collision_layer = 1

func _end_rake_action():
	raking = false
	visible = false
	collision_layer = 0
