/* Uniform Metadata: Soviet, German, Italian */

#define SOVIET_UNIFORM_NAME "Soviet uniform"
#define SOVIET_UNIFORM_DESC "A standard issue Soviet uniform issued to Red Army soldiers."
#define SOVIET_UNIFORM_STATE "sovuni"

#define GERMAN_UNIFORM_NAME "German uniform"
#define GERMAN_UNIFORM_DESC "A standard issue German uniform issued to Wehrmacht soldiers. It looks sturdy and strictly folded."
#define GERMAN_UNIFORM_STATE "geruni"

#define ITALIAN_UNIFORM_NAME "Italian uniform"
#define ITALIAN_UNIFORM_DESC "A standard issue Italian uniform issued to Italian soldiers fighting alongside the Wehrmacht."
#define ITALIAN_UNIFORM_STATE "itauni"

/* Helmet Metadata: Soviet, German, Italian */

#define SOVIET_HELMET_NAME "Soviet helmet"
#define SOVIET_HELMET_DESC "A standard issue helmet of the Red Army. Provides some protection against both the elements and flying shrapnel."
#define SOVIET_HELMET_STATE "sovhelm"

#define GERMAN_HELMET_NAME "German helmet"
#define GERMAN_HELMET_DESC "A standard issue helmet of the Wehrmacht. Provides some protection against both the elements and flying shrapnel."
#define GERMAN_HELMET_STATE "gerhelm"

#define ITALIAN_HELMET_NAME "Italian helmet"
#define ITALIAN_HELMET_DESC "A standard issue helmet of the Italian Army. Provides some protection against both the elements and flying shrapnel."
#define ITALIAN_HELMET_STATE "itahelm"

/obj/item/clothing/under
	var/swapped = FALSE

/obj/item/clothing/under/proc/add_alternative_setting()
	verbs += /obj/item/clothing/under/proc/Swap

/obj/item/clothing/under/proc/Swap()
	set category = null
	var/mob/living/carbon/human/m = loc
	if (m && istype(m) && m.is_spy)

		if (name == GERMAN_UNIFORM_NAME)
			transform2soviet()
		else if (name == SOVIET_UNIFORM_NAME)
			transform2german()

		if (istype(src, /obj/item/clothing/under/geruni))
			switch (name)
				if (SOVIET_UNIFORM_NAME)
					m << "<span class = 'danger'>You change back into your original uniform. Long live mother Russia!</span>"
				if (GERMAN_UNIFORM_NAME)
					m << "<span class = 'danger'>You change back into your spy uniform.</span>"
		else if (istype(src, /obj/item/clothing/under/sovuni))
			if (GERMAN_UNIFORM_NAME)
				m << "<span class = 'danger'>You change back into your original uniform. Sieg heil!</span>"
			if (SOVIET_UNIFORM_NAME)
				m << "<span class = 'danger'>You change back into your spy uniform.</span>"

	return FALSE

/obj/item/clothing/under/proc/transform2soviet()

	name = SOVIET_UNIFORM_NAME
	desc = SOVIET_UNIFORM_DESC
	icon_state = SOVIET_UNIFORM_STATE
	item_state = SOVIET_UNIFORM_STATE
	worn_state = SOVIET_UNIFORM_STATE
	item_state_slots["slot_w_uniform"] = SOVIET_UNIFORM_STATE
	update_clothing_icon()

	var/mob/living/carbon/human/H = loc
	if (istype(H.s_store, /obj/item/radio/feldfu))
		var/radio = H.s_store
		H.drop_from_inventory(radio)
		qdel(radio)
		H.equip_to_slot_or_del(new /obj/item/radio/rbs(H), slot_s_store)
	if (istype(H.head, /obj/item/clothing/head/helmet/gerhelm))
		var/obj/item/clothing/head/helmet/gerhelm/head = H.head
		head.transform2soviet()

/obj/item/clothing/under/proc/transform2german()

	name = GERMAN_UNIFORM_NAME
	desc = GERMAN_UNIFORM_DESC
	icon_state = GERMAN_UNIFORM_STATE
	item_state = GERMAN_UNIFORM_STATE
	worn_state = GERMAN_UNIFORM_STATE
	item_state_slots["slot_w_uniform"] = GERMAN_UNIFORM_STATE
	update_clothing_icon()

	var/mob/living/carbon/human/H = loc
	if (istype(H.s_store, /obj/item/radio/rbs))
		var/radio = H.s_store
		H.drop_from_inventory(radio)
		qdel(radio)
		H.equip_to_slot_or_del(new /obj/item/radio/feldfu(H), slot_s_store)
	if (istype(H.head, /obj/item/clothing/head/helmet/sovhelm))
		var/obj/item/clothing/head/helmet/sovhelm/head = H.head
		head.transform2german()

/obj/item/clothing/under/geruni
	name = GERMAN_UNIFORM_NAME
	desc = GERMAN_UNIFORM_DESC
	icon_state = GERMAN_UNIFORM_STATE
	item_state = GERMAN_UNIFORM_STATE
	worn_state = GERMAN_UNIFORM_STATE
	var/rolled = FALSE

/obj/item/clothing/under/geruni/New()
	..()
	if (map && map.ID == MAP_GAZALA)
		icon_state = "afgeruni"
		item_state = "afgeruni"
		worn_state = "afgeruni"
		item_state_slots["slot_w_uniform"] = "afgeruni"
/obj/item/clothing/under/geruni/gerofficer
	name = "german officer's uniform"
	desc = "A fancier, more pressed uniform of the Nazi Army, given to German officers. It has a feel of pride and authority."
	icon_state = "falluni"
	item_state = "geruniofficer"
	worn_state = "geruniofficer"

/obj/item/clothing/under/geruni/gerofficer/New()
	..()
	if (map && map.ID == MAP_GAZALA)
		icon_state = "afgerofficer"
		item_state = "afgerofficer"
		worn_state = "afgerofficer"
		item_state_slots["slot_w_uniform"] = "afgerofficer"
/obj/item/clothing/under/geruni/kriegsmarine
	name = "Kriegsmarine sailor uniform"
	desc = "A dark blue uniform of the Kriegsmarine."
	icon_state = "kriegsmarine"
	item_state = "kriegsmarine"
	worn_state = "kriegsmarine"

/obj/item/clothing/under/geruni/MP
	name = "german MP's uniform"
	desc = "A fancier, more pressed uniform of the Nazi Army, given to German military police."
	icon_state = "geruni_MP"
	item_state = "geruni_MP"
	worn_state = "geruni_MP"


/obj/item/clothing/under/firefighter
	name = "firefighter's uniform"
	desc = "A fancier, more pressed uniform."
	icon_state = "germanfirefighteruniform"
	item_state = "germanfirefighteruniform"
	worn_state = "germanfirefighteruniform"

