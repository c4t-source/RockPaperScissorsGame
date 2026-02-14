extends CharacterBody2D

enum CharacterType { X, Y, Z }
var current_character: int = CharacterType.X

var sprite_x: Texture2D
var sprite_y: Texture2D
var sprite_z: Texture2D

var speed_x := 180.0
var speed_y := 400
var speed_z := 200

var gravity_scale_x := 3
var gravity_scale_y := 1
var gravity_scale_z := 4

var jump_velocity_x := 0.0
var jump_velocity_y := -360.0
var jump_velocity_z := -900

var current_speed := 200.0
var current_gravity_scale := 1.0
var current_jump_velocity := -350.0
var can_jump := true

@onready var sprite: Sprite2D = get_node_or_null("Sprite2D")

var base_gravity := 0.0

func _ready():
	base_gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	apply_character()

func _input(event):
	if event.is_action_pressed("swap_character"):
		swap_character()
	if event.is_action_pressed("ability"):
		use_ability()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += base_gravity * current_gravity_scale * delta

	var dir := Input.get_axis("move_left", "move_right")
	velocity.x = dir * current_speed

	if Input.is_action_just_pressed("Jump") and is_on_floor() and can_jump:
		velocity.y = current_jump_velocity

	move_and_slide()

func swap_character():
	current_character = (current_character + 1) % 3
	apply_character()

func apply_character():
	match current_character:
		CharacterType.X:
			current_speed = speed_x
			current_gravity_scale = gravity_scale_x
			current_jump_velocity = jump_velocity_x
			can_jump = true
			if sprite and sprite_x: sprite.texture = sprite_x

		CharacterType.Y:
			current_speed = speed_y
			current_gravity_scale = gravity_scale_y
			current_jump_velocity = jump_velocity_y
			can_jump = true
			if sprite and sprite_y: sprite.texture = sprite_y

		CharacterType.Z:
			current_speed = speed_z
			current_gravity_scale = gravity_scale_z
			current_jump_velocity = jump_velocity_z
			can_jump = true
			if sprite and sprite_z: sprite.texture = sprite_z

func use_ability():
	match current_character:
		CharacterType.X:
			pass
		CharacterType.Y:
			pass
		CharacterType.Z:
			pass
