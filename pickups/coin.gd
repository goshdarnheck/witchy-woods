extends Area2D

@export var items: Array[Resource] = [];

func _on_body_entered(body):
	if "player" in body:
		if (items):
			Manager.inventory.add_items(items);
		queue_free()
