extends Control

@onready var menubuttons: VBoxContainer = $Menubuttons
@onready var options: Panel = $options
@onready var transition_fade = $TransitionFade
@onready var levels = $Levels
@onready var TutorialB = $Levels/TutorialB
@onready var level1_B = $Levels/Level1B
@onready var level2_B = $Levels/Level2B
@onready var level_3b = $Levels/Level3B

func _ready(): 
	menubuttons.visible = true
	levels.visible = true
	TutorialB.visible = false
	level1_B.visible = false
	level2_B.visible = false
	level_3b.visible = false
	options.visible = false
	
	await TransitionFade.fade(0.0, 0.5).finished
	

func _on_start_pressed() -> void:
	await TransitionFade.fade(1.0, 1.0).finished 
	TransitionFade.color_rect.color.a = 1.0
	get_tree().change_scene_to_file("res://scenes/levels/Level_1.tscn")

func _on_options_2_pressed() -> void:
	print("hi")
	menubuttons.visible = false
	options.visible = true


func _on_exit_pressed() -> void:
	await TransitionFade.fade(1.0, 1.0).finished 
	get_tree().quit()


func _on_back_pressed() -> void:
	_ready()


func _on_levels_pressed():
	TutorialB.visible = true
	level1_B.visible = true
	level2_B.visible = true
	level_3b.visible = true

func _on_tutorial_b_pressed():
	await TransitionFade.fade(1.0, 1.0).finished 
	TransitionFade.color_rect.color.a = 1.0
	get_tree().change_scene_to_file("res://scenes/levels/Level_1.tscn")


func _on_level_1b_pressed():
	await TransitionFade.fade(1.0, 1.0).finished 
	TransitionFade.color_rect.color.a = 1.0
	get_tree().change_scene_to_file("res://scenes/levels/Level_2.tscn")





func _on_level_2b_pressed():
	await TransitionFade.fade(1.0, 1.0).finished 
	TransitionFade.color_rect.color.a = 1.0
	get_tree().change_scene_to_file("res://scenes/levels/Level_3.tscn")


func _on_level_3b_pressed():
	await TransitionFade.fade(1.0, 1.0).finished 
	TransitionFade.color_rect.color.a = 1.0
	get_tree().change_scene_to_file("res://scenes/levels/Level_4.tscn")
