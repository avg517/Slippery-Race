extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_ui():
	var formatted_time = str(Global.LapTime) #4721
	var decimal_index = formatted_time.find(".")
	
	if decimal_index > 0:
		formatted_time = formatted_time.left(decimal_index + 3)
		Global.LapTime = formatted_time
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Global.lap >= 1:
		Global.LapTime = float(Global.LapTime) + delta
		update_ui()

	var LabelP1 = "Lap %s"
	get_node("Label").text = LabelP1 % Global.lap
	var LabelT = "Time %s"
	get_node("Label2").text = LabelT % Global.LapTime
	var LabelTP = "Previous Time %s"
	get_node("Label3").text = LabelTP % Global.Ptime
func _on_area_2d_body_entered(body):
	Global.lap += 1
