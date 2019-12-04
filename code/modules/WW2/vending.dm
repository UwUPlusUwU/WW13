// APPAREL RACKS

/obj/structure/vending/sovietapparel
	name = "Soviet apparel rack"
	desc = "Basic wear for soviet soldiers."
	icon_state = "apparel_soviet"
	products = list(
		/obj/item/clothing/suit/storage/coat/soviet = 50,
		/obj/item/clothing/accessory/storage/webbing = 50,
		/obj/item/clothing/under/sovuni = 50,
		/obj/item/clothing/head/helmet/sovhelm = 50,
		/obj/item/clothing/mask/shemagh = 50,
		/obj/item/clothing/shoes/swat/wrappedboots = 50,
		/obj/item/clothing/head/ushanka = 25,
		/obj/item/clothing/mask/gas/soviet = 25,
		/obj/item/clothing/under/sovuni/camo = 5,
		/obj/item/clothing/under/sovuni/gorka = 5,
		/obj/item/clothing/under/sovuni/gorkacamo = 5,
		/obj/item/clothing/suit/storage/vest/heavy/rugc = 5,
		/obj/item/clothing/suit/storage/vest/heavy/rug = 5,
		/obj/item/weapon/storage/belt/soviet_basic = 15,
		/obj/item/weapon/storage/backpack/soviet = 15
	)
//	idle_power_usage = 0

/obj/structure/vending/germanapparel
	name = "German apparel rack"
	desc = "Basic wear for German soldiers."
	icon_state = "apparel_german"
	products = list(
		/obj/item/clothing/suit/storage/coat/german = 50,
		/obj/item/clothing/accessory/storage/webbing = 50,
		/obj/item/clothing/under/geruni = 50,
		/obj/item/clothing/head/helmet/gerhelm = 50,
		/obj/item/clothing/head/caphat/gercap/fieldcap2 = 50,
		/obj/item/clothing/mask/shemagh = 50,
		/obj/item/clothing/shoes/swat = 50,
		/obj/item/clothing/mask/gas/german = 25,
		/obj/item/weapon/storage/belt/german_basic = 15,
		/obj/item/weapon/storage/backpack/german = 15
	)
/obj/structure/vending/usaapparel
	name = "US Army apparel rack"
	desc = "Basic wear for US Army soldiers."
	icon_state = "apparel_usa"
	products = list(
		/obj/item/clothing/suit/storage/coat/american = 50,
		/obj/item/clothing/accessory/storage/webbing = 50,
		/obj/item/clothing/under/usuni = 50,
		/obj/item/clothing/under/usuni2 = 20,
		/obj/item/clothing/under/usuni3 = 10,
		/obj/item/clothing/head/helmet/ushelm = 50,
		/obj/item/clothing/head/helmet/usnco = 50,
		/obj/item/clothing/mask/shemagh = 50,
		/obj/item/clothing/shoes/usboots = 50,
		/obj/item/clothing/mask/gas/usa = 25,
		/obj/item/weapon/storage/backpack/usa = 15,
		/obj/item/weapon/storage/belt/usa = 20,
		/obj/item/weapon/storage/backpack/usafield = 5
	)
/obj/structure/vending/marinesapparel
	name = "US Marines apparel rack"
	desc = "Basic wear for US Marines soldiers."
	icon_state = "apparel_usa"
	products = list(
		/obj/item/clothing/suit/storage/coat/american = 50,
		/obj/item/clothing/accessory/storage/webbing = 50,
		/obj/item/clothing/under/usuni = 50,
		/obj/item/clothing/under/usuni2 = 20,
		/obj/item/clothing/under/usuni3 = 10,
		/obj/item/clothing/head/helmet/ushelm/mar = 50,
		/obj/item/clothing/mask/shemagh = 50,
		/obj/item/clothing/shoes/usboots = 50,
		/obj/item/clothing/mask/gas/usa = 25,
		/obj/item/weapon/storage/backpack/usa = 15,
		/obj/item/weapon/storage/backpack/usafield = 5
	)
/obj/structure/vending/japanapparel
	name = "Japanese apparel rack"
	desc = "Basic wear for IJA soldiers."
	icon_state = "apparel_japan"
	products = list(
//		/obj/item/clothing/suit/storage/coat/german = 50,
		/obj/item/clothing/accessory/storage/webbing = 50,
		/obj/item/clothing/under/japuni = 50,
		/obj/item/clothing/head/helmet/japhelm = 50,
		/obj/item/clothing/head/helmet/japncohat = 25,
		/obj/item/clothing/shoes/swat/wrappedboots = 50,
		/obj/item/clothing/mask/gas/japan = 25,
		/obj/item/weapon/storage/backpack/japan = 15
	)
