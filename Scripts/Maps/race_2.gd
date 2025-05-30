extends CharacterBody2D
var peer =ENetMultiplayerPeer.new()
@export var player_scene: PackedScene
@onready var cam = $Camera2D
# Called when the node enters the scene tree for the first time.


	
func _process(delta: float) -> void:
	if Input.is_action_pressed("join_mp"):
		peer.create_client("localhost",123)
		multiplayer.multiplayer_peer = peer
		cam.enabled = false
	if Input.is_action_pressed("host_mp"):
		peer.create_server(123)
		multiplayer.multiplayer_peer = peer
		multiplayer.peer_connected.connect(add_player)
		add_player()
		cam.enabled = false
		
	
	

func add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)



	
func exit_game(id):
	multiplayer.peer_disconnected.connect(del_player)
	del_player(id)
	
func del_player(id):
	rpc("_del_player",id)
@rpc("any_peer","call_local") func _del_player(id):
	get_node(str(id)).queue_free()

	


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


	
