extends Control

func display():
	show()
	$Labels.display_score()


func _on_RetryButton_pressed():
	Global.retry()
