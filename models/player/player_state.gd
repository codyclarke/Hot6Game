class_name PlayerState extends Node

var _first_names: FirstNamesTable = FirstNamesTable.new()
var _last_names: LastNamesTable = LastNamesTable.new()

var _characters_history: Array[CharacterState] = []

func current_character() -> CharacterState:
	# TODO: how to handle null return in gdscript?
	return _characters_history[_characters_history.size() - 1]
	
func generate() -> CharacterState:
	var character = CharacterState.create(_first_names.roll(), _last_names.roll())
	_characters_history.append(character)
	return current_character()
