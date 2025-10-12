class_name TitlesTable extends Node


var _random = RandomNumberGenerator.new()
var _names: Array[CharacterClass] = [
	CharacterClass.create("Doctor", "Dr.", ""),
	CharacterClass.create("Barbarian", "", "the Barbarian")
]

func roll() -> CharacterClass:
	var index = _random.randi_range(0, _names.size() - 1)
	return _names[index]
