extends StaticBody2D
class_name Interactable

func interact():
	push_warning("%s has not implemented this function" % name)
	var dialogue = DialogueManager.create_resource_from_text("~ start \nNot implemented yet.")
	DialogueManager.show_example_dialogue_balloon(dialogue, "start")
