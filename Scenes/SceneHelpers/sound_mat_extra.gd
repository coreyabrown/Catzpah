extends RigidBody3D

enum SoundMat {
	CARDBOARD,
	CERAMIC,
	FOOD,
	LAMP,
	METAL,
	NOTEBOOK,
	PILLBOTTLE,
	PLASTIC,
	POTTEDPLANT,
	TOILETPAPER,
	WOOD
}

@export_group("Sound Material")
@export var sound_material: SoundMat = SoundMat.PLASTIC
