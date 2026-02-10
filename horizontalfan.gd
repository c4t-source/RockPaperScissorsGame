extends Area2D

@onready var animated_sprite_2D: AnimatedSprite2D = $AnimatedSprite2D
@onready var GPU_particles_2D: GPUParticles2D = $GPUParticles2D

var horizontal_force = 80
var player 


func _physics_process(delta: float) -> void:
	if player:
		player.push_across(horizontal_force)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body


func _on_body_exited(body: Node2D) -> void:
	player = null
	
	
