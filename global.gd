extends Node

var swaps_count: int = 0

func _input(event):
	if event.is_action_pressed("swap_character"):
		swaps_count = swaps_count + 1
		print(swaps_count)
