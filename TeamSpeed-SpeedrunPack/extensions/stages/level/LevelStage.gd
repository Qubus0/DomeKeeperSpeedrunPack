extends "res://stages/level/LevelStage.gd"


func _input(event: InputEvent) -> void:
	var key_event := event as InputEventKey
	if key_event:
		if key_event.scancode == KEY_R and not key_event.is_echo():
			GameWorld.keptGadgetUsed = false

			Audio.sound("gui_loadout_startrun")
			var startData = LevelStartData.new()
			startData.loadout = GameWorld.loadoutStageConfig.duplicate()

			StageManager.startStage("stages/landing/landing", [startData])
