class_name TestPlayer extends GdUnitTestSuite

var player_scene: GdUnitSceneRunner

func before_test() -> void:
	player_scene = scene_runner('res://scenes/player.tscn')

func after_test() -> void:
	print_orphan_nodes()

func test_player_has_name_displayed():
	var char_data: CharacterData = player_scene.get_property('character_data')
	var char_name: String = char_data.full_name()
	var label: Label = player_scene.find_child('NameLabel')
	assert_str(label.text).is_equal(char_name)
