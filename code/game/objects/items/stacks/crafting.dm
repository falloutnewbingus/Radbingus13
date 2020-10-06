/obj/item/stack/crafting
    name = "crafting part"
    icon = 'icons/fallout/objects/items.dmi'
    amount = 1
    max_amount = 50
    throw_speed = 3
    throw_range = 7
    w_class = WEIGHT_CLASS_TINY
    novariants = TRUE

/obj/item/stack/crafting/metalparts
    name = "metal parts"
    icon_state = "sheet-metalparts"
    singular_name = "metal part"
    materials = list(MAT_METAL=10000)
    flags_1 = CONDUCT_1

/obj/item/stack/crafting/metalparts/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/weldingtool))
		if(get_amount() < 2)
			to_chat(user, "<span class='warning'>You need at least two parts to do this!</span>")
			return

		if(W.use_tool(src, user, 0, volume=40))
			var/obj/item/stack/sheet/metal/new_item = new(usr.loc)
			user.visible_message("[user.name] shaped [src] into metal with [W].", \
						 "<span class='notice'>You shape [src] into metal with [W].</span>", \
						 "<span class='italics'>You hear welding.</span>")
			var/obj/item/stack/crafting/metalparts/R = src
			src = null
			var/replace = (user.get_inactive_held_item()==R)
			R.use(2)
			if (!R && replace)
				user.put_in_hands(new_item)

/obj/item/stack/crafting/metalparts/three
    amount = 3

/obj/item/stack/crafting/metalparts/five
    amount = 5

/obj/item/stack/crafting/goodparts
    name = "high quality metal parts"
    icon_state = "sheet-goodparts"
    singular_name = "high quality metal part"
    materials = list(MAT_TITANIUM=10000)
    materials = list(MAT_METAL=50000)
    flags_1 = CONDUCT_1

/obj/item/stack/crafting/goodparts/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/weldingtool))
		if(get_amount() < 2)
			to_chat(user, "<span class='warning'>You need at least two parts to do this!</span>")
			return

		if(W.use_tool(src, user, 0, volume=40))
			var/obj/item/stack/sheet/metal/new_item = new(usr.loc)
			user.visible_message("[user.name] shaped [src] into metal with [W].", \
						 "<span class='notice'>You shape [src] into metal with [W].</span>", \
						 "<span class='italics'>You hear welding.</span>")
			var/obj/item/stack/crafting/goodparts/R = src
			src = null
			var/replace = (user.get_inactive_held_item()==R)
			R.use(2)
			if (!R && replace)
				user.put_in_hands(new_item)

/obj/item/stack/crafting/goodparts/three
    amount = 3

/obj/item/stack/crafting/goodparts/five
    amount = 5

/obj/item/stack/crafting/electronicparts
    name = "electronic parts"
    icon_state = "sheet-electronicparts"
    singular_name = "electronic part"
    materials = list(MAT_GLASS=10000)
    flags_1 = CONDUCT_1

/obj/item/stack/crafting/electronicparts/three
    amount = 3

/obj/item/stack/crafting/electronicparts/five
    amount = 5

/obj/item/stack/crafting/powder
	name = "bullet remnants"
	desc = "A pouch containing some scoops of blackpowder and empty shell casings."
	icon_state = "sheet-powder"
	singular_name = "bullet remnant"
	max_amount = 60
	full_w_class = WEIGHT_CLASS_SMALL

GLOBAL_LIST_INIT(powder_recipes, list ( \
	new/datum/stack_recipe("scavenge blackpowder", /obj/item/reagent_containers/glass/bottle/blackpowder, 60), \
	new/datum/stack_recipe("salvage metal from casings", /obj/item/stack/sheet/metal, 30), \
))

/obj/item/stack/crafting/powder/Initialize(mapload, new_amount, merge = TRUE)
	recipes = GLOB.powder_recipes
	return ..()