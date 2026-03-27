extends Area2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var collision_shape_2dbreak: CollisionShape2D = $CollisionShape2D
@onready var player = $"../../CharacterBody2D"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var particles = $GPUParticles2D
func _ready() -> void:
	randomize()


func choose_a_sound():
	var random_index = randi() % sounds.size()
	var chosen_sound = sounds[random_index]
	audio_stream_player_2d.stream = chosen_sound
	audio_stream_player_2d.pitch_scale = randf_range(0.9, 1.1)  # optional variation
	audio_stream_player_2d.play()

var sounds = [
	preload("res://art/sound effects/freesound_community-scissors-69248-[AudioTrimmer.com] (4).mp3"),
	preload("res://art/sound effects/freesound_community-scissors-69248-[AudioTrimmer.com] (5).mp3"),
	preload("res://art/sound effects/freesound_community-scissors-69248-[AudioTrimmer.com].mp3")
]

func _on_body_entered(body: Node2D) -> void:
	if not body is CharacterBody2D:
		return
	if body.current_character == body.CharacterType.Y:
		particles.emitting = true
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.visible = false
		$StaticBody2D/CollisionShape2D.queue_free()
		$CollisionShape2D.queue_free()
		choose_a_sound()
