extends CharacterBody2D
#speed += Vector2(cos (global_rotation) * acceler,sin (global_rotation) * acceler)   miscarea 
var redy = false
var touch = $PathDetect.get_overlapping_bodies()
var speed
var angle_to_waypoint

func accel(acceler):
	speed += Vector2(cos (global_rotation) * acceler,sin (global_rotation) * acceler)
func _physics_process(delta: float) -> void:
	if(redy==true):
		if(touch>=1):
			Global.bot_touch=true
		else:
			Global.bot_touch=false
		velocity = speed
		angle_to_waypoint = global_position.angle_to($Path2D/PathFollow2D/Area2D/CollisionShape2D.position)
		
