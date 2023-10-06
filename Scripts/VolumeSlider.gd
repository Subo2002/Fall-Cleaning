extends HSlider

@export var busName: String = "Master"

var scaleTween: Tween

func _ready():
	value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index(busName)))
	value_changed.connect(Callable(_OnChanged))
	mouse_entered.connect(Callable(_Focused))
	mouse_exited.connect(Callable(_Unfocused))
	focus_entered.connect(Callable(_Focused))
	focus_exited.connect(Callable(_Unfocused))

func _OnChanged(_value: float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(busName), linear_to_db(_value))
	#get_tree().get_first_node_in_group("SoundPlayer")._PlaySound(2, AudioServer.get_bus_index(busName))

func _Focused():
	if scaleTween:
		scaleTween.stop()
	scaleTween = create_tween()
	scaleTween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.2)
	#get_tree().get_first_node_in_group("SoundPlayer")._PlaySound(1, 3)

func _Unfocused():
	if scaleTween:
		scaleTween.stop()
	scaleTween = create_tween()
	scaleTween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.2)
