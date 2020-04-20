extends Node2D

export(Resource) var spawnDetails
var shipResource

func _ready():
	if(spawnDetails):
		$Timer.connect("timeout", self, "_on_timeout")
	pass

func _on_timeout():
	print("Spawning")
	var shipResource = load(spawnDetails.shipPath)
	var spawnPoints = spawnDetails.spawnPoints
	for position in spawnPoints:
		var b = shipResource.instance()
		b.position = position
		get_parent().add_child(b)
	pass
