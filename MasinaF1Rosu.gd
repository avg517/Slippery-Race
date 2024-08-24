extends CharacterBody2D

var acc=100.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#movement
	var speed = Vector2(0,0)
	if Input.is_action_pressed("P1_Move_Up"):
		speed.x += 100/acc
		acc = acc / 1.1
	else:
		acc = 100.0
	velocity = speed
	move_and_slide()
	#rotation
	if Input.is_action_pressed("P1_Move_Right"):
		global_rotation_degrees += 5
	if Input.is_action_pressed("P1_Move_Left"):
		global_rotation_degrees -= 5
