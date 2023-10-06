extends Control

func _on_start_game_pressed():
	get_tree().get_first_node_in_group("SceneManager")._change_scene(0)


func _on_settings_pressed():
	get_tree().get_first_node_in_group("SceneManager")._open_settings()


func _on_quit_game_pressed():
	get_tree().quit()
