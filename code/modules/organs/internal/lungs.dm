/obj/item/organ/lungs
	name = "lungs"
	icon_state = "lungs"
	gender = PLURAL
	organ_tag = "lungs"
	parent_organ = "chest"

	var/breath_type
	var/poison_type
	var/exhale_type

	var/min_breath_pressure

	var/safe_exhaled_max = 10
	var/safe_toxins_max = 0.2
	var/SA_para_min = TRUE
	var/SA_sleep_min = 5

/obj/item/organ/lungs/set_dna(var/datum/dna/new_dna)
	..()
	/*
	min_breath_pressure = species.breath_pressure
	breath_type = species.breath_type ? species.breath_type : "oxygen"
	poison_type = species.poison_type ? species.poison_type : "plasma"
	exhale_type = species.exhale_type ? species.exhale_type : FALSE
*/

/obj/item/organ/lungs/proc/handle_breath(datum/gas_mixture/breath)
/*
	if (!owner)
		return FALSE
	if (!breath)
		return FALSE
	//exposure to extreme pressures can rupture lungs
	if (breath.total_moles < BREATH_MOLES / 5 || breath.total_moles > BREATH_MOLES * 5)
		if (is_bruised() && prob(5))
			owner.custom_pain("You feel a stabbing pain in your chest!", TRUE)
			bruise()

	var/safe_pressure_min = min_breath_pressure // Minimum safe partial pressure of breathable gas in kPa
	// Lung damage increases the minimum safe pressure.
	if (is_broken())
		safe_pressure_min *= 1.5
	else if (is_bruised())
		safe_pressure_min *= 1.25

	var/breath_pressure = (breath.total_moles*R_IDEAL_GAS_EQUATION*breath.temperature)/BREATH_VOLUME

	var/failed_inhale = FALSE
	var/failed_exhale = FALSE

	var/inhaling = breath.gas[breath_type]
	var/poison = breath.gas[poison_type]
	var/exhaling = exhale_type ? breath.gas[exhale_type] : FALSE

	var/inhale_pp = (inhaling/breath.total_moles)*breath_pressure
	var/toxins_pp = (poison/breath.total_moles)*breath_pressure
	var/exhaled_pp = (exhaling/breath.total_moles)*breath_pressure
	// Not enough to breathe
	if (inhale_pp < safe_pressure_min)
		if (prob(20))
			owner.emote("gasp")

		var/ratio = inhale_pp/safe_pressure_min
		owner.adjustOxyLoss(max(HUMAN_MAX_OXYLOSS*(1-ratio), FALSE))	// Don't fuck them up too fast (space only does HUMAN_MAX_OXYLOSS after all!)
		failed_inhale = TRUE

	owner.oxygen_alert = failed_inhale

	var/inhaled_gas_used = inhaling/6
	breath.adjust_gas(breath_type, -inhaled_gas_used, update = FALSE) //update afterwards

	if (exhale_type)
		breath.adjust_gas_temp(exhale_type, inhaled_gas_used, owner.bodytemperature, update = FALSE) //update afterwards
		// Too much exhaled gas in the air
		var/word
		var/warn_prob
		var/oxyloss
		var/alert

		if (exhaled_pp > safe_exhaled_max)
			word = pick("extremely dizzy","short of breath","faint","confused")
			warn_prob = 15
			oxyloss = HUMAN_MAX_OXYLOSS
			alert = TRUE
			failed_exhale = TRUE
		else if (exhaled_pp > safe_exhaled_max * 0.7)
			word = pick("dizzy","short of breath","faint","momentarily confused")
			warn_prob = TRUE
			alert = TRUE
			failed_exhale = TRUE
			var/ratio = 1.0 - (safe_exhaled_max - exhaled_pp)/(safe_exhaled_max*0.3)
			if (owner.getOxyLoss() < 50*ratio)
				oxyloss = HUMAN_MAX_OXYLOSS
		else if (exhaled_pp > safe_exhaled_max * 0.6)
			word = pick("a little dizzy","short of breath")
			warn_prob = TRUE
		else
			owner.co2_alert = FALSE

		if (!owner.co2_alert && word && prob(warn_prob))
			owner << "<span class='warning'>You feel [word].</span>"
			owner.adjustOxyLoss(oxyloss)
			owner.co2_alert = alert

	// Too much poison in the air.
	if (toxins_pp > safe_toxins_max)
		var/ratio = (poison/safe_toxins_max) * 10
		owner.reagents.add_reagent("toxin", Clamp(ratio, MIN_TOXIN_DAMAGE, MAX_TOXIN_DAMAGE))
		breath.adjust_gas(poison_type, -poison/6, update = FALSE) //update after
		owner.plasma_alert = TRUE
	else
		owner.plasma_alert = FALSE

	// If there's some other shit in the air lets deal with it here.
	if (breath.gas["sleeping_agent"])
		var/SA_pp = (breath.gas["sleeping_agent"] / breath.total_moles) * breath_pressure
		if (SA_pp > SA_para_min)		// Enough to make us paralysed for a bit
			owner.Paralyse(3)	// 3 gives them one second to wake up and run away a bit!
			if (SA_pp > SA_sleep_min)	// Enough to make us sleep as well
				owner.Sleeping(5)
		else if (SA_pp > 0.15)	// There is sleeping gas in their lungs, but only a little, so give them a bit of a warning
			if (prob(20))
				owner.emote(pick("giggle", "laugh"))

		breath.adjust_gas("sleeping_agent", -breath.gas["sleeping_agent"]/6, update = FALSE) //update after

	// Were we able to breathe?
	var/failed_breath = failed_inhale || failed_exhale
	if (!failed_breath)
		owner.adjustOxyLoss(-5)

	handle_temperature_effects(breath)

	breath.update_values()
	return !failed_breath*/

