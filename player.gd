extends Node2D
@export var main: Node2D
 
var hp: int= 50

func closest_enemy() -> Node2D:
	var enemies: Array = get_tree().get_nodes_in_group("enemies")
	var closest: Node2D = null
	var radius: float = INF
	for i: Node2D in enemies:
		var d: float = global_position.distance_to(i.global_position)
		if d < radius:
			radius = d
			closest = i
	return closest
func attack() -> void: 
	var enemy: Node2D = closest_enemy()
	if enemy:
		enemy.take_dmg(5)
	print("shoot")


func hurt(amount: int) -> void:
	hp -= amount
	print("you missed lol")

	if hp<=0:
		die()

func die() -> void:
	print("you die")
	over()

func over() -> void:
	print("u suck")
	main.quit()
