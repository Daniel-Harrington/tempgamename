extends ParallaxBackground

var screen_width = 1024  # Adjust with your screen width

# Define properties for each ParallaxLayer's scroll speed
var layer_speeds = {
	"Trees1": Vector2(100, 0),  # Adjust the scroll speed as needed
	"Lights2": Vector2(80, 0),  # Adjust the scroll speed as needed
	"Trees3": Vector2(50, 0),  # Adjust the scroll speed as needed
	# Add more layers and speeds as needed
}

func _process(delta):
	for layer_name in layer_speeds.keys():
		if has_node(layer_name):
			var layer = get_node(layer_name)
			var speed = layer_speeds[layer_name]

			# Update the position of the ParallaxLayer based on its scroll speed
			layer.position.x -= speed.x * delta

			# Check if the layer has moved off the screen
			if layer.position.x < -screen_width+10:
				# Reset the position to loop it back to the right side of the screen
				layer.position.x = 0
