extends Control

@onready var menubuttons: VBoxContainer = $Menubuttons
@onready var options: Panel = $options


func _ready():
	menubuttons.visible = true
	options.visible = false
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/Level_1.tscn")


func _on_options_2_pressed() -> void:
	print("hi")
	menubuttons.visible = false
	options.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	_ready()
