class_name TitlesTable extends Node


var _random = RandomNumberGenerator.new()
var _names: Array[CharacterTitle] = [
	CharacterTitle.create("Doctor", "Dr.", ""),
	CharacterTitle.create("Lieutenant", "Lt.", ""),
	CharacterTitle.create("Lieutenant Colonel", "Lt. Col.", ""),
	CharacterTitle.create("Doctor of Philosophy", "", ", PhD")
]

func roll() -> CharacterTitle:
	var index = _random.randi_range(0, _names.size() - 1)
	return _names[index]
