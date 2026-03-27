extends Area2D
signal player_finished_level
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
func _ready():
	audio_stream_player_2d.volume_db = -80
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		audio_stream_player_2d.volume_db = 0
		get_tree().paused = true
		player_finished_level.emit()
		audio_stream_player_2d.play()
