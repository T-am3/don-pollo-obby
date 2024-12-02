extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0

func _ready() -> void:
	$"LinGanGuliGuli(christmasEdition)ByDonPollo[75LqVtyV00k]".play()
	
func _process(delta: float) -> void:
	if randi_range(0,500) == 50:
		$"UmeoMamiHente-DonPolloAhhSoundEffect[giT-ugFlMt4]".play()
		$A.visible = true
		await get_tree().create_timer(.1).timeout
		$A.visible = false
	elif randi_range(0,500) == 49:
		$"DonPolloSoundEffect[laSvvRa36je]".play()
	elif randi_range(0,500) == 40:
		$who.visible = true
		await get_tree().create_timer(.1).timeout
		$who.visible = false
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if global_position.y > 116:
		get_tree().quit()
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(5).timeout
	velocity.y = 5000
	await get_tree().create_timer(1).timeout
