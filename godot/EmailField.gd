extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		text = "" # Clear the text


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TweenOpacity_tween_completed(object, key):
	var tween = get_node("TweenVisible")
	tween.interpolate_property(self, "modulate", modulate, Color(1,1,1,1), 0.8,Tween.TRANS_BACK , Tween.EASE_IN_OUT)
	tween.start()
