extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.onGrass = false
	Global.lap = 0
	int(Global.money)
	print(Global.money)

func _physics_process(delta: float) -> void:
	get_node("FormulaCar/Label2").text = str(Global.speed_1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.lap > 3:
		if(Global.manual==true):
			Global.money += 1000/Global.moneyLap
		else:
			Global.money += (1000/Global.moneyLap)/2
		int(Global.money)
		Global.Ptime = Global.LapTime
		Global.save()
		print(Global.money)
		get_tree().change_scene_to_file("res://menu.tscn")
		Global.LapTime = 0
		Global.lap = 0
	
