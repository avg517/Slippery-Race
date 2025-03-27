extends CharacterBody2D


var readyy = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_ui():
	var formatted_time = str(Global.LapTime)
	var decimal_index = formatted_time.find(".")
	
	if decimal_index > 0:
		formatted_time = formatted_time.left(decimal_index + 3)
		Global.LapTime = formatted_time
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Global.lap >= 1:
		Global.LapTime = float(Global.LapTime) + delta
		Global.moneyLap = Global.LapTime
		update_ui()
	if (Global.lap>=1):
		readyy = true
	
func _on_area_2d_body_entered(body):
	Global.lap += 1


func onGrass(body: Node2D) -> void:
	if readyy == true:
		Global.onGrass = true


func NotOnGrass(body: Node2D) -> void:
	Global.onGrass = false


	
