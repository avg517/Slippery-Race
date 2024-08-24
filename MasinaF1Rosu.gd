extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var speed = Vector2(1,0)
	if Input.is_action_pressed("P1_Move_Up"):
		speed.x += 100/speed.length()
	velocity = speed
	move_and_slide()
