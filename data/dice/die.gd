class_name Die extends Node

@export var sides: int = 6
var _random = RandomNumberGenerator.new()

static func create(num_sides: int) -> Die:
	var die = new()
	die.sides = num_sides
	return die

func roll() -> int:
	return _random.randi_range(1, sides)
