extends Node2D
@export var player: Node2D
var speed = 100
var hp = 40
func take_dmg(amount):
	hp-= amount
	if hp <=0:
		queue_free()
		print("someone died")
func _process(delta: float):
	
	position +=(player.global_position - global_position).normalized() * speed * delta
func _ready():
	add_to_group("enemies")
