extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Menu"):
		get_tree().change_scene_to_file("res://menu.tscn")
	if Global.lap >= 3:
		Global.Ptime = Global.LapTime
		get_tree().change_scene_to_file("res://menu.tscn")
		Global.LapTime = 0
		Global.lap = -1
