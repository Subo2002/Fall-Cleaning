extends Camera2D

var follow_player = true

var player = null

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(_delta):
	if follow_player:
		position = player.position + Vector2(0, -100)
