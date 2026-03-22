extends CanvasLayer
@onready var particles = $GPUParticles2D
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide() 
	await get_tree().process_frame
	
	var endlevel = get_tree().get_first_node_in_group("endlevel")
	if endlevel:
		endlevel.player_finished_level.connect(_on_player_finished_level)


func _on_player_finished_level():
	await get_tree().create_timer(0.5).timeout
	show()
	await get_tree().create_timer(0.5).timeout
	particles.emitting = true


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/other scenes/main_menu.tscn")


func _on_next_level_pressed():
	get_tree().paused = false
	var current_scene = get_tree().current_scene.scene_file_path
	var file_name = current_scene.get_file()
	var level_number = file_name.get_basename().split("_")[1].to_int()
	var next_level = level_number + 1
	var next_level_destin = "res://scenes/levels/Level_" + str(next_level) + ".tscn"
	get_tree().change_scene_to_file(next_level_destin)
