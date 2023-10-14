extends Control # Change this to match your scene structure

var email = ""
var username = ""
var password = ""


func _ready():
	# Get a reference to the AnimationPlayer
	var animation_player = get_node("FumikoRun")  # Replace with the actual path to your AnimationPlayer

	# Play the "idle" animation
	animation_player.play("Running")


func _on_TweenDown_tween_completed(object, key):
	pass # Replace with function body.


func _on_Btn_Login_pressed():
	username = get_node("Username").text
	password = get_node("Password").text
	print("Username: ", username, "   Password: ", password)
	## Add authentication logic here
	var authenticationSuccess = true
	if authenticationSuccess:
		get_tree().change_scene("res://Scenes/Main.tscn")
	
