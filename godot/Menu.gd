extends Control # Change this to match your scene structure

func _ready():
	# Get a reference to the AnimationPlayer
	var animation_player = get_node("FumikoRun")  # Replace with the actual path to your AnimationPlayer

	# Play the "idle" animation
	animation_player.play("Running")
