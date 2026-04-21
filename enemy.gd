extends Node2D
@export var player: Node2D
@onready var bar: ProgressBar = $ProgressBar
var speed:int = 100
var hp: int= 40

func hpprog()-> void:
	bar.max_value=hp
	bar.value = hp

func take_dmg(amount: int) -> void:
	hp-= amount
	bar.value = hp
	if hp <=0:
		queue_free()
		print("someone died")
func _process(delta: float)-> void:
	
	position +=(player.global_position - global_position).normalized() * speed * delta
func _ready() -> void:
	add_to_group("enemies")
	hpprog()
