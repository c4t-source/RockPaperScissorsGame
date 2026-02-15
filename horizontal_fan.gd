extends Area2D



@export var speed: Vector2 = Vector2(0, -2000)

func _on_body_entered(body: Node2D) -> void:
	if "wind_velocity_horizontal" in body:
		if speed.x < 0.0:
			body.velocity.x = speed.x
		body.wind_velocity_horizontal += speed

func _on_body_exited(body: Node2D) -> void:
	if "wind_velocity_horizontal" in body:
		body.wind_velocity_horizontal -= speed
