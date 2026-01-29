extends Area3D

# Define a signal to emit when the button is pressed/released
signal pressed
signal released

var pressed_count = 0 # Track how many bodies are on the button

func _on_floor_button_body_entered(body):
	# Check if the entered body is what you want to activate the button (e.g., the player)
	# You might add checks for specific group membership or node names here
	if body.is_in_group("player") or body.is_in_group("movable_objects"):
		pressed_count += 1
		if pressed_count == 1: # Only trigger "pressed" on the first body
			print("Button Pressed!")
			emit_signal("pressed")
			# Optional: Add animation/visual feedback here

func _on_floor_button_body_exited(body):
	# Check if the exited body is one of the valid activators
	if body.is_in_group("player") or body.is_in_group("movable_objects"):
		pressed_count -= 1
		if pressed_count == 0: # Only trigger "released" when all bodies are gone
			print("Button Released!")
			emit_signal("released")
			# Optional: Add animation/visual feedback here
