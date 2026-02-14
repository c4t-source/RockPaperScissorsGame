extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D


var  horizontal_force = 800
var player
func _physics_process(_delta: float) -> void:
	if player:
		player.push_across(horizontal_force)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = null
	
	
	
