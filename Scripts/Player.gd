extends CharacterBody2D


const SPEED = 300.0

func _physics_process(_delta):
	
	var directionLR = Input.get_axis("PlayerLeft", "PlayerRight")
	if directionLR:
		velocity.x = directionLR * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var directionUD = Input.get_axis("PlayerUp", "PlayerDown")
	if directionUD:
		velocity.y = directionUD * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
