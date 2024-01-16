extends Node2D
var difficulty
onready var main_battle=get_node("/root/Main/CurrentScene/BattleScene")
# Get all the database id and the position of the enemies
func _ready():
	difficulty=main_battle.difficulty
	pass
func get_battle_data():
	var result = []
	for enemy_data in $Enemies.get_children():
		result.append({
			"id": enemy_data.enemy_code,
			"position": enemy_data.global_position
		})
	return result
