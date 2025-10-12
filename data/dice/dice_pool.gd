class_name DicePool extends Node

@export var dice: Array[Die]

static func create() -> DicePool:
	var pool = new()
	pool.dice = [Die.create(6), Die.create(6)]
	return pool

func roll() -> int:
	return dice.map(func(d): return d.roll()).reduce(func(accum, number): return accum + number, 0)