/obj/item/clothing/under/reporter
	name = "War Correspondants's uniform"
	desc = "A fancier, more pressed uniform."
	icon_state = "Germanwarcorrespondantuniform"
	item_state = "Germanwarcorrespondantuniform"
	worn_state = "Germanwarcorrespondantuniform"


/obj/item/clothing/under/firefighteroff
	name = "firefighter's uniform"
	desc = "A fancier, more pressed uniform."
	icon_state = "germanfirefighteruniform"
	item_state = "germanfirefighteruniform"
	worn_state = "germanfirefighteruniform"



/obj/item/clothing/under/geruni/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/geruni)
		return // no sprites - Kachnov
	if (map && map.ID == MAP_GAZALA)
		if (rolled)
			item_state = "afgeruni"
			worn_state = "afgeruni"
			item_state_slots["slot_w_uniform"] = "afgeruni"
			usr << "<span class = 'danger'>You roll down your uniform's sleeves.</span>"
			rolled = FALSE
		else if (!rolled)
			item_state = "afgerunirolledup"
			worn_state = "afgerunirolledup"
			item_state_slots["slot_w_uniform"] = "afgerunirolledup"
			usr << "<span class = 'danger'>You roll up your uniform's sleeves.</span>"
			rolled = TRUE

	else
		if (rolled)
			item_state = "geruni"
			worn_state = "geruni"
			item_state_slots["slot_w_uniform"] = "geruni"
			usr << "<span class = 'danger'>You roll down your uniform's sleeves.</span>"
			rolled = FALSE
		else if (!rolled)
			item_state = "gerunirolledup"
			worn_state = "gerunirolledup"
			item_state_slots["slot_w_uniform"] = "gerunirolledup"
			usr << "<span class = 'danger'>You roll up your uniform's sleeves.</span>"
			rolled = TRUE
	update_clothing_icon()

/obj/item/clothing/under/geruni/general
	name = "Heer General uniform"
	desc = "A comfortable and sturdy high-ranking officer's uniform."
	icon_state = "gerunigeneral"
	item_state = "gerunigeneral"
	worn_state = "gerunigeneral"

/obj/item/clothing/under/geruni/ghillie
	name = "german ghilli suit"
	desc = "A sneaky sneaky ghillie suit."
	icon_state = "ger_ghillie"
	item_state = "ger_ghillie"
	worn_state = "ger_ghillie"


/obj/item/clothing/under/geruni/falluni
	name = "Fallschirmjager uniform"
	desc = "A standard issue german uniform for Fallschirmjagers. This one is quite comfy and sturdy."
	icon_state = "falluni"
	item_state = "falluni"
	worn_state = "falluni"

/obj/item/clothing/under/geruni/ssuni
	name = "SS uniform"
	desc = "A black uniform issued to SchutzStaffel soldiers. Sturdy and comfortable."
	icon_state = "newssuni"
	item_state = "newssuni"
	worn_state = "newssuni"

/obj/item/clothing/under/geruni/sscamo
	name = "SS camo uniform"
	desc = "A camo uniform issued to SchutzStaffel soldiers. Sturdy, comfy, and makes you less visible in autumn."
	icon_state = "ssunicamo"
	item_state = "ssunicamo"
	worn_state = "ssunicamo"

/obj/item/clothing/under/geruni/ssformalofc
	name = "SS Officer's Formal Uniform"
	desc = "A jet black formal uniform issued to SchutzStaffel officers. There's a NSDAP armband attached."
	icon_state = "ss_formal_ofc"
	item_state = "ss_formal_ofc"
	worn_state = "ss_formal_ofc"

/obj/item/clothing/under/geruni/sauni
	name = "SA Uniform"
	desc = "A uniform of the SturmAbteilung, used by NSAP party officials."
	icon_state = "SAuni"
	item_state = "SAuni"
	worn_state = "SAuni"

/obj/item/clothing/under/geruni/hj_uni
	name = "Hitlerjugend Uniform"
	desc = "A uniform of the Hitlerjugend, the Hitler's Youth."
	icon_state = "hj_uni"
	item_state = "hj_uni"
	worn_state = "hj_uni"

/obj/item/clothing/under/geruni/gertankeruni
	name = "Panzer Crewman Uniform"
	desc = "A dark gray jumpsuit with a brown belt. It has an insignia indicating that the wearer is a tank crewman."
	icon_state = "gertankeruni"
	item_state = "gertankeruni"
	worn_state = "gertankeruni"

///polish

/obj/item/clothing/under/poluni1
	name = "Polish Uniform (German)"
	desc = "A captured German uniform, used by the Polish insurgents."
	icon_state = "poluni1"
	item_state = "poluni1"
	worn_state = "poluni1"

/obj/item/clothing/under/poluni2
	name = "Polish Uniform (Soviet)"
	desc = "A captured Soviet uniform, used by the Polish insurgents."
	icon_state = "poluni2"
	item_state = "poluni2"
	worn_state = "poluni2"

/obj/item/clothing/under/poluni3
	name = "Polish Uniform"
	desc = "A makeshift uniform, used by the Polish insurgents."
	icon_state = "poluni3"
	item_state = "poluni3"
	worn_state = "poluni3"

/obj/item/clothing/under/poluni4
	name = "Polish Uniform"
	desc = "A makeshift uniform, used by the Polish insurgents."
	icon_state = "poluni4"
	item_state = "poluni4"
	worn_state = "poluni4"

/obj/item/clothing/under/gloriousuniform
	name = "Glorious Holy Hand Uniform"
	desc = "Shiny and new!"
	icon_state = "glorious_holy_hand"
	item_state = "glorious_holy_hand"
	worn_state = "glorious_holy_hand"

/////////////////////////////JAPAN/////////////////////////
/obj/item/clothing/under/japuni
	name = "Japanese Army Uniform"
	desc = "A standard uniform of the Imperial Japanese Army, specifically Infantry."
	icon_state = "japuni"
	item_state = "japuni"
	worn_state = "japuni"

/obj/item/clothing/under/japuni_med
	name = "Japanese Army Medical Uniform"
	desc = "A standard uniform of the Imperial Japanese Army, with the dark-green color of the medical corps."
	icon_state = "japuni_med"
	item_state = "japuni_med"
	worn_state = "japuni_med"

/obj/item/clothing/under/japuni_officer
	name = "Japanese Army Officer Uniform"
	desc = "A standard uniform of an officer of the Imperial Japanese Army."
	icon_state = "japuni_off"
	item_state = "japuni_off"
	worn_state = "japuni_off"

/obj/item/clothing/under/japunimp
	name = "Kenpeitai Uniform"
	desc = "A standard uniform of the Kenpeitai, the Japanese Military Police."
	icon_state = "japuni_MP"
	item_state = "japuni_MP"
	worn_state = "japuni_MP"
