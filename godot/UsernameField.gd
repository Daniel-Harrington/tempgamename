extends LineEdit

var initialfocus = true
func _on_Username_focus_entered():
	if initialfocus:
		text = "" # Clear the text
		initialfocus = false
