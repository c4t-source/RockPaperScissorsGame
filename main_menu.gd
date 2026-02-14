extends Control



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/Level_1.tscn")


func _on_options_2_pressed() -> void:
	print("hi")


func _on_exit_pressed() -> void:
	get_tree().quit()
