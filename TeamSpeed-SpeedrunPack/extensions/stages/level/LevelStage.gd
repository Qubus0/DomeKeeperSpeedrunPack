extends "res://stages/level/LevelStage.gd"

var LOG_NAME := "TeamSpeed-SpeedrunPack:LevelStage"

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


func openPauseMenu():
	.openPauseMenu()

	var pause_menu: Node
	for node in get_tree().get_nodes_in_group("gamepadListeners"):
		if node.name == "PauseMenu":
			pause_menu = node

	if not pause_menu:
		ModLoaderLog.warning("Node PauseMenu not found", LOG_NAME)
		return

	var menu_panel := pause_menu.get_node("MenuPanel")
	if not menu_panel:
		ModLoaderLog.warning("Node MenuPanel not found under PauseMenu", LOG_NAME)
		return

	var vbox := menu_panel.get_node("VBoxContainer")
	if not vbox:
		ModLoaderLog.warning("Node VBoxContainer not found under MenuPanel", LOG_NAME)
		return

	var seed_label := Label.new()
	seed_label.text = "Seed: %s" % Level.levelSeed
	seed_label.align = Label.ALIGN_CENTER
	vbox.add_child(seed_label)


