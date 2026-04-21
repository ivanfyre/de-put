extends Node2D
@export var main: Node2D
 
var hp: int= 50

func closest_enemy():
	var enemies = get_tree().get_nodes_in_group("enemies")
	var closest = null
	var range = INF
	for i in enemies:
		var d = global_position.distance_to(i.global_position)
		if d< range:
			range = d
			closest = i
	return closest
func attack():
	var enemy= closest_enemy()
	if enemy:
		enemy.take_dmg(40)
	print("shoot")


func hurt(amount: int):
	hp -= amount
	print("you missed lol")

	if hp<=0:
		die()

func die():
	print("you die")
	over()

func over():
	print("u suck")
	main.quit()
