extends CharacterBody2D


var speed = 100.0

func _physics_process(_delta):
	
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