//////////////////////////////////////////////////////////

/////////////////////////////USA/////////////////////////
/obj/item/clothing/under/usuni
	name = "US Army Uniform"
	desc = "A uniform in a lighter shade of olive, made from cotton. Try not to sweat too much."
	icon_state = "USuni_green"
	item_state = "USuni_green"
	worn_state = "USuni_green"
/obj/item/clothing/under/usuni/New()
	..()
	if (map && map.ID == MAP_GAZALA)
		icon_state = "USuni"
		item_state = "USuni"
		worn_state = "USuni"
		item_state_slots["slot_w_uniform"] = "USuni"
/obj/item/clothing/under/usuni2
	name = "US Army Light Uniform"
	desc = "A uniform lacking its jacket. When you don't want to sweat your balls off and you want to be modest."
	icon_state = "USuni_green2"
	item_state = "USuni_green2"
	worn_state = "USuni_green2"
/obj/item/clothing/under/usuni2/New()
	..()
	if (map && map.ID == MAP_GAZALA)
		icon_state = "USuni2"
		item_state = "USuni2"
		worn_state = "USuni2"
		item_state_slots["slot_w_uniform"] = "USuni2"
/obj/item/clothing/under/usuni3
	name = "US Army Uniform pants"
	desc = "A pair of Khaki cotton pants, sometimes you gotta show your other guns to intimidate the enemy... And so you don't sweat your balls off."
	icon_state = "USuni_green3"
	item_state = "USuni_green3"
	worn_state = "USuni_green3"
/obj/item/clothing/under/usuni3/New()
	..()
	if (map && map.ID == MAP_GAZALA)
		icon_state = "USuni3"
		item_state = "USuni3"
		worn_state = "USuni3"
		item_state_slots["slot_w_uniform"] = "USuni3"
/obj/item/clothing/under/uscapuni
	name = "US Army Officer Uniform"
	desc = "A standard uniform of an officer of the United States Army."
	icon_state = "USCapuni"
	item_state = "USCapuni"
	worn_state = "USCapuni"
/obj/item/clothing/under/usuni_mp
	name = "US Army Officer Uniform"
	desc = "A standard uniform of the Military Police of the US Army."
	icon_state = "USuni_MP"
	item_state = "USuni_MP"
	worn_state = "USuni_MP"
/obj/item/clothing/under/usuni_para
	name = "US Paratrooper Uniform"
	desc = "A standard uniform of a paratrooper of the United States Army."
	icon_state = "USparatrooperuni"
	item_state = "USparatrooperuni"
	worn_state = "USparatrooperuni"

/obj/item/clothing/under/brituni
	name = "British Army Uniform"
	desc = "A standard uniform of the Royal Army of the United Kingdom."
	icon_state = "USparatrooperuni"
	item_state = "USparatrooperuni"
	worn_state = "USparatrooperuni"

/obj/item/clothing/under/usuni_mar
	name = "US Marine Cammo Uniform"
	desc = "A standard cammo uniform of the United States Marines."
	icon_state = "USuni_marinecamo"
	item_state = "USuni_marinecamo"
	worn_state = "USuni_marinecamo"

//////////////////////////////////////////////////////////

/obj/item/clothing/under/sovuni
	name = SOVIET_UNIFORM_NAME
	desc = SOVIET_UNIFORM_DESC
	icon_state = SOVIET_UNIFORM_STATE
	item_state = SOVIET_UNIFORM_STATE
	worn_state = SOVIET_UNIFORM_STATE

/obj/item/clothing/under/sovuni/camo
	name = "Soviet Camo Uniform"
	desc = "A camo uniform for Soviet soldiers. Sturdy, comfy, and makes you less visible in autumn."
	icon_state = "sovunicamo"
	item_state = "sovunicamo"
	worn_state = "sovunicamo"

/obj/item/clothing/under/sovuni/gorka
	name = "Soviet Mountain Uniform"
	desc = "A camo uniform for Soviet soldiers. Sturdy, comfy, and makes you less visible in autumn."
	icon_state = "gorka"
	item_state = "gorka"
	worn_state = "gorka"

/obj/item/clothing/under/sovuni/gorkacamo
	name = "Soviet Camo Mountain Uniform"
	desc = "A camo uniform for Soviet soldiers. Sturdy, comfy, and makes you less visible in autumn."
	icon_state = "gorka_ss"
	item_state = "gorka_ss"
	worn_state = "gorka_ss"


/obj/item/clothing/under/sovuni/officer
	name = "Soviet Officer's uniform"
	desc = "A fancier, more pressed uniform of the Red Army, given to Soviet officers. It has a feel of pride and authority."
	icon_state = "sovuniofficer"
	item_state = "sovuniofficer"
	worn_state = "sovuniofficer"

/obj/item/clothing/under/sovuni/nkvduni
	name = "NKVD Officer's uniform"
	desc = "A fancy uniform of the NKVD, give to the feared secret police officers."
	icon_state = "nkvd_uniform"
	item_state = "nkvd_uniform"
	worn_state = "nkvd_uniform"

/obj/item/clothing/under/sovuni/MP
	name = "Soviet MP's uniform"
	desc = "A fancier, more pressed uniform of the Red Army, given to Soviet military police."
	icon_state = "sovuni_MP"
	item_state = "sovuni_MP"
	worn_state = "sovuni_MP"

/obj/item/clothing/under/sovuni/sovtankeruni
	name = "Soviet Crewman Uniform"
	desc = "A dark blue jumpsuit with a brown belt and bandolier."
	icon_state = "sovtankeruni"
	item_state = "sovtankeruni"
	worn_state = "sovtankeruni"

/obj/item/clothing/under/itauni
	name = ITALIAN_UNIFORM_NAME
	desc = ITALIAN_UNIFORM_DESC
	icon_state = ITALIAN_UNIFORM_STATE
	item_state = ITALIAN_UNIFORM_STATE
	worn_state = ITALIAN_UNIFORM_STATE
	var/rolled = FALSE

/obj/item/clothing/under/itauni/officer
	name = "Italian Officer's Uniform"
	desc = "A fancier, more pressed uniform of the Italian Army, given to Soviet military police."
	icon_state = "itauni_officer"
	item_state = "itauni_officer"
	worn_state = "itauni_officer"

/obj/item/clothing/head/helmet/gerhelm
	name = GERMAN_HELMET_NAME
	desc = GERMAN_HELMET_DESC
	icon_state = GERMAN_HELMET_STATE
	item_state = GERMAN_HELMET_STATE
