extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Global.smooth_camera== true):
		$Automatic/smooth_camera.set_texture("res://Draws/Smooth_camera_on.png") #doesn't work
	else:
		$Automatic/smooth_camera.set_texture("res://Draws/Smooth_camera_off.png")


func _on_automatic_pressed() -> void:
	if(Global.smooth_camera== false):
		Global.smooth_camera= true
	else:
		Global.smooth_camera= false
