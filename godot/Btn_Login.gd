extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TweenDown_tween_started(object, key):
	var tween = get_node("TweenOpacity")
	tween.interpolate_property(self, "modulate", modulate, Color(0,0,0,0), 0.8,Tween.TRANS_BACK , Tween.EASE_IN_OUT)
	tween.start()
