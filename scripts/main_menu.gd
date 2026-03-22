extends Control

@onready var menubuttons: VBoxContainer = $Menubuttons
@onready var options: Panel = $options
@onready var transition_fade = $TransitionFade


func _ready(): 
	menubuttons.visible = true
	options.visible = false
	await TransitionFade.fade(0.0, 0.5).finished

func _on_start_pressed() -> void:
	await transition_fade.fade(1.0, 1.0).finished 
	TransitionFade.color_rect.color.a = 1.0
	get_tree().change_scene_to_file("res://scenes/levels/Level_1.tscn")

func _on_options_2_pressed() -> void:
	print("hi")
	menubuttons.visible = false
	options.visible = true


func _on_exit_pressed() -> void:
	await transition_fade.fade(1.0, 1.0).finished 
	get_tree().quit()


func _on_back_pressed() -> void:
	_ready()
