class_name TitlesTable


var _random = RandomNumberGenerator.new()
var _names: Array[CharacterTitle] = [
	CharacterTitle.create("Corporal", "Cpl.", ""),
	CharacterTitle.create("Doctor", "Dr.", ""),
	CharacterTitle.create("Doctor of Philosophy", "", ", PhD"),
	CharacterTitle.create("Lieutaenant", "Lt.", ""),
	CharacterTitle.create("Lieutenant Colonel", "Lt. Col.", ""),
	CharacterTitle.create("Sergeant", "Sgt.", "")
]

func roll() -> CharacterTitle:
	var index = _random.randi_range(0, _names.size() - 1)
	return _names[index]
