extends RigidBody2D

class_name Leaf

var pile: Array[Leaf]

var height: float = 0

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
			height -= 2
		$Sprite.position = Vector2(0, height)
	else:
		$Sprite.position = Vector2.ZERO
