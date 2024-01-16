extends Node

var difficulty = 0
var scenes = {
	"battle_scene": preload("res://src/scenes/BattleScene.tscn")
}

var battle_scene_instance = null

func _ready():
	_load_scene("battle_scene")

func _load_scene(new_scene_key):
	if scenes.has(new_scene_key):
		# Remove the previous instance of the battle scene if it exists
		if battle_scene_instance:
			battle_scene_instance.queue_free()

		# Load and instance the new battle scene
		battle_scene_instance = scenes[new_scene_key].instance()
		battle_scene_instance.connect("change_scene", self, "_load_scene")
		battle_scene_instance.connect("battle_won", self, "_on_battle_won")
		$CurrentScene.add_child(battle_scene_instance)

func _on_battle_won():
	difficulty += 1
	print("Difficulty:", difficulty)
	# Reset the battle scene by reloading it
	_load_scene("battle_scene")