/obj/structure/vending/italian/apparel
	name = "Italian apparel rack"
	desc = "Basic wear for Italian soldiers."
	icon_state = "apparel_german"
	products = list(
		/obj/item/clothing/suit/storage/coat/italian = 12,
		/obj/item/clothing/accessory/storage/webbing = 12,
		/obj/item/clothing/under/itauni = 12,
		/obj/item/clothing/head/helmet/itahelm = 12,
		/obj/item/clothing/shoes/swat = 12,
		/obj/item/clothing/mask/gas/german = 12,
		/obj/item/weapon/storage/belt/italy = 12,
		/obj/item/weapon/storage/backpack/italy = 12,
		)

/obj/structure/vending/italian/equipment
	name = "Italian equipment rack"
	desc = "Basic equipment for Italian soldiers."
	icon_state = "equipment_german"
	products = list(
		/obj/item/weapon/gun/projectile/boltaction/carcano = 3,
		/obj/item/ammo_magazine/c65x52mm = 20,
		/obj/item/weapon/gun/projectile/submachinegun/modello38 = 4,
		/obj/item/ammo_magazine/s9x19mm = 20,
		/obj/item/weapon/gauze_pack/gauze = 15,
		/obj/item/weapon/attachment/bayonet/german = 15,
		/obj/item/weapon/material/knife/boot/trench_knife = 15,
		/obj/item/weapon/grenade/explosive/l2a2 = 10,
		/obj/item/weapon/grenade/explosive/stgnade = 10,
		/obj/item/weapon/grenade/smokebomb/german = 20,
		/obj/item/weapon/attachment/scope/adjustable/sniper_scope = 2,
		/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/italian = 15,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/italian = 10,

		)

//	idle_power_usage = 0

// EQUIPMENT RACKS

/obj/structure/vending/germanequipment
	name = "German equipment rack"
	desc = "Basic equip for German soldiers."
	icon_state = "equipment_german"
	products = list(
		/obj/item/weapon/material/knife/boot/nr40_knife = 25,
		/obj/item/weapon/attachment/bayonet/german = 25,
		/obj/item/weapon/gauze_pack/gauze = 25,
		/obj/item/flashlight = 25,
		/obj/item/weapon/shovel/spade/german = 25,
		/obj/item/weapon/gun/projectile/boltaction/kar98k = 25,
		/obj/item/ammo_magazine/kar98k = 50,
		/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/german = 25,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/german = 25,

	)
//	idle_power_usage = 0

/obj/structure/vending/japanequipment
	name = "Japanese equipment rack"
	desc = "Basic equip for Japanese soldiers."
	icon_state = "equipment_japan"
	products = list(
		/obj/item/weapon/attachment/bayonet = 25,
		/obj/item/weapon/gauze_pack/gauze = 25,
		/obj/item/flashlight = 25,
		/obj/item/weapon/shovel/spade/japan = 25,
		/obj/item/weapon/gun/projectile/boltaction/arisaka = 25,
		/obj/item/ammo_magazine/a77x58 = 50,
		/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/japanese = 25,
		/obj/item/weapon/material/knife/boot = 25,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/japanese = 25,
	)

/obj/structure/vending/usaquipment
	name = "US equipment rack"
	desc = "Basic equip for US soldiers."
	icon_state = "equipment_usa"
	products = list(
		/obj/item/weapon/attachment/bayonet = 25,
		/obj/item/weapon/gauze_pack/gauze = 25,
		/obj/item/flashlight = 25,
		/obj/item/weapon/shovel/spade/usa = 25,
		/obj/item/weapon/gun/projectile/semiautomatic/m1garand = 25,
		/obj/item/ammo_magazine/c762x63 = 50,
		/obj/item/ammo_magazine/c762x63_5 = 10,
		/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/american = 25,
		/obj/item/ammo_magazine/shotgun_ammobox = 15,
		/obj/item/weapon/material/knife/boot/tacknife_US = 30,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/usa = 25,
	)

