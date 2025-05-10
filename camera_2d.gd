extends Camera2D

var rot
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func smooth_transition(viteza):
	if(rot < Global.rotMasina+3.14159265358979323846264338327/2):
		global_rotation += viteza
	else:if(rot > Global.rotMasina+3.14159265358979323846264338327/2):
		global_rotation -= viteza
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rot = global_rotation
	#global_rotation = Global.rotMasina 
	#smooth_transition(0.001)
