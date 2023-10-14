extends Button

var clicked = false


func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and clicked == false:
		var tween = get_node("TweenDown")  # Assuming the Tween node is a child of the parent node
		tween.interpolate_property(self, "rect_position", rect_position, Vector2(rect_position.x-60, rect_position.y + 70), 0.8,Tween.TRANS_BACK , Tween.EASE_IN_OUT)
		tween.start()
		clicked = true

func _on_TweenDown_tween_completed(object, key):
	if text == "Register":
		text = "Signup"
	else:
		text = "Register"



func _on_Btn_Goback_pressed():
	var tween = get_node("TweenDown")  # Assuming the Tween node is a child of the parent node
	tween.interpolate_property(self, "rect_position", rect_position, Vector2(rect_position.x+60, rect_position.y - 70), 0.8,Tween.TRANS_BACK , Tween.EASE_IN_OUT)
	tween.start()
	clicked = false