/obj/structure/vending/SSequipment
	name = "SS equipment rack"
	desc = "Basic equip for SS soldiers."
	icon_state = "equipment_german"
	products = list(

		/obj/item/clothing/under/geruni/ssuni = 20,
		/obj/item/clothing/suit/storage/coat/sssmock = 20,
		/obj/item/clothing/accessory/storage/webbing = 20,

		/obj/item/clothing/head/helmet/gerhelm/sshelm = 10,
		/obj/item/clothing/mask/gas/german = 10,
		/obj/item/clothing/shoes/swat = 10,

		/obj/item/clothing/head/helmet/gerhelm/ghillie = 5,
		/obj/item/clothing/suit/storage/coat/german/ghillie = 5,
		/obj/item/clothing/under/geruni/ghillie = 5,

		/obj/item/weapon/material/knife/boot/nr40_knife_SS = 10,
		/obj/item/weapon/attachment/bayonet/german = 10,
		/obj/item/weapon/gauze_pack/gauze = 10,
		/obj/item/flashlight = 10,
		/obj/item/weapon/shovel/spade/russia = 10,
		/obj/item/ammo_magazine/a762/akm = 10,
		/obj/item/weapon/gun/projectile/boltaction/kar98k = 10,

		/obj/item/ammo_magazine/kar98k = 30,

		/obj/item/weapon/grenade/explosive/stgnade = 7,
		/obj/item/weapon/grenade/explosive/l2a2 = 7,
		/obj/item/weapon/grenade/smokebomb/german = 21,

		/obj/item/clothing/under/geruni/sscamo = 5,

		/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/german = 15,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/german = 15,
	)
//	idle_power_usage = 0

/obj/structure/vending/SSequipment_train
	name = "SS equipment rack"
	desc = "Basic equip for SS soldiers."
	icon_state = "apparel_german"
	products = list(
		/obj/item/clothing/head/helmet/gerhelm/sshelm = 12,
		/obj/item/clothing/mask/gas/german = 12,
		/obj/item/clothing/suit/storage/coat/sssmock = 12,
		/obj/item/clothing/under/geruni/ssuni = 12,
		/obj/item/clothing/under/geruni/sscamo = 6,
		/obj/item/clothing/shoes/swat = 12,
		/obj/item/clothing/accessory/storage/webbing = 12,
		/obj/item/weapon/gauze_pack/gauze = 10,
		/obj/item/flashlight = 10,
		/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/german = 15,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/german = 15,
	)

/obj/structure/vending/paratrooper
	name = "Fallschirmjager equipment rack"
	desc = "Basic equipment for Fallschirmjagers."
	icon_state = "equipment_german"
	products = list(
		/obj/item/clothing/head/helmet/gerhelm = 10,
		/obj/item/clothing/under/geruni/falluni = 10,
		/obj/item/clothing/suit/storage/coat/fallsparka = 10,
		/obj/item/clothing/shoes/swat = 10,
		/obj/item/flashlight = 10,
		/obj/item/ammo_magazine/kar98k = 20,
		/obj/item/ammo_magazine/mp40 = 10,
		/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/german = 10,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/german = 10,
		/obj/item/weapon/storage/firstaid/adv = 1,
		/obj/item/weapon/pill_pack/bicaridine = 5,
		/obj/item/weapon/pill_pack/tramadol = 5
	)

/obj/structure/vending/SSweaponrack
	name = "SS weapon rack"
	desc = "Rack filled with weapons."
	icon_state = "equipment_german"
	products = list(
		/obj/item/weapon/gun/projectile/boltaction/kar98k = 4,
		/obj/item/weapon/gun/projectile/submachinegun/mp40 = 6,
		/obj/item/weapon/attachment/bayonet/german = 10,

		/obj/item/weapon/gun/projectile/pistol/mauser = 12,

		/obj/item/ammo_magazine/kar98k = 30,
		/obj/item/ammo_magazine/mp40 = 24,
		/obj/item/ammo_magazine/a762/akm = 10,
		/obj/item/ammo_magazine/c763x25mm_mauser = 24,

		/obj/item/weapon/grenade/explosive/stgnade = 7,
		/obj/item/weapon/grenade/explosive/l2a2 = 7,
		/obj/item/weapon/grenade/smokebomb/german = 21,

		/obj/item/weapon/shovel/spade/russia = 10,

		/obj/item/weapon/material/knife/boot/nr40_knife_SS = 10,

	)

/obj/structure/vending/guard_weaponrack
	name = "Guard weapon rack"
	desc = "Rack filled with weapons."
	icon_state = "equipment_german"
	products = list(
		/obj/item/weapon/gun/projectile/boltaction/kar98k = 40,
		/obj/item/weapon/gun/projectile/submachinegun/mp40 = 20,
		/obj/item/weapon/attachment/bayonet/german = 10,

		/obj/item/weapon/gun/projectile/pistol/mauser = 20,

		/obj/item/ammo_magazine/kar98k = 50,
		/obj/item/ammo_magazine/mp40 = 40,
		/obj/item/ammo_magazine/a762/akm = 24,
		/obj/item/ammo_magazine/c763x25mm_mauser = 50,

		/obj/item/weapon/grenade/explosive/stgnade = 20,
		/obj/item/weapon/grenade/explosive/l2a2 = 20,
		/obj/item/weapon/grenade/smokebomb/german = 40,

		/obj/item/weapon/melee/classic_baton/MP/SS = 20,
		/obj/item/weapon/material/knife/boot/nr40_knife_SS = 10,
	)

