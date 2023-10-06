extends CanvasLayer

func _resume():
	get_parent()._toggle_pause()

func _open_settings():
	get_tree().get_first_node_in_group("SceneManager")._open_settings()

func _main_menu():
	get_tree().get_first_node_in_group("SceneManager")._change_scene(1)
