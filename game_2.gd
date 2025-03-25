extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.onGrass = false

func _physics_process(delta: float) -> void:
	get_node("FormulaCar/Label2").text = str(Global.speed_1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Menu"):
		get_tree().change_scene_to_file("res://menu.tscn")
	if Global.lap > 3:
		Global.Ptime = Global.LapTime
		Global.save()
		get_tree().change_scene_to_file("res://menu.tscn")
		Global.LapTime = 0
		Global.lap = 0