/obj/item/clothing/head/helmet/gerhelm/New()
	..()
	if (map && map.ID == MAP_GAZALA)
		icon_state = "afgerhelm"
		item_state = "afgerhelm"
		worn_state = "afgerhelm"

/obj/item/clothing/head/helmet/polhelm
	name = "Polish Stahlhelm"
	desc = "A captured German stahlhelm, with the red and wite bands of the polish partisans."
	icon_state = "polhelm"
	item_state = "polhelm"

/obj/item/clothing/head/helmet/polhelm2
	name = "Polish Soviet helmet"
	desc = "A captured Soviet helmet, with the red and wite bands of the polish partisans."
	icon_state = "polhelm2"
	item_state = "polhelm2"

/obj/item/clothing/head/helmet/ushelm
	name = "US helmet"
	desc = "A simple steel helmet worn by American GIs."
	icon_state = "UShelm"
	item_state = "UShelm"

/obj/item/clothing/head/helmet/ushelm/med
	name = "US Medical helmet"
	desc = "A simple steel helmet worn by American GIs, with medical decals."
	icon_state = "UShelm_med"
	item_state = "UShelm_med"

/obj/item/clothing/head/helmet/ushelm/nco
	name = "US NCO helmet"
	desc = "A simple steel helmet worn by American GIs, with a white bar in the back, identifying a NCO."
	icon_state = "UShelm_nco"
	item_state = "UShelm_nco"

/obj/item/clothing/head/helmet/ushelm/lt2
	name = "US 2Lt. helmet"
	desc = "A simple steel helmet worn by American GIs, with a the markings of a 2nd Lt. in the front."
	icon_state = "UShelm_2lt"
	item_state = "UShelm_2lt"

/obj/item/clothing/head/helmet/ushelm/lt1
	name = "US 1Lt. helmet"
	desc = "A simple steel helmet worn by American GIs, with a the markings of a 1nd Lt. in the front."
	icon_state = "UShelm_1lt"
	item_state = "UShelm_1lt"

/obj/item/clothing/head/helmet/ushelm/cap
	name = "US Captain helmet"
	desc = "A simple steel helmet worn by American GIs, with a the markings of a Captain in the front."
	icon_state = "UShelm_cap"
	item_state = "UShelm_cap"

/obj/item/clothing/head/helmet/fire
	name = "Firefighter cap"
	desc = "A simple cap worn by firefighters."
	icon_state = "germpcapworn"
	item_state = "germanfirefightinggeneralscap"

/obj/item/clothing/head/helmet/ushelm/mar
	name = "US Marines camo helmet"
	desc = "The regular American M1 but with a frogskin camo cover."
	icon_state = "UShelm_mar"
	item_state = "UShelm_mar"

/obj/item/clothing/head/helmet/ushelm/mar_nco
	name = "US Marines NCO camo helmet"
	desc = "The regular American M1 but with a frogskin camo cover. It has the markings of a NCO."
	icon_state = "UShelm_mar_nco"
	item_state = "UShelm_mar_nco"

/obj/item/clothing/head/helmet/ushelm/usmphelm
	name = "US MP helmet"
	desc = "A standard US Military Police helmet."
	icon_state = "USMPhelm"
	item_state = "USMPhelm"

/obj/item/clothing/head/helmet/japhelm
	name = "Japanese Army helmet"
	desc = "A standard IJA helmet."
	icon_state = "japhelm"
	item_state = "japhelm"

/obj/item/clothing/head/helmet/japhelm/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/clothing/head/jap_headband))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user << "<span class='notice'>You place the heabdand on the helmet.</span>"
		new/obj/item/clothing/head/helmet/japhelm/bandana(user.loc)
		qdel(src)
		qdel(W)

/obj/item/clothing/head/helmet/japhelm/bandana
	name = "japanese helmet"
	desc = "A typical rounded steel helmet. This one has a headband attached to it."
	icon_state = "japhelm_bandana"
	item_state = "japhelm_bandana"
	worn_state = "japhelm_bandana"

/obj/item/clothing/head/jap_headband
	name = "Japanese Headband"
	desc = "A headband worn by japanese soldiers."
	icon_state = "japbandana"
	item_state = "japbandana"
	worn_state = "japbandana"

/obj/item/clothing/head/helmet/japanhelm_med
	name = "Japanese medical helmet"
	desc = "A standard IJA helmet, with a white band and white symbols."
	icon_state = "japanhelm_med"
	item_state = "japanhelm_med"

/obj/item/clothing/head/helmet/japmphat
	name = "Kenpeitai hat"
	desc = "A hat of the Japanese Kenpeitai."
	icon_state = "japmphat"
	item_state = "japmphat"

/obj/item/clothing/head/helmet/usnco
	name = "US NCO hat"
	desc = "An US Army NCO hat."
	icon_state = "USNCOhat"
	item_state = "USNCOhat"

/obj/item/clothing/head/helmet/japncohat
	name = "Japanese cap"
	desc = "A Japanese cap worn by officers and soldiers alike."
	icon_state = "japcap"
	worn_state = "japcap"
	item_state = "japcap"
	var/toggled = FALSE

/obj/item/clothing/head/helmet/japncohat/verb/toggle_flaps()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/japncohat)
		return
	else
		if (toggled)
			item_state = "japcap"
			worn_state = "japcap"
			item_state_slots["slot_w_uniform"] = "japcap"
			usr << "<span class = 'danger'>You put down your cap's flaps.</span>"
			toggled = FALSE
		else if (!toggled)
			item_state = "japextendedcap"
			worn_state = "japextendedcap"
			item_state_slots["slot_w_uniform"] = "japextendedcap"
			usr << "<span class = 'danger'>You put up your cap's flaps.</span>"
			toggled = TRUE
	update_clothing_icon()

/obj/item/clothing/head/helmet/japoffcap
	name = "Japanese Officer Cap"
	desc = "A Japanese cap worn by high ranking officers, like lieutenant or captain."
	icon_state = "japoffcap"
	item_state = "japoffcap"
	worn_state = "japoffcap"
	var/toggled = FALSE

/obj/item/clothing/head/helmet/japoffcap/verb/toggle_flaps()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/japoffcap)
		return
	else
		if (toggled)
			item_state = "japoffcap"
			worn_state = "japoffcap"
			item_state_slots["slot_w_uniform"] = "japoffcap"
			usr << "<span class = 'danger'>You put down your cap's flaps.</span>"
			toggled = FALSE
		else if (!toggled)
			item_state = "japoffcap_extended"
			worn_state = "japoffcap_extended"
			item_state_slots["slot_w_uniform"] = "japoffcap_extended"
			usr << "<span class = 'danger'>You put up your cap's flaps.</span>"
			toggled = TRUE
	update_clothing_icon()

