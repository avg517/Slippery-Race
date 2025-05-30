extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#-153 x 1 #-429y1
#487 x2 #1521y2


#Global.poz1Y + (1521 -
#Global.poz1X + (487-(
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y = -1109 + Global.poz1X
	global_position.x = 1253 - Global.poz1Y
	#global_rotation = Global.rot1
