extends CharacterBody2D
var fric = 500.0
#acceleration
var acc=5.0
#velocity idk
var speed = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func friction (force): #force = viteza maxima
	speed -= Vector2(cos (speed.angle()) * speed.length()/force,sin (speed.angle()) * speed.length()/force)
	#if speed.x > 0.0:
	#	speed.x -= force
	#elif speed.x < -0.0:
	#	speed.x += force
	#if speed.y > 0.0:
	#	speed.y -= force
	#elif speed.y < -0.0:
	#	speed.y += force
func breaks(force):
	if(speed.x*cos (speed.angle()) > 0 and speed.y *sin (speed.angle())>0):
		speed -= Vector2(cos (speed.angle()) * force,sin (speed.angle()) * force)
		#friction(0.5)
		#friction(30)
	
func rotatee(direction,speedd): #right =1
	if(direction==1):
		global_rotation_degrees += speedd#/(speed.length()/2 + 0.1) -1
	elif(direction==0):
		global_rotation_degrees -= speedd#/(speed.length()/2+ 0.1)-1
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
	friction(100);
		
	velocity = speed
	move_and_slide()
	#rotation
	if Input.is_action_pressed("P1_Move_Right"):
		rotatee(1,4)#global_rotation_degrees += 10/speed.length()
	if Input.is_action_pressed("P1_Move_Left"):
		rotatee(0,4)#global_rotation_degrees -= 10/speed.length()
	var overlapping_mobs = %coll.get_overlapping_bodies()
	if (overlapping_mobs.size() > 1 and speed.x*cos (global_rotation) > 0 and speed.y *sin (global_rotation)>0):
		speed -= Vector2(cos (speed.angle()) * 100.0,sin (speed.angle()) * 100.0)
	#menuEntering
