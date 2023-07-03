extends Node

var inventory : Array = []
const MAX_CAPACITY : int = 5

func is_full() -> bool:
	return len(inventory) >= MAX_CAPACITY

func add_item(item) -> void:
	if not is_full():
		inventory.append(item)
		
func remove_item(index : int) -> void:
	inventory.pop_at(index)
	
