extends PathFollow2D

var speed: float = 100.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var curve = get_parent().get_curve()
	if(Global.bot_touch==true):
		progress += delta*10
	if progress > curve.get_baked_length():
		progress = 0.0
