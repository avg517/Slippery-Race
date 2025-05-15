extends Node

var save_path = "user://variable.save"
#physics variable *throws up*
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
var gearr

#variabile de la masina
var rotMasina
var bot_touch

var manual = false #gearbox settings

func _ready():
	load_data()
	
	
#campaign variables
var money = 1.0
var moneyLap=100.0


func _process(delta: float) -> void:
	if Input.is_action_pressed("Menu"):
		get_tree().change_scene_to_file("res://menu.tscn")

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Ptime)
	file.store_var(money)
	file.store_var(manual)
	
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Ptime = file.get_var(Ptime)
		money = file.get_var(money)
		manual = file.get_var(manual)
	else:
		Ptime=0.0
		money = 0.0
		manual = true
