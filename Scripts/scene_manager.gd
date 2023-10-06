extends Node

@export var game: PackedScene
@export var menu: PackedScene

var settingsOpen = false

enum Scene { GAME, MENU }

var current_scene = Scene.GAME
var sceneNode: Node

func _ready():
	randomize()
	_change_scene(Scene.MENU)

func _change_scene(newScene: Scene):
	if sceneNode != null:
		sceneNode.queue_free()
	
	if newScene == Scene.GAME:
		sceneNode = game.instantiate()
	elif newScene == Scene.MENU:
		sceneNode = menu.instantiate()

	add_child(sceneNode)
	current_scene = newScene

func _close_settings():
	$SettingsLayer.visible = false
	settingsOpen = false

func _open_settings():
	$SettingsLayer.visible = true
	settingsOpen = true
