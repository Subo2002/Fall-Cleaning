extends Button

var scaleTween: Tween

@export var is_back: bool = false

func _ready():
	mouse_entered.connect(Callable(_Focused))
	mouse_exited.connect(Callable(_Unfocused))
	focus_entered.connect(Callable(_Focused))
	focus_exited.connect(Callable(_Unfocused))
	pressed.connect(Callable(_Pressed))

func _Focused():
	if scaleTween:
		scaleTween.stop()
	scaleTween = create_tween()
	scaleTween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.2)
	get_tree().get_first_node_in_group("SoundPlayer")._PlaySound(0, 3)
	if !has_focus():
		grab_focus()

func _Pressed():
	if is_back:
		get_tree().get_first_node_in_group("SoundPlayer")._PlaySound(2, 3)
	else:
		get_tree().get_first_node_in_group("SoundPlayer")._PlaySound(1, 3)

func _Unfocused():
	if scaleTween:
		scaleTween.stop()
	scaleTween = create_tween()
	scaleTween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.2)
