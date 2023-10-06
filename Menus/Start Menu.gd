extends Control



func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://place_holder_world_scene.tscn")


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Menus/settings_menu.tscn")


func _on_quit_game_pressed():
	get_tree().quit()