/obj/item/clothing/head/helmet/gerhelm/proc/transform2soviet()
	name = SOVIET_HELMET_NAME
	desc = SOVIET_HELMET_DESC
	icon_state = SOVIET_HELMET_STATE
	item_state = SOVIET_HELMET_STATE
	worn_state = SOVIET_HELMET_STATE
	item_state_slots["slot_head"] = SOVIET_HELMET_STATE
	update_clothing_icon()

/obj/item/clothing/head/helmet/gerhelm/sshelm
	name = "SS camo helmet"
	desc =  "A metal helmet issued to SS soldiers, camouflaged for autumn operations."
	icon_state = "sshelm"
	item_state = "sshelm"

/obj/item/clothing/head/helmet/gerhelm/MP
	name = "German MP helmet"
	desc =  "A fancy metal helmet issued to German military police."
	icon_state = "gerhelm_MP"
	item_state = "gerhelm_MP"

/obj/item/clothing/head/helmet/gerhelm/ghillie
	name = "Ghilie Suit Hood"
	desc =  "A standard ghillie suit helm."
	icon_state = "ger_ghillie"
	item_state = "ger_ghillie"

/obj/item/clothing/head/helmet/gerhelm/medic
	name = "German medic's helmet"
	desc =  "A standard metal helmet issued to German combat medics."
	icon_state = "gerhelm_CM"
	item_state = "gerhelm_CM"

/obj/item/clothing/head/helmet/sovhelm
	name = SOVIET_HELMET_NAME
	desc = SOVIET_HELMET_DESC
	icon_state = SOVIET_HELMET_STATE
	item_state = SOVIET_HELMET_STATE

/obj/item/clothing/head/helmet/sovhelm/proc/transform2german()
	name = GERMAN_HELMET_NAME
	desc = GERMAN_HELMET_DESC
	icon_state = GERMAN_HELMET_STATE
	item_state = GERMAN_HELMET_STATE
	worn_state = GERMAN_HELMET_STATE
	item_state_slots["slot_head"] = GERMAN_HELMET_STATE
	update_clothing_icon()

/obj/item/clothing/head/helmet/sovhelm/MP
	name = "Soviet MP helmet"
	desc =  "A fancy metal helmet issued to Soviet military police."
	icon_state = "sovhelm_MP"
	item_state = "sovhelm_MP"

/obj/item/clothing/head/helmet/sovhelm/medic
	name = "Soviet medic's helmet"
	desc =  "A standard metal helmet issued to Soviet combat medics."
	icon_state = "sovhelm_CM"
	item_state = "sovhelm_CM"

/obj/item/clothing/head/helmet/itahelm
	name = ITALIAN_HELMET_NAME
	desc = ITALIAN_HELMET_DESC
	icon_state = ITALIAN_HELMET_STATE
	item_state = ITALIAN_HELMET_STATE

/obj/item/clothing/head/helmet/itahelm/medic
	name = "Italian medic's helmet"
	desc =  "A standard metal helmet issued to Italian combat medics."
	icon_state = "itahelm_CM"
	item_state = "itahelm_CM"

/obj/item/clothing/suit/armor/cn42
	name = "CN-42 bulletproof vest"
	desc = "A heavy vest used by Soviet Sturmovik. Used for deflecting shrapnel and some bullets."
	icon_state = "cn42"
	slowdown = 2
	armor = list(melee = 60, bullet = 40)
	allowed = list(/obj/item/radio/rbs,/obj/item/radio/feldfu,/obj/item/radio/partisan)

/obj/item/clothing/suit/armor/press
	name = "Press vest"
	desc = "A heavy press vest."
	icon_state = "press_armor"
	armor = list(melee = 40)
	allowed = list(/obj/item/radio/rbs,/obj/item/radio/feldfu,/obj/item/radio/partisan)

/obj/item/weapon/storage/belt/soviet
	name = "Soviet belt pouch"
	desc = "A belt that can hold gear like pistols, ammo and other things."
	icon_state = "gerbelt"
	item_state = "gerbelt"
	storage_slots = 12
	max_w_class = 3
	max_storage_space = 24
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/gauze_pack,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/melee/classic_baton,
		/obj/item/flashlight,
		/obj/item/weapon/handcuffs,
		/obj/item/ammo_casing/a145,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen
		)

/obj/item/weapon/storage/belt/soviet_basic
	name = "Small soviet belt pouch"
	desc = "A basic soviet belt pouch capable of storing a small arms handgun, handgun magazines, gauze and your trustyworthy shovel."
	icon_state = "gerbelt"
	item_state = "gerbelt"
	storage_slots = 6
	max_w_class = 3
	max_storage_space = 12
	can_hold = list(
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/ammo_magazine/c763x25mm_mauser,
		/obj/item/ammo_magazine/c762mm_tokarev,
		/obj/item/ammo_magazine/c45m,
		/obj/item/ammo_magazine/luger,
		/obj/item/weapon/gauze_pack,
		/obj/item/weapon/shovel/spade/russia,
		/obj/item/weapon/shovel/spade/german,
		/obj/item/weapon/reagent_containers/food
		)

/obj/item/weapon/storage/belt/soviet_basic/soldier
/obj/item/weapon/storage/belt/soviet_basic/soldier/New()
	..()
/*	new /obj/item/weapon/gun/projectile/pistol/tokarev(src)
	new /obj/item/ammo_magazine/c762mm_tokarev(src)
	new /obj/item/ammo_magazine/c762mm_tokarev(src)*/
	new /obj/item/weapon/shovel/spade/russia(src)

/obj/item/weapon/storage/belt/soviet/anti_tank_crew
/obj/item/weapon/storage/belt/soviet/anti_tank_crew/New()
	..()

	for (var/v in 1 to 12)
		new /obj/item/ammo_casing/a145(src)

/obj/item/weapon/storage/belt/soviet/MP/New()
	..()
	new /obj/item/weapon/melee/classic_baton/MP/soviet(src)
	new /obj/item/weapon/gun/projectile/revolver/nagant_revolver(src)
	new /obj/item/flashlight(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)

/obj/item/weapon/storage/belt/german
	name = "German belt pouch"
	desc = "A belt that can hold gear like pistols, ammo and other things."
	icon_state = "gerbelt"
	item_state = "gerbelt"
	storage_slots = 12
	max_w_class = 3
	max_storage_space = 24
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/gauze_pack,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/weapon/material/knife,
		/obj/item/weapon/wrench,

		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/melee/classic_baton,
		/obj/item/flashlight,
		/obj/item/weapon/handcuffs,
		/obj/item/ammo_casing/a145,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen
		)

