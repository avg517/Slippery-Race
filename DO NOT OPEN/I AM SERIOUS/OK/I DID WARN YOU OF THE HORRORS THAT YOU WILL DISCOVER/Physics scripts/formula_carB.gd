extends CharacterBody2D
var fric = 500.0
#acceleration
var acc=5.0
#velocity idk
var speed = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.P2 == false:
		visible = false
		global_position = Vector2(1000,1000)
	else:
		visible = true
		global_position = Vector2(-38,-216)
func breaks (force):
	if speed.x > 0.0:
		speed.x -= force
	elif speed.x < -0.0:
		speed.x += force
	if speed.y > 0.0:
		speed.y -= force
	elif speed.y < -0.0:
		speed.y += force

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#movement 
	var LabelP1 = "%s KM/H"
	get_node("Label").text = LabelP1 % int(speed.length()/2)
	if Input.is_action_pressed("P2_Move_Up"):
		speed += Vector2(cos (global_rotation) * acc,sin (global_rotation) * acc)
	##frane
	if Input.is_action_pressed("P2_Move_Down"):
		breaks(20.0)
	breaks(1)
		
	velocity = speed
	move_and_slide()
	#rotation
	if Input.is_action_pressed("P2_Move_Right"):
		global_rotation_degrees += 5
	if Input.is_action_pressed("P2_Move_Left"):
		global_rotation_degrees -= 5
	var overlapping_mobs = %coll.get_overlapping_bodies()
	if overlapping_mobs.size() > 1:
		speed = Vector2(0,0)
