extends CharacterBody2D
var fric = 500.0
#acceleration
#var acc=5.0
#velocity idk
#gears top speed
var gears2 =[20.0,62.8,78.5,100.0,122.0,157.5,220.0]
var torq2 = [20.0,10.0,5.6,4.4,3.6,2.8,2.0]

var gears1 =[20.0,34.0,51.0,68.0,85.0,102.0,120.0]
var gear=1
var gear1=34.0
var gear2=51.0
var gear3=68.0
var gear4=85.0
var gear5=102.0
var gear6=120.0
var topSpeed
var torq=5

var speed = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func friction (force,mult): #force = viteza maxima mult e multiply, lasa 1 pentru acceleratie normala
	speed -= Vector2(cos (speed.angle()) * speed.length()/force*mult*torq/5,sin (speed.angle()) * speed.length()/force*mult*torq/5)
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
func accel(acceler,directie):
	if(directie==1):
		speed += Vector2(cos (global_rotation) * acceler,sin (global_rotation) * acceler)
	else:
		speed -= Vector2(cos (global_rotation) * acceler,sin (global_rotation) * acceler)
func automatic():
	
	if(int(speed.length()/4)>=gears1[gear] and gear!=6):
		gear+=1
	if(int(speed.length()/4)<=gears1[gear-1] and gear!=1):
		gear-=1

func _physics_process(delta):
	Global.rotMasina = global_rotation
	if (Global.top_speed==120):
		if(gear==1):
			topSpeed=gear1
			torq = 17.5
		elif(gear==2):
			topSpeed=gear2
			torq = 12.0
		elif(gear==3):
			topSpeed=gear3
			torq = 7.0
		elif(gear==4):
			topSpeed=gear4
			torq = 5.0
		elif(gear==5):
			topSpeed=gear5
			torq = 3.0
		elif(gear==6):
			topSpeed=gear6
			torq = 2.0
		elif(gear==0):
			topSpeed=20.0
			torq=20.0
	elif(Global.top_speed==220):
		topSpeed=gears2[gear]
		torq = torq2[gear]
	#movement 
	Global.poz1Y = global_position.y
	Global.poz1X = global_position.x
	Global.rot1 = global_rotation
	var LabelP2 = "Lap %s"
	var lapp = str(Global.lap)
	get_node("Label3").text = LabelP2 % lapp
	var LabelT = "Time %s"
	get_node("Label4").text = LabelT % Global.LapTime
	var LabelTP = "Previous Time %s"
	get_node("Label5").text = LabelTP % Global.Ptime
	var Label6 = "Gear: %s"
	get_node("Label6").text = Label6 % gear
	var LabelP1 = "%s KM/H"
		#get_node("Label").text = LabelP1 % int(speed.length()/4)
	Global.speed_1 = LabelP1 % int(speed.length()/4)
	if Input.is_action_pressed("P1_Move_Up"):
		if(gear!=0):
			accel(torq,1) #5 e default
		else:
			accel(torq,2)
	if(Global.manual==false):
		if(int(speed.length()/4)>=gears1[gear] and gear!=6):
			gear+=1
		if(int(speed.length()/4)<=gears1[gear-1] and gear!=1):
			gear-=1
		#automatic()
	if Input.is_action_pressed("P1_Move_Down"):
		breaks(10.0)
		#friction(20.0);
	if(Global.manual==true):
		if Input.is_action_just_released("P1_gear_up") and gear!=6:
			gear+=1
		if Input.is_action_just_released("P1_gear_down") and gear !=0:
			gear-=1
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
	if Global.onGrass == true:
		friction(topSpeed,25/torq);
	else:
		friction(topSpeed,1);
