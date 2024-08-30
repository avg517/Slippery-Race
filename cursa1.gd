extends CharacterBody2D
var LapTime = 0.0
var lap = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_ui():
	var formatted_time = str(LapTime)
	var decimal_index = formatted_time.find(".")
	
	if decimal_index > 0:
		formatted_time = formatted_time.left(decimal_index + 3)
		LapTime = formatted_time
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if lap >= 1:
		LapTime = float(LapTime) + delta
		update_ui()
	if lap >= 10:
		get_tree().paused = true
	var LabelP1 = "Lap %s"
	get_node("Label").text = LabelP1 % lap
	var LabelT = "Time %s"
	get_node("Label2").text = LabelT % LapTime

func _on_area_2d_body_entered(body):
	lap += 1
