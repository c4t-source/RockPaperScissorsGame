extends Area2D
class_name WindArea2D

@export var speed: Vector2 = Vector2(0, -400)



func _physics_process(delta):
	for body in get_overlapping_bodies():
		if "wind_velocity" in body:
			if speed.y < 0.0:
				body.velocity.y = speed.y
			body.wind_velocity += speed * delta

func _body_exited(body: Node2D) -> void:
	if "wind_velocity" in body:
		body.wind_velocity -= speed