/obj/item/organ/lungs/proc/handle_temperature_effects(datum/gas_mixture/breath)
	return
/*	// Hot air hurts :(
	if ((breath.temperature < species.cold_level_1 || breath.temperature > species.heat_level_1) && !(COLD_RESISTANCE in owner.mutations))
		var/damage = FALSE
		if (breath.temperature <= species.cold_level_1)
			if (prob(20))
				owner << "<span class='danger'>You feel your face freezing and icicles forming in your lungs!</span>"

			switch(breath.temperature)
				if (species.cold_level_3 to species.cold_level_2)
					damage = COLD_GAS_DAMAGE_LEVEL_3
				if (species.cold_level_2 to species.cold_level_1)
					damage = COLD_GAS_DAMAGE_LEVEL_2
				else
					damage = COLD_GAS_DAMAGE_LEVEL_1

			owner.apply_damage(damage, BURN, "head", used_weapon = "Excessive Cold")
			owner.fire_alert = TRUE
		else if (breath.temperature >= species.heat_level_1)
			if (prob(20))
				owner << "<span class='danger'>You feel your face burning and a searing heat in your lungs!</span>"

			switch(breath.temperature)
				if (species.heat_level_1 to species.heat_level_2)
					damage = HEAT_GAS_DAMAGE_LEVEL_1
				if (species.heat_level_2 to species.heat_level_3)
					damage = HEAT_GAS_DAMAGE_LEVEL_2
				else
					damage = HEAT_GAS_DAMAGE_LEVEL_3

			owner.apply_damage(damage, BURN, "head", used_weapon = "Excessive Heat")
			owner.fire_alert = 2

		//breathing in hot/cold air also heats/cools you a bit
		var/temp_adj = breath.temperature - owner.bodytemperature
		if (temp_adj < 0)
			temp_adj /= (BODYTEMP_COLD_DIVISOR * 5)	//don't raise temperature as much as if we were directly exposed
		else
			temp_adj /= (BODYTEMP_HEAT_DIVISOR * 5)	//don't raise temperature as much as if we were directly exposed

		var/relative_density = breath.total_moles / (MOLES_CELLSTANDARD * BREATH_PERCENTAGE)
		temp_adj *= relative_density

		if (temp_adj > BODYTEMP_HEATING_MAX) temp_adj = BODYTEMP_HEATING_MAX
		if (temp_adj < BODYTEMP_COOLING_MAX) temp_adj = BODYTEMP_COOLING_MAX
		//world << "Breath: [breath.temperature], [src]: [bodytemperature], Adjusting: [temp_adj]"
		owner.bodytemperature += temp_adj

	else if (breath.temperature >= species.heat_discomfort_level)
		species.get_environment_discomfort(owner,"heat")
	else if (breath.temperature <= species.cold_discomfort_level)
		species.get_environment_discomfort(owner,"cold")*/

/obj/item/organ/lungs/process()
	..()

	if (!owner)
		return

	if (germ_level > INFECTION_LEVEL_ONE)
		if (prob(5))
			owner.emote("cough")		//respitory tract infection

	if (is_bruised())
		owner.adjustOxyLoss(2.5)
		if (prob(2))
			spawn owner.emote("me", TRUE, "coughs up blood!")
			playsound(get_turf(src), pick("sound/voice/woundedcough1.ogg", "sound/voice/woundedcough2.ogg", "sound/voice/woundedcough3.ogg"), 100)
			owner.drip(10)
			owner.adjustOxyLoss(15)
		if (prob(4))
			spawn owner.emote("me", TRUE, "gasps for air!")
			playsound(get_turf(src), "sound/voice/gasp_male2.ogg", 50)
			owner.losebreath += 35
			owner.adjustOxyLoss(15)
