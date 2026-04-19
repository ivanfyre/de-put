extends Node2D

@onready var player= $Player
var enemy_2D = preload("res://enemy.tscn")
var round = 1
@onready var world = $world
var wave: int = 1
var waving = false
func wave_up():
	if waving:
		return
	if get_tree().get_nodes_in_group("enemies").is_empty():
		waving = true
		wave+= 1
		print("wave:", wave, " - ", "round: ", round)
		spawn_enemies()
		waving = false
func round_up():
	if wave>=5:
		round+=1
		wave = 1 
		print("wave:", wave, " - ", "round: ", round)
var spawn_rate: int = roundi((round*wave*1.5))
func _process(delta):
	wave_up()
	round_up()
	
func _ready():
	randomize()
	spawn_enemies()
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	
func camera_size():
	var cam:= get_viewport().get_camera_2d()
	var camsize:=  get_viewport_rect().size * cam.zoom
	var top_left:= cam.global_position - camsize/2 
	return Rect2(top_left, camsize)
func spawn_enemies():
	var rect = camera_size()
	var margin = 20
	for i in range(spawn_rate):
		var e = enemy_2D.instantiate()
		world.add_child(e)
		e.player = $Player
		e.global_position = Vector2(randf_range(rect.position.x - margin, rect.end.x + margin),
		randf_range(rect.position.y - margin, rect.end.y + margin))
		await wait(1.0)
		print("Enemies alive: ", get_tree().get_nodes_in_group("enemies").size())
func quit():
	get_tree().quit()
