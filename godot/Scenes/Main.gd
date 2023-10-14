extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# Get a reference to the AnimationPlayer
	var animation_player = get_node("FumikoRunForward")  # Replace with the actual path to your AnimationPlayer

	# Play the "idle" animation
	animation_player.play("Forward_Run")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
