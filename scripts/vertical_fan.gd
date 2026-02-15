extends Area2D
class_name WindArea2D

@export var speed: Vector2 = Vector2(0, -2000)




func _on_body_entered(body: Node2D) -> void:
	if "wind_velocity" in body:
		if speed.y < 0.0:
			body.velocity.y = speed.y
		body.wind_velocity += speed

func _on_body_exited(body: Node2D) -> void:
	if "wind_velocity" in body:
		body.wind_velocity -= speed
