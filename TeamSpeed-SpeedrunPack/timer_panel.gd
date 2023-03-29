extends HudElement

# used to offset the delay before the endscreen becomes visible,
# as that is the official time when the speedrun ends
var speedrunEndCooldown := 12.5 - 5.2

func _process(delta: float) -> void:
	if GameWorld.gameover and speedrunEndCooldown > 0:
		speedrunEndCooldown -= delta
	elif GameWorld.gameover:
		return

	var time_s := GameWorld.runTime
	var minutes := int(time_s / 60)
	var seconds := int(fmod(time_s, 60))
	var milliseconds := int((time_s - int(time_s)) * 1000)
	($"%Timer" as Label).text = "%02d:%02d.%02d" % [minutes, seconds, milliseconds/10]

