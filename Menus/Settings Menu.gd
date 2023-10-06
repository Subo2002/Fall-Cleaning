extends Control

var last_pressed : Button
var last_mini_menu : Control

func _ready():
	volume_button = get_node(volume_button_path)
	volume_menu = get_node(volume_menu_path)
	other_setting_button = get_node(other_setting_button_path)
	other_setting_menu = get_node(other_setting_menu_path)
	
	

#should probs refactor code so these blocks are in their respective buttons/mini menu control nodes
@export var volume_button_path : NodePath
var volume_button : Button
@export var volume_menu_path : NodePath
var volume_menu : Control
func _on_volume_pressed():
	if last_pressed != null: 
		last_mini_menu.visible = false
		last_pressed.button_pressed = false
	last_pressed = volume_button
	last_mini_menu = volume_menu
	volume_menu.visible = true

@export var other_setting_button_path : NodePath
var other_setting_button : Button
@export var other_setting_menu_path : NodePath
var other_setting_menu : Control
func _on_place_holder_other_setting_pressed():
	if last_pressed != null: 
		last_mini_menu.visible = false
		last_pressed.button_pressed = false
	last_pressed = other_setting_button
	last_mini_menu = other_setting_menu
	other_setting_menu.visible = true