/obj/item/weapon/storage/belt/japan
	name = "Japanese belt pouch"
	desc = "A belt that can hold gear like pistols, ammo and other things."
	icon_state = "gerbelt"
	item_state = "gerbelt"
	storage_slots = 12
	max_w_class = 3
	max_storage_space = 24
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/gauze_pack,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/melee/classic_baton,
		/obj/item/flashlight,
		/obj/item/weapon/handcuffs,
		/obj/item/ammo_casing/a145,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen
		)
/obj/item/weapon/storage/belt/usa
	name = "small US belt pouch"
	desc = "A belt that can hold gear like pistols, ammo and other things."
	icon_state = "USbelt"
	item_state = "USbelt"
	storage_slots = 6
	max_w_class = 3
	max_storage_space = 12
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/gauze_pack,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/melee/classic_baton,
		/obj/item/flashlight,
		/obj/item/weapon/handcuffs,
		/obj/item/ammo_casing/a145,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen
		)

/obj/item/weapon/storage/belt/usa/gear
	name = "US belt pouch"
	desc = "A belt that can hold gear like pistols, ammo and other things."
	icon_state = "USgear"
	item_state = "USgear"
	storage_slots = 14
	max_w_class = 3
	max_storage_space = 24
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/gauze_pack,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/melee/classic_baton,
		/obj/item/flashlight,
		/obj/item/weapon/handcuffs,
		/obj/item/ammo_casing/a145,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen
		)

/obj/item/weapon/storage/belt/holster
	name = "Holster belt "
	desc = "A belt that can hold almost anything that you want."
	icon_state = "belt_holster"
	item_state = "belt_holster"
	storage_slots = 12
	max_w_class = 3
	max_storage_space = 24

/obj/item/weapon/storage/belt/german_basic
	name = "German soldier belt"
	desc = "A basic belt. Only capable of storing a small arms pistol, clips, rations, gauze and a shovel."
	icon_state = "gerbelt"
	item_state = "gerbelt"
	storage_slots = 6
	max_w_class = 3
	max_storage_space = 12
	can_hold = list(
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/ammo_magazine/c763x25mm_mauser,
		/obj/item/ammo_magazine/c762mm_tokarev,
		/obj/item/ammo_magazine/c45m,
		/obj/item/ammo_magazine/luger,
		/obj/item/weapon/gauze_pack,
		/obj/item/weapon/shovel/spade/german,
		/obj/item/weapon/shovel/spade/russia,
		/obj/item/weapon/reagent_containers/food
		)

/obj/item/weapon/storage/belt/german_basic/soldier
/obj/item/weapon/storage/belt/german_basic/soldier/New()
	..()
/*	new /obj/item/weapon/gun/projectile/pistol/waltherp38(src)
	new /obj/item/ammo_magazine/p9x19mm(src)
	new /obj/item/ammo_magazine/p9x19mm(src)*/
	new /obj/item/weapon/shovel/spade/german(src)

/obj/item/weapon/storage/belt/german/anti_tank_crew
/obj/item/weapon/storage/belt/german/anti_tank_crew/New()
	..()

	for (var/v in 1 to 12)
		new /obj/item/ammo_casing/a145(src)

/obj/item/weapon/storage/belt/german/fallofficer
	name = "German belt"
	desc = "A belt that can hold gear like pistols, ammo and other things."
	icon_state = "gerbelt"
	item_state = "gerbelt"
	max_storage_space = 20

/obj/item/weapon/storage/belt/german/fallofficer/New()
	..()
	new /obj/item/weapon/gun/projectile/pistol/mauser(src)
	new /obj/item/ammo_magazine/c763x25mm_mauser(src)
	new /obj/item/ammo_magazine/c763x25mm_mauser(src)
	new /obj/item/weapon/gauze_pack/gauze(src)
	new /obj/item/weapon/grenade/explosive/stgnade(src)
	new /obj/item/weapon/grenade/explosive/stgnade(src)
	new /obj/item/flashlight(src)

/obj/item/weapon/storage/belt/german/fallsoldier
	name = "German belt"
	desc = "A belt that can hold gear like pistols, ammo and other things."
	icon_state = "gerbelt"
	item_state = "gerbelt"
	max_storage_space = 20

/obj/item/weapon/storage/belt/german/fallsoldier/New()
	..()
	new /obj/item/weapon/gun/projectile/pistol/mauser(src)
	new /obj/item/ammo_magazine/c763x25mm_mauser(src)
	new /obj/item/ammo_magazine/c763x25mm_mauser(src)
	new /obj/item/weapon/attachment/bayonet(src)
	new /obj/item/weapon/gauze_pack/gauze(src)
	new /obj/item/weapon/grenade/explosive/stgnade(src)
	new /obj/item/flashlight(src)

/obj/item/weapon/storage/belt/german/MP/New()
	..()
	new /obj/item/weapon/melee/classic_baton/MP/german(src)
	new /obj/item/weapon/gun/projectile/pistol/mauser(src)
	new /obj/item/flashlight(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)

/obj/item/weapon/storage/belt/usa/MP/New()
	..()
	new /obj/item/weapon/melee/classic_baton/MP/usa(src)
	new /obj/item/weapon/gun/projectile/pistol/_45(src)
	new /obj/item/flashlight(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)

/obj/item/weapon/storage/belt/japan/MP/New()
	..()
	new /obj/item/weapon/melee/classic_baton/MP/japan(src)
	new /obj/item/weapon/gun/projectile/pistol/nambu(src)
	new /obj/item/flashlight(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)

/obj/item/weapon/storage/belt/german/SSTV/New()
	..()
	new /obj/item/weapon/melee/classic_baton/MP/SS(src)
	new /obj/item/weapon/gun/projectile/pistol/waltherp38(src)
	new /obj/item/flashlight(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/ammo_magazine/p9x19mm(src)

/obj/item/weapon/storage/belt/italy
	name = "Italian belt pouch"
	desc = "A belt that can hold gear like pistols, ammo and other things."
	icon_state = "gerbelt"
	item_state = "gerbelt"
	storage_slots = 12
	max_w_class = 3
	max_storage_space = 24
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/gauze_pack,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/melee/classic_baton,
		/obj/item/flashlight,
		/obj/item/weapon/handcuffs,
		/obj/item/ammo_casing/a145,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen
		)

/obj/item/clothing/under/doctor
	name = "doctor's uniform"
	desc = "A sterile, nicely pressed suit for doctors."
	icon_state = "ba_suit"
	item_state = "ba_suit"

// soviets and partisans

/obj/item/clothing/shoes/swat/wrappedboots
	name = "\improper wrapped boots"
	icon_state = "wrappedboots"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = FALSE)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

// italians

/obj/item/clothing/shoes/swat/italianboots
	name = "\improper Italian boots"
	icon_state = "italian_boots"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = FALSE)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

// partisans / civs

/obj/item/clothing/under/civ1
	name = "Civilian Clothing"
	desc = "A nice set of threads for civilians. Smells of sweat and resentment."
	icon_state = "civuni1"
	item_state = "civuni1"
	worn_state = "civuni1"

