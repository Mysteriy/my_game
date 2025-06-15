extends CharacterBody2D

const SPEED := 500

@export var ataque_player: PackedScene

func _physics_process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("andar_cima"):
		velocity.y -= 1
	if Input.is_action_pressed("andar_baixo"):
		velocity.y += 1
	if Input.is_action_pressed("andar_direita"):
		velocity.x += 1
	if Input.is_action_pressed("andar_esquerda"):
		velocity.x -= 1
	
	velocity = velocity.normalized() * SPEED
	move_and_slide()

func _process(delta: float):
	if Input.is_action_just_pressed("ataque"):
		var ataque = ataque_player.instantiate()
		ataque.global_position = global_position
		get_tree().current_scene.add_child(ataque)
		
