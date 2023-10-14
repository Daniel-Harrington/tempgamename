extends Control # Change this to match your scene structure

var email = ""
var username = ""
var password = ""




func _ready():
	# Get a reference to the AnimationPlayer
	
	var animation_player = get_node("FumikoRun")  # Replace with the actual path to your AnimationPlayer
	$Registration.connect("request_completed", self, "_on_request_completed")
	# Play the "idle" animation
	animation_player.play("Running")




func _on_Btn_Login_pressed():
	username = get_node("Username").text
	password = get_node("Password").text
	print("Username: ", username, "   Password: ", password)

	## Add authentication logic here
	var authenticationSuccess = true
	if authenticationSuccess:
		get_tree().change_scene("res://Scenes/Main.tscn")
	
	


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
	pass # Replace with function body.


func _on_Btn_Signup_pressed():
	if get_node("Btn_Signup").text == 'Register':
		$Registration.request("http://localhost:3000/api/users")
	