/obj/item/clothing/under/civ2
	name = "Civilian Clothing"
	desc = "A nice set of threads for civilians. Smells of sweat and resentment."
	icon_state = "civuni2"
	item_state = "civuni2"
	worn_state = "civuni2"

/obj/item/clothing/under/civ3
	name = "Civilian Clothing"
	desc = "A nice set of threads for civilians. Smells of sweat and resentment."
	icon_state = "civuni3"
	item_state = "civuni3"
	worn_state = "civuni3"

/obj/item/clothing/under/common1
	name = "Civilian Clothing"
	desc = "A nice set of threads for civilians. Smells of sweat and resentment."
	icon_state = "civ_common_1"
	item_state = "civ_common_1"
	worn_state = "civ_common_1"

/obj/item/clothing/under/common2
	name = "Civilian Clothing"
	desc = "A nice set of threads for civilians. Smells of sweat and resentment."
	icon_state = "civ_common_2"
	item_state = "civ_common_2"
	worn_state = "civ_common_2"

/obj/item/clothing/under/mayor
	name = "Mayor's Clothing"
	desc = "An outfit that resonates respect."
	icon_state = "mayor"
	item_state = "mayor"
	worn_state = "mayor"

/obj/item/clothing/under/wrench
	name = "Mechanic's Clothing"
	desc = "Smells like oil and hard work."
	icon_state = "wrench"
	item_state = "wrench"
	worn_state = "wrench"

/obj/item/clothing/under/gulag
	name = "Gulag Prisoner's Clothing"
	desc = "Looks worn and dirty."
	icon_state = "wrench"
	item_state = "wrench"
	worn_state = "wrench"

/obj/item/clothing/under/oilworker
	name = "Oil Worker's Clothing"
	desc = "Smells like oil and hard work."
	icon_state = "oil_worker"
	item_state = "oil_worker"
	worn_state = "oil_worker"

/obj/item/clothing/under/hunter
	name = "Hunter's Clothing"
	desc = "Some say bears dont see you coming when you wear this."
	icon_state = "hunter"
	item_state = "hunter"
	worn_state = "hunter"

/obj/item/clothing/under/work1
	name = "Worker's Clothing"
	desc = "Its a hard day's work."
	icon_state = "work1"
	item_state = "work1"
	worn_state = "work1"

/obj/item/clothing/under/work2
	name = "Worker's Clothing"
	desc = "Its a hard day's work."
	icon_state = "work2"
	item_state = "work2"
	worn_state = "work2"

/obj/item/clothing/under/work3
	name = "Worker's Clothing"
	desc = "Its a hard day's work."
	icon_state = "work3"
	item_state = "work3"
	worn_state = "work3"

/obj/item/clothing/under/navy
	name = "Navy Uniform"
	desc = "Smells like fish."
	icon_state = "navy"
	item_state = "navy"
	worn_state = "navy"

/obj/item/clothing/under/navyofficer
	name = "Navy Uniform"
	desc = "Smells like fish."
	icon_state = "navyofficer"
	item_state = "navyofficer"
	worn_state = "navyofficer"


/obj/item/clothing/under/redcross
	name = "Red Cross Uniform"
	desc = "A standard grey uniform of the Red Cross. Don't shoot!"
	icon_state = "redcross_uniform"
	item_state = "redcross_uniform"
	worn_state = "redcross_uniform"

/obj/item/weapon/storage/backpack/german
	name = "german backpack"
	desc = "You wear this on your back and put items into it."
	icon_state = "germanpack"
	item_state_slots = null
	slowdown = 0.5

/obj/item/weapon/storage/backpack/italy
	name = "italian backpack"
	desc = "You wear this on your back and put items into it."
	icon_state = "germanpack"
	item_state_slots = null
	slowdown = 0.5

/obj/item/weapon/storage/backpack/japan
	name = "japanese backpack"
	desc = "You wear this on your back and put items into it."
	icon_state = "jappack"
	item_state_slots = null
	slowdown = 0.5

/obj/item/weapon/storage/backpack/usa
	name = "american backpack"
	desc = "You wear this on your back and put items into it."
	icon_state = "uspack"
	item_state_slots = null
	slowdown = 0.5

/obj/item/weapon/storage/backpack/usafield
	name = "american field pack"
	desc = "You wear this on your back and put items into it."
	icon_state = "usfieldpack"
	item_state_slots = null
	max_storage_space = 11

//portable rations

/obj/item/weapon/storage/backpack/german/rations

/obj/item/weapon/storage/backpack/german/rations/New()
	..()
	for (var/v in 1 to 7)
		contents += new_ration(GERMAN, "solid")

/obj/item/weapon/storage/backpack/german/paratrooper
	desc = "A German paratrooper's backpack. Parachute built in."

/obj/item/weapon/storage/backpack/german/paratrooper/New()
	..()
	for (var/v in 1 to 3)
		contents += new/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/german
	for (var/v in 1 to 2)
		contents += new/obj/item/weapon/reagent_containers/food/drinks/bottle/water/filled
	for (var/v in 1 to 2)
		contents += new/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer

// todo: needs a new icon

/obj/item/weapon/storage/backpack/soviet
	name = "soviet backpack"
	desc = "You wear this on your back and put items into it."
	icon_state = "russianpack"
	item_state_slots = null
	slowdown = 0.5

// coats

/obj/item/clothing/suit/storage/coat
	name = "generic coat"
	desc = "generic desc"
	allowed = list(/obj/item/radio/rbs,/obj/item/radio/feldfu,/obj/item/radio/partisan)
	slowdown = 0.1

/obj/item/clothing/suit/storage/coat/civilian
	name = "Civilian's Coat"
	desc = "An ordinary winter coat."
	icon_state = "winter_coat"
	item_state = "winter_coat"
	worn_state = "winter_coat"

/obj/item/clothing/suit/storage/coat/german
	name = "German Soldier's Coat"
	desc = "An ordinary winter coat issued to Wehrmacht soldiers."
	icon_state = "nazi_coat"
	item_state = "nazi_coat"
	worn_state = "nazi_coat"

/obj/item/clothing/suit/storage/coat/german/New()
	..()
	if (map && map.ID == MAP_GAZALA)
		icon_state = "afgercoat"
		item_state = "afgercoat"
		worn_state = "afgercoat"

/obj/item/clothing/suit/storage/coat/sssmock
	name = "S.S. Smock"
	desc = "A camo SchutzStaffel overcoat that blends in well in the fall."
	icon_state = "sssmock"
	item_state = "sssmock"
	worn_state = "sssmock"
	allowed = list(/obj/item/radio/rbs,/obj/item/radio/feldfu,/obj/item/radio/partisan)

