class_name PlayerData extends Node

var player_id: int = GlobalId.generate()
var _first_names: FirstNamesTable = FirstNamesTable.new()
var _last_names: LastNamesTable = LastNamesTable.new()
var _titles: TitlesTable = TitlesTable.new()

var _characters_history: Array[CharacterData] = []

func current_character() -> CharacterData:
	# TODO: how to handle null return in gdscript?
	return _characters_history[_characters_history.size() - 1]
	
func generate() -> CharacterData:
	var character = CharacterData.create(_first_names.roll(), _last_names.roll(), _titles.roll())
	_characters_history.append(character)
	return current_character()
