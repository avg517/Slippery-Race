extends CharacterBody2D

var redy = false
var touch = $PathDetect.get_overlapping_bodies()
func _physics_process(delta: float) -> void:
	if(redy==true):
		if(touch>=1):
			Global.bot_touch=true
		else:
			Global.bot_touch=false
