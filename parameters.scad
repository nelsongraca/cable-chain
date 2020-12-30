// design tolerance values, used in some places to ensure fit.  You may modify this value depending on the accuracy of your 3D printer
tolerance = .2;

// full width of chain, including walls
outer_width = 25;
// full height of chain, including base
outer_height = 12;

// length of middle section between back and front of link
mid_depth = 10;

// thickness of walls
wall_thickness = 1.5;

// the "key" is the circular tab that locks the links together and serves as a rotation axle.
key_diameter = 5;
key_depth = wall_thickness*1.75;
// the bottom of the key has a slope to avoid any filament drooping so manual post-processing shouldn't be necessary. You may not need this; it does give the links a slight tendency to snap out if bent beyond the intended range (though this may also be desirable).
key_slope_bottom = 45;

// Z thickness of overall clip
clip_thickness = wall_thickness;

end_screw_hole_diameter = 3.5;

_trim = 1;

$fa = 3;
$fs = 1;
