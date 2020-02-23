#StartMenu.gd
extends Control


func _on_StartGameButton_pressed():
	get_tree().change_scene("res://World.tscn") #On Start Press, opens world 1


func _on_QuitGameButton_pressed():
	get_tree().quit() # On Quit Press closes game
