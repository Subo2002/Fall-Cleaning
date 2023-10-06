extends CharacterBody2D

var speed = 100.0

var rake: AnimatableBody2D

var raking = false

func _ready():
	rake = $Rake
	rake.collision_layer = 0
	rake.visible = false

func _physics_process(_delta):
	
	if Input.is_action_just_pressed("Rake"):
		_rake_action()

	if raking: #prevents movement while raking
		return

	if Input.is_action_pressed("Sprint"):
		speed = 200
	else:
		speed = 100

	var directionLR = Input.get_axis("PlayerLeft", "PlayerRight")
	if directionLR:
		velocity.x = directionLR * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	var directionUD = Input.get_axis("PlayerUp", "PlayerDown")
	if directionUD:
		velocity.y = directionUD * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()

	rake.global_position = position + Vector2(0, 60)

func _rake_action():
	raking = true
	rake.visible = true
	rake.collision_layer = 1

	rake.global_position = position + Vector2(0, 70)

	var tween = create_tween()
	tween.tween_property(rake, "global_position", position + Vector2(0, 30), 1).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(Callable(_end_rake_action))

func _end_rake_action():
	raking = false
	rake.visible = false
	rake.collision_layer = 0
