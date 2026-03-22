extends CanvasLayer


func _ready():
	hide()
	await get_tree().process_frame
	
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.player_died.connect(_on_player_died)

func _on_player_died():
	await TransitionFade.fade(0.75, 0.5).finished
	show()

func _on_restart_pressed():
	get_tree().reload_current_scene() 




func _on_go_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/other scenes/main_menu.tscn")
