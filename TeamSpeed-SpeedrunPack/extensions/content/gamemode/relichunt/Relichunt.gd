extends "res://content/gamemode/relichunt/Relichunt.gd"


func init() -> void:
	.init() # Call original init func
	Level.hud.addHudElement({"hud": "mods-unpacked/TeamSpeed-SpeedrunPack/TimerPanel.tscn" })

