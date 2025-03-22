extends Node

var save_path = "user://variable.save"

var P2 = false
var lap = 0
var LapTime = 0.0
var Ptime=0.0 #cel mai bun timp

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
