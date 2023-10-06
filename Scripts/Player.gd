extends CharacterBody2D

class_name Player

var speed = 100.0

var rake: Rake

func _ready():
	rake = get_tree().get_first_node_in_group("Rake")

func _physics_process(_delta):
	
	var move = Vector2.ZERO

	if Input.is_action_just_pressed("Rake"):
		rake._rake_action()

	if rake.raking: #prevents movement while raking
		return

	if Input.is_action_pressed("Sprint"):
		speed = 200
	else:
		speed = 100

	var directionLR = Input.get_axis("PlayerLeft", "PlayerRight")
	if directionLR:
		move.x = directionLR
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	var directionUD = Input.get_axis("PlayerUp", "PlayerDown")
	if directionUD:
		move.y = directionUD
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	velocity = move.normalized() * speed
	velocity.y *= 0.5

	move_and_slide()
