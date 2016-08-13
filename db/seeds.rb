# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	# color_list = [ 
	# 	["#C1392B","#E84C3D"],
	# 	["#8F44AD", "#773696"],
	# 	["#2A80B9", "#3598DC"],
	# 	["#11826D", "#16A086"],
	# 	["#CC4A8E", "#E55C9D"],
	# 	["#038E52", "#01B169"],
	# 	["#273A49", "#34495E"],
	# 	["#39B3D3", "#4DC9F4"],
	# 	["#D9434E", "#ED5564"],
	# 	["#8EB021", "#A5C63B"],
	# 	["#EA7FC3", "#FF9AD7"],
	# 	["#B078D3", "#C893E8"],
	# 	["#40474F", "#5F6771"],
	# 	["#D35400", "#E67E22"],
	# 	["#8E725E", "#A38671"],
	# 	["#356272", "#3A6F81"],
	# 	["#2D5036", "#345F41"],
	# 	["#5B48A2", "#745EC5"],
	# 	["#503B2C", "#5E4534"],
	# 	["#4F2B4F", "#5E345E"],
	# 	["#662621", "#79302A"],
	# 	["#99ABD5", "#B8C9F1"],
	# 	["#394C81", "#5065A1"],
	# 	["#D5C295", "#F0DEB4"],
	# 	["#8F1D21", "#9D2933"],
	# 	["#049372", "#03A678"],
	# 	["#F5AB35", "#FFB94E"],
	# 	["#C93756", "#DB5A6B"],
	# 	["#006442", "#03A678"],
	# 	["#F7CA18", "#F4D03F"],
	# 	["#757D75", "#ABB7B7"],
	# 	["#95A5A6", "#BDC3C7"],
	# 	["#22A7F0", "#19B5FE"],
	# 	["#003171", "#1F4788"],
	# 	["#8E44AD", "#9B59B6"],
	# 	["#763568", "#8D608C"],
	# 	["#5B3256", "#875F9A"],
	# 	["#F62459", "#C93756"],
	# 	["#F47983", "#F08F90"],
	# 	["#F22613", "#CF3A24"]
	# ]

	# color_list.each do |color|
	# 	Color.create(:color => color[0], :colorsec => color[1])
	# end

	case_types = ["1ra vez","Visas","Ent. Records","Contratacion","Seg. NVC","Seg. USCIS",
				"Seg. CRBA","Docs. Juarez","Checklist","I-130","Ajuste","I-90","Proc. Migratorio",
				"Waivers","C. Derivada","Visa-U","VAWA","Pet. Prometido","Huellas","RFE","Civil Mx","Criminal Mx","Criminal US"]

	for i in 0..case_types.size
		CaseType.create(:tipoCaso => case_types[i])
	end