/obj/structure/grille/fence
	name = "fence"
	desc = "An old wooden fence."
	icon = 'icons/obj/fence.dmi'
	icon_state = "1"
	health = 16
	hitsound = 'sound/effects/wooddoorhit.ogg'

/obj/structure/grille/fence/New()
	..()
	icon_state = "[rand(1,3)]"
	color = "#c8c8c8"

/obj/structure/anti_tank
	icon_state = "anti-tank"
	bound_width = 32
	bound_height = 32
	density = TRUE
	anchored = TRUE
	name = "anti-tank structure"

/obj/structure/anti_tank/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/wrench))
		if (anchored)
			user.visible_message("<span class = 'notice'>\The [user] starts to disassemble \the [src] with [W].</span>")
			if (!do_after(user,60))
				user.visible_message("<span class = 'notice'>\The [user] decides not to disassemble \the [src].</span>")
				return
			user.visible_message("<span class = 'notice'>\The [user] finishes disassembling \the [src]!</span>")
			playsound(loc, 'sound/items/Wirecutter.ogg', 50, TRUE)
			qdel(src)
			return
/obj/structure/anti_tank/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (istype(mover, /obj/item/projectile))
		if (prob(20))
			return TRUE
		else
			visible_message("<span class = 'warning'>The [mover.name] riochetes off of the [name]!</span>")
			return FALSE
	return FALSE

/obj/structure/anti_tank/ex_act(severity)
	switch(severity)
		if (1.0)
			qdel(src)
			return
		if (2.0)
			if (prob(25))
				qdel(src)
				return
		if (3.0)
			return

/obj/structure/campfire
	icon = 'icons/obj/campfire.dmi'
	icon_state = "campfire20"
	layer = MOB_LAYER - 0.01
	density = FALSE
	var/activeFire = FALSE
	anchored = TRUE


/obj/structure/campfire/attackby(obj/item/W as obj, mob/user as mob)
	if (!activeFire)
		if (istype(W, /obj/item/weapon/flame))
			user.visible_message("<span class = 'notice'>\The [user] lights \the [src] with [W].</span>")
			icon_state = "campfire21"
			set_light(4)
			activeFire = TRUE
	if (activeFire)
		if (istype(W, /obj/item/weapon/flame))
			return
		else
			user.visible_message("<span class = 'notice'>\The [user] puts out \the [src] with [W].</span>")
			icon_state = "campfire20"
			set_light(0)
			activeFire = FALSE

/obj/structure/flag
	icon = 'icons/obj/flags.dmi'
	layer = MOB_LAYER + 0.01
	density = FALSE
	anchored = TRUE

/obj/structure/flag/ex_act(severity)
	switch(severity)
		if (1.0)
			qdel(src)
			return
		if (2.0)
			if (prob(66))
				qdel(src)
				return
		if (3.0)
			return

/obj/structure/flag/soviet
	icon_state = "soviet"
	name = "Soviet Flag"

/obj/structure/flag/german
	icon_state = "german"
	name = "German Flag"

/obj/structure/flag/italian
	icon_state = "italian"
	name = "Italian Flag"

/obj/structure/flag/ukrainian
	icon_state = "ukrainian"
	name = "Ukrainian Flag"

/obj/structure/flag/japanese
	icon_state = "japanese"
	name = "Japanese Flag"

/obj/structure/flag/us
	icon_state = "us"
	name = "USA Flag"

/obj/structure/flag/polish
	icon_state = "polish"
	name = "Polish Flag"

/obj/structure/noose
	icon = 'icons/obj/noose.dmi'
	icon_state = ""
	layer = MOB_LAYER + 1.0
	anchored = TRUE
	var/mob/living/carbon/human/hanging = null

/obj/structure/noose/New()
	..()
	processing_objects |= src

/obj/structure/noose/Del()
	processing_objects -= src
	..()

/obj/structure/noose/bullet_act(var/obj/item/projectile/P)
	if (hanging)
		hanging.bullet_act(P)
		visible_message("<span class = 'danger'>[hanging] is hit by the [P.name]!</span>")
	else
		..()

/obj/structure/noose/process()
	fire()

// call this instead of process() if you want to do direct calls, I think its better - Kachnov
/obj/structure/noose/proc/fire()
	if (hanging)
		hanging.forceMove(loc)
		density = TRUE
		hanging.dir = SOUTH
		hanging.pixel_y = 3 // because getting punched resets it
		icon_state = "noose-hanging"

		if (pixel_x == 0)
			pixel_x = 1
		else if (pixel_x == 1)
			pixel_x = 0
		else if (pixel_x == 0)
			pixel_x = -1
		else // somehow
			pixel_x = 0

		hanging.pixel_x = pixel_x

		if (hanging.stat != DEAD)
			hanging.adjustOxyLoss(5)
			if (prob(5))
				visible_message("<span class = 'danger'>[hanging]'s neck snaps.</span>")
				playsound(loc, 'sound/effects/gore/bullethit3.ogg')
				hanging.death()
			else if (prob(33))
				hanging << "<span class = 'danger'>You're suffocating!</span>"
	else
		icon_state = ""
		density = FALSE

/obj/structure/noose/MouseDrop_T(var/atom/dropping, var/mob/user as mob)
	if (!ismob(dropping))
		return

	if (hanging)
		return

	var/mob/living/carbon/human/target = dropping
	var/mob/living/carbon/human/hangman = user

	if (!istype(target) || !istype(hangman))
		return

	visible_message("<span class = 'danger'>[hangman] starts to hang [target == hangman ? "themselves" : target]...</span>")
	if (do_after(hangman, 50, target))
		if (src)
			visible_message("<span class = 'danger'>[hangman] hangs [target == hangman ? "themselves" : target]!</span>")
			hanging = target
			target.loc = get_turf(src)
			target.dir = SOUTH
			fire()

/obj/structure/noose/attack_hand(var/mob/living/carbon/human/H)
	if (!istype(H))
		return

	if (!hanging)
		return

	if (hanging == H)
		return

	visible_message("<span class = 'danger'>[H] starts to free [hanging] from the noose...</span>")
	if (do_after(H, 75, src))
		if (src)
			visible_message("<span class = 'danger'>[H] frees [hanging] from the noose!</span>")
			hanging.pixel_x = 0
			hanging.pixel_y = 0
			hanging = null