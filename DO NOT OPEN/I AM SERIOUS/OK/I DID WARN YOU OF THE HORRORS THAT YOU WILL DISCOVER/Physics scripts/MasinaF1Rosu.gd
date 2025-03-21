extends CharacterBody2D
var fric = 500.0
#acceleration
var acc=5.0
#velocity idk
var speed = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func friction (force):
	if speed.x > 0.0:
		speed.x -= force
	elif speed.x < -0.0:
		speed.x += force
	if speed.y > 0.0:
		speed.y -= force
	elif speed.y < -0.0:
		speed.y += force
func breaks(force):
	if(speed.x*cos (global_rotation) > 0 and speed.y *sin (global_rotation)>0):
		speed -= Vector2(cos (global_rotation) * force,sin (global_rotation) * force)#*(speed.length()/2)  *(speed.length()/2)
		#friction(30)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#movement 
	var LabelP1 = "%s KM/H"
	get_node("Label").text = LabelP1 % int(speed.length()/4)
	if Input.is_action_pressed("P1_Move_Up"):
		speed += Vector2(cos (global_rotation) * acc,sin (global_rotation) * acc)
	if Input.is_action_pressed("P1_Move_Down"):
		breaks(10.0)
		#friction(20.0);
	friction(2);
		
	velocity = speed
	move_and_slide()
	#rotation
	if Input.is_action_pressed("P1_Move_Right"):
		global_rotation_degrees += 5
	if Input.is_action_pressed("P1_Move_Left"):
		global_rotation_degrees -= 5
	var overlapping_mobs = %coll.get_overlapping_bodies()
	if (overlapping_mobs.size() > 1 and speed.x*cos (global_rotation) > 0 and speed.y *sin (global_rotation)>0):
		speed -= Vector2(cos (global_rotation) * 100.0,sin (global_rotation) * 100.0)
	#menuEntering
