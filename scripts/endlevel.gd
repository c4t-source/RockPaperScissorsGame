extends Area2D
signal player_finished_level
signal player_finished_game
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready():
	audio_stream_player_2d.volume_db = -80
func _on_body_entered(body: Node2D) -> void:
	var current_scene = get_tree().current_scene.scene_file_path
	var file_name = current_scene.get_file()
	if body.is_in_group("Player") and current_scene != "res://scenes/levels/Level_4.tscn":
		audio_stream_player_2d.volume_db = 0
		get_tree().paused = true
		player_finished_level.emit()
		audio_stream_player_2d.play()
	if body.is_in_group("Player") and current_scene == "res://scenes/levels/Level_4.tscn":
		audio_stream_player_2d.volume_db = 0
		get_tree().paused = true
		player_finished_game.emit()
		audio_stream_player_2d.play()
