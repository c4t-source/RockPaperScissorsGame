extends Area2D
signal player_finished_level

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().paused = true
		player_finished_level.emit()
