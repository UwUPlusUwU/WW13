/obj/item/projectile/bullet/rifle/missile
	muzzle_type = /obj/effect/projectile/bullet/muzzle
	var/explosive = TRUE
	var/explosion_ranges = list(3,4,6,8)
	icon = 'icons/obj/grenade.dmi'
	icon_state = "missile"
	throwforce = 5
	damage = FALSE
	nodamage = TRUE
	embed = FALSE
	name = "missile"

/obj/item/projectile/bullet/rifle/missile/throw_impact(atom/hit_atom)
	missile_effect(hit_atom)

/obj/item/projectile/bullet/rifle/missile/proc/missile_effect(atom/hit_atom)
	if (explosive)
		var/e = explosion_ranges
		explosion(get_turf(hit_atom), e[3], e[4], e[6], e[8])
		if (src) qdel(src)