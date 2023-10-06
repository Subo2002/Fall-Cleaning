extends RigidBody2D

class_name Leaf

var pile: Array[Leaf]

var height: float = 0

@export var shaders: Array[ShaderMaterial]

@export var textures: Array[Texture]

func _ready():
	$Sprite.material = shaders[randi() % shaders.size()]
	$Sprite.texture = textures[randi() % textures.size()]

func _on_area_entered(area):
	if position.y > area.get_parent().position.y:
		pile.append(area.get_parent())

func _on_area_exited(area):
	if area.get_parent() in pile:
		pile.erase(area.get_parent())

func _physics_process(_delta):
	if pile.size() > 0:
		height = 0
		for leaf in pile:
			height -= (20 - (position - leaf.position).length()) / 5
		$Sprite.position = Vector2(0, height).rotated(-rotation)
	else:
		$Sprite.position = Vector2.ZERO
