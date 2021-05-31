local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_craftitem("pala_looting:diamondstring", {
	description = S("Diamond String"),
	_doc_items_longdesc = ("Allow you to craft dynamite"),
	inventory_image = "pala_looting_diamondstring.png",
})

minetest.register_craft({
	output = "pala_looting:diamondstring",
	recipe = {
		{'mcl_mobitems:string', 'mcl_core:diamond', 'mcl_mobitems:string'},
		{'mcl_mobitems:string', 'mcl_core:diamond', 'mcl_mobitems:string'},
		{'mcl_mobitems:string', 'mcl_core:diamond', 'mcl_mobitems:string'},
	}
})