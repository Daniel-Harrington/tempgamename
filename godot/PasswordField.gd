extends LineEdit

var initialfocus = true

func _on_Password_focus_entered():
	if initialfocus:
		text = "" # Clear the text
		secret = true  # Enable the secret (password) mode
		initialfocus == false
