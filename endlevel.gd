extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var current_scene = get_tree().current_scene.scene_file_path
		var file_name = current_scene.get_file() # "Level_1.tscn"
		
		var level_number = file_name.get_basename().split("_")[1].to_int()
		var next_level = level_number + 1
		
		var next_level_dest = "res://levels/Level_" + str(next_level) + ".tscn"
		get_tree().change_scene_to_file(next_level_dest)
