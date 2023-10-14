extends LineEdit

var initialfocus = true

func _on_TweenOpacity_tween_completed(object, key):
	var tween = get_node("TweenVisible")
	tween.interpolate_property(self, "modulate", modulate, Color(1,1,1,1), 0.8,Tween.TRANS_BACK , Tween.EASE_IN_OUT)
	tween.start()


func _on_Email_focus_entered():
	if initialfocus:
		text = ""
		initialfocus == false
