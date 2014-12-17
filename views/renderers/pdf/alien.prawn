text "Alien Details", :size => 24
stroke_horizontal_rule

define_grid(:columns => 4, :rows => 18, :gutter => 10)

grid([1,0], [1, 0]).bounding_box { text "Codename" }
grid([1,1], [1, 1]).bounding_box { text @data.codename }

grid([2,0], [2, 0]).bounding_box { text "Blood Color" }
grid([2,1], [2, 1]).bounding_box { text @data.blood_color }

grid([3,0], [3, 0]).bounding_box { text "No. of Antennas" }
grid([3,1], [3, 1]).bounding_box { text @data.no_of_antennas.to_s }

grid([4,0], [4, 0]).bounding_box { text "No. of Legs" }
grid([4,1], [4, 1]).bounding_box { text @data.no_of_legs.to_s }

grid([5,0], [5, 0]).bounding_box { text "Home Planet" }
grid([5,1], [5, 1]).bounding_box { text @data.planet }
