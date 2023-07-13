extends "res://stages/level/LevelStage.gd"


func _input(event: InputEvent) -> void:
	var key_event := event as InputEventKey
	if not key_event:
		return

	if key_event.scancode == KEY_R and not key_event.is_echo():
		if not key_event.alt:
			Level.randomizeSeed()

		GameWorld.keptGadgetUsed = false  # keep the gadget every time

		Audio.sound("gui_loadout_startrun")
		var startData = LevelStartData.new()
		startData.loadout = GameWorld.loadoutStageConfig.duplicate()

		StageManager.startStage("stages/landing/landing", [startData])

