extends Node2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready():
	TransitionFade.fade(0.0, 1.0)
	audio_stream_player_2d.play()
