extends Node

var save_path = "user://variable.save"

var P2 = false
var lap = 0
var LapTime = 0.0
var Ptime=0.0 #cel mai bun timp
var onGrass = false
var speed_1 = 0
var top_speed = 120.0
var acc =5.0
var poz1Y
var poz1X
var rot1
func _ready():
	load_data()

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Ptime)
	
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Ptime = file.get_var(Ptime)
	else:
		Ptime=0.0
