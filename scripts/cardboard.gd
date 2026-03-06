extends Area2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var collision_shape_2dbreak: CollisionShape2D = $CollisionShape2D
@onready var player = $"../../CharacterBody2D"
func _on_body_entered(body: Node2D) -> void:
	if player.current_character == player.CharacterType.Y:
		$Sprite2D.visible = false
		$StaticBody2D/CollisionShape2D.queue_free()
		$CollisionShape2D.queue_free()