/obj/structure/vending/guard_equipment
	name = "Guard equipment rack"
	desc = "Basic equip for Guards."
	icon_state = "equipment_german"
	products = list(
	/obj/item/clothing/mask/gas/german = 30,
	/obj/item/flashlight = 40,
	/obj/item/clothing/accessory/storage/webbing = 40,
	/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/german = 30,

	)

/obj/structure/vending/sovietequipment
	name = "Soviet equipment rack"
	desc = "Basic equip for Soviet soldiers."
	icon_state = "equipment_soviet"
	products = list(
		/obj/item/weapon/material/knife/boot/bowie_knife = 25,
		/obj/item/weapon/attachment/bayonet/soviet = 25,
		/obj/item/weapon/gauze_pack/bint = 25,
		/obj/item/flashlight = 25,
		/obj/item/weapon/shovel/spade/russia = 25,
		/obj/item/weapon/gun/projectile/boltaction/mosin = 25,
		/obj/item/ammo_magazine/mosin = 50,
		/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/soviet = 25,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/soviet = 25,
	)

/obj/structure/vending/medrack
	name = "Medkit rack"
	desc = "a locker with all the medcine you need."
	icon_state = "medvender"
	products = list(
	/obj/item/weapon/storage/firstaid/fire = 5,
	/obj/item/weapon/storage/firstaid/regular = 5,
	/obj/item/weapon/storage/firstaid/toxin = 5,
	/obj/item/weapon/storage/firstaid/o2 = 5,
	/obj/item/weapon/storage/firstaid/adv = 5,
	/obj/item/weapon/storage/firstaid/combat = 2,
	/obj/item/weapon/storage/firstaid/surgery = 3,
	/obj/item/weapon/storage/firstaid/injectorpack = 5,

	)

/obj/structure/vending/med_cabinet
	name = "Medicine Cabinet"
	desc = "a cabinate full of bottles of medcine and pills."
	icon_state = "medicen_vender"
	products = list(
	/obj/item/weapon/reagent_containers/syringe = 30,
	/obj/item/weapon/reagent_containers/syringe/ld50_syringe = 5,
	/obj/item/weapon/reagent_containers/syringe/inaprovaline = 15,
	/obj/item/weapon/reagent_containers/syringe/antitoxin = 15,
	/obj/item/weapon/reagent_containers/syringe/antiviral = 15,
	/obj/item/weapon/reagent_containers/syringe/morphine = 20,
	/obj/item/weapon/storage/pill_bottle/antitox = 5,
	/obj/item/weapon/storage/pill_bottle/bicaridine = 5,
	/obj/item/weapon/storage/pill_bottle/dexalin_plus = 5,
	/obj/item/weapon/storage/pill_bottle/dermaline = 5,
	/obj/item/weapon/storage/pill_bottle/dylovene = 5,
	/obj/item/weapon/storage/pill_bottle/inaprovaline = 5,
	/obj/item/weapon/storage/pill_bottle/kelotane = 5,
	/obj/item/weapon/storage/pill_bottle/penicillin = 5,
	/obj/item/weapon/storage/pill_bottle/tramadol = 5,
	/obj/item/weapon/storage/pill_bottle/citalopram = 5,
	/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = 8,
	/obj/item/weapon/reagent_containers/glass/bottle/stoxin = 8,
	/obj/item/weapon/reagent_containers/glass/bottle/antitoxin = 8,
	/obj/item/weapon/doctor_handbook = 5,

	)

/obj/structure/vending/chem_cabinet
	name = "Chemical Cabinet"
	desc = "a cabinet full of all chemicals and other thing to us to make new chemicals."
	icon_state = "chem_vender"
	products = list(
	/obj/item/weapon/reagent_containers/syringe = 20,
	/obj/item/weapon/reagent_containers/dropper = 15,
	/obj/item/weapon/storage/pill_bottle = 30,
	/obj/item/weapon/reagent_containers/glass/beaker = 10,
	/obj/item/weapon/reagent_containers/glass/bottle/ammonia = 5,
	/obj/item/weapon/reagent_containers/glass/bottle/diethylamine = 5,
	/obj/item/weapon/reagent_containers/glass/bottle/pacid = 5,
	/obj/item/weapon/reagent_containers/glass/bottle/capsaicin = 5,
	/obj/item/weapon/reagent_containers/glass/bottle/frostoil = 5,

	)
//	idle_power_usage = 0
