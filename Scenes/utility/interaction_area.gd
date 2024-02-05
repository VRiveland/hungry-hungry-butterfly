extends Area2D
class_name InteractionArea

@export var action_name: String = "Eat"

var interact: Callable = func():
	pass


func _on_body_entered(body):
	InteractonManager.register_area(self)


func _on_body_exited(body):
	InteractonManager.unregister_area(self)