/obj/item/clothing/suit/storage/coat/german/SS
	name = "SS Soldier's Coat"
	desc = "An ordinary winter coat issued to SS soldiers."
	icon_state = "ss_coat"
	item_state = "ss_coat"
	worn_state = "ss_coat"

/obj/item/clothing/suit/storage/coat/fallsparka
	name = "Fallschirmjager Parka"
	desc = "A warm and comfy parka for Fallschirmjagers."
	icon_state = "fallsparka"
	item_state = "fallsparka"
	worn_state = "fallsparka"
	allowed = list(/obj/item/radio/rbs,/obj/item/radio/feldfu,/obj/item/radio/partisan)

/obj/item/clothing/suit/storage/coat/german/officer
	name = "German Officer's Coat"
	desc = "An ordinary winter coat issued to Wehrmacht officers."
	icon_state = "nazimp_coat"
	item_state = "nazimp_coat"
	worn_state = "nazimp_coat"


/obj/item/clothing/suit/storage/coat/hugoboss
	name = "Hugo Boss Coat"
	desc = "An ordinary winter coat, the same style der fuhrer wore himself."
	icon_state = "hugo"
	item_state = "hugo"
	worn_state = "hugo"

/obj/item/clothing/suit/storage/coat/soviet
	name = "Soviet Soldier's Coat"
	desc = "An ordinary winter coat issued to Soviet soldiers."
	icon_state = "soviet_coat"
	item_state = "soviet_coat"
	worn_state = "soviet_coat"

/obj/item/clothing/suit/storage/coat/american
	name = "American Soldier's Coat"
	desc = "An ordinary winter coat issued to US soldiers."
	icon_state = "american_coat"
	item_state = "american_coat"
	worn_state = "american_coat"

/obj/item/clothing/suit/storage/coat/soviet/officer
	name = "Soviet Officer's Coat"
	desc = "An ordinary winter coat issued to Soviet officers."
	icon_state = "sovofficer_coat"
	item_state = "sovofficer_coat"
	worn_state = "sovofficer_coat"

/obj/item/clothing/suit/storage/coat/german/ghillie
	name = "Ghillie Suit"
	desc =  "A standard ghillie suit."
	icon_state = "ger_ghillie"
	item_state = "ger_ghillie"
	allowed = list(/obj/item/radio/rbs,/obj/item/radio/feldfu,/obj/item/radio/partisan)

/obj/item/clothing/suit/storage/coat/italian
	name = "Italian Coat"
	desc = "An ordinary winter coat issued to Italian soldiers."
	icon_state = "italy_coat"
	item_state = "italy_coat"
	worn_state = "italy_coat"

/obj/item/clothing/suit/storage/coat/polcoat1
	name = "Polish Coat"
	desc = "A captured german coat, with the Polish colors on the sleeve."
	icon_state = "polcoat1"
	item_state = "polcoat1"
	worn_state = "polcoat1"
	allowed = list(/obj/item/radio/rbs,/obj/item/radio/feldfu,/obj/item/radio/partisan)

/obj/item/clothing/suit/storage/coat/pol_officer_coat
	name = "Polish Officer Coat"
	desc = "A captured german leather coat, with the Polish colors on the sleeve, used by officers."
	icon_state = "pol_officer_coat"
	item_state = "pol_officer_coat"
	worn_state = "pol_officer_coat"
	allowed = list(/obj/item/radio/rbs,/obj/item/radio/feldfu,/obj/item/radio/partisan)

/obj/item/clothing/suit/storage/coat/polcoat2
	name = "Polish cammo smock"
	desc = "A captured camo SS overcoat, with the Polish colors on the sleeve."
	icon_state = "polcoat2"
	item_state = "polcoat2"
	worn_state = "polcoat2"
	allowed = list(/obj/item/radio/rbs,/obj/item/radio/feldfu,/obj/item/radio/partisan)

// WEBBING - can hold everything but clothing

/obj/item/clothing/accessory/storage/webbing
	name = "webbing"
	desc = "A sturdy mess of cotton belts and buckles, ready to share your burden."
	icon_state = "webbing"
	slots = 8

	New()
		..()
		hold.cant_hold = list(/obj/item/clothing)

// CUSTOMIZED GAS MASKS

/obj/item/clothing/mask/gas/german
	icon_state = "m38_mask"
	item_state = "m38_mask"
	filtered_gases = list("xylyl_bromide", "mustard_gas", "white_phosphorus_gas", "chlorine_gas", "zyklon_b")

/obj/item/clothing/mask/gas/soviet
	icon_state = "gp5_mask"
	item_state = "gp5_mask"
	filtered_gases = list("xylyl_bromide", "mustard_gas", "white_phosphorus_gas", "chlorine_gas", "zyklon_b")

/obj/item/clothing/mask/gas/japan
	icon_state = "gp5_mask"
	item_state = "gp5_mask"
	filtered_gases = list("xylyl_bromide", "mustard_gas", "white_phosphorus_gas", "chlorine_gas", "zyklon_b")

/obj/item/clothing/mask/gas/usa
	icon_state = "m38_mask"
	item_state = "m38_mask"
	filtered_gases = list("xylyl_bromide", "mustard_gas", "white_phosphorus_gas", "chlorine_gas", "zyklon_b")

/obj/item/clothing/mask/shemagh
	name = "shemagh"
	desc = "Protects your face from wind, dust and sand. It can also be adjusted. All in all, a practical item of clothing!"
	icon_state = "shemagh1"
	item_state = "shemagh1"
	flags_inv = BLOCKHEADHAIR|BLOCKFACEHAIR
	var/state = 1 //1 = Hides everything, 2 = Hides head, 3 = Hides face, 4 = Doesn't hide anything, covers neck

/obj/item/clothing/mask/shemagh/New()
	spawn(1)
		if(istype(loc,/mob))
			state = rand(1,4)
			change_position()

/obj/item/clothing/mask/shemagh/attack_self(var/mob/user)
	change_position()

/obj/item/clothing/mask/shemagh/proc/change_position()
	var/mob/living/carbon/human/H = usr
	switch(state)
		if(1)
			state = 2
			flags_inv = BLOCKHEADHAIR
			H << "You adjust [src] to reveal your face."
		if(2)
			state = 3
			flags_inv = BLOCKFACEHAIR
			H << "You adjust [src] to cover your mouth."
		if(3)
			state = 4
			flags_inv = null
			H << "You adjust [src] to cover your neck."
		if(4)
			state = 1
			flags_inv = BLOCKHAIR
			H << "You adjust [src] to cover your head."
	icon_state = "shemagh[state]"
	item_state = "shemagh[state]"
	H.update_inv_wear_mask(0)
	H.update_inv_head()