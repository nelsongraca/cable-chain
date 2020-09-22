include<../parameters.scad>
use<../link.scad>

wall_size = 3;

hole_size = 4.5;
hole_inset = 2;

base_clamp_gap = 7.25;
base_clamp_height = 21 + hole_size + hole_inset * 2;
base_depth = 19;

arm_height = 15 + 26 + 30 + outer_height;
arm_depth = outer_height-_trim;

union() {
    difference() {
        // base shell
        cube([
            base_clamp_gap + wall_size*2,
            base_clamp_height + wall_size,
            base_depth
        ]);

        // gap
        translate([wall_size, -.1, -.1])
        cube([
            base_clamp_gap,
            base_clamp_height+.1,
            base_depth+.2
        ]);

        // back hole
        translate([-.1, hole_size/2 + hole_inset, hole_size/2 + hole_inset])
        rotate([0, 90, 0])
        cylinder(h=base_clamp_gap + wall_size*2 + .2, d=hole_size);

        // front hole
        translate([-.1, hole_size/2 + hole_inset, base_depth - (hole_size/2 + hole_inset)])
        rotate([0, 90, 0])
        cylinder(h=base_clamp_gap + wall_size*2 + .2, d=hole_size);
    }

    // arm
    translate([0, base_clamp_height + wall_size - .1, 0])
    cube([
        wall_size,
        arm_height + .2,
        arm_depth
    ]);

    // arm slope
    translate([0, base_clamp_height + wall_size - .1-1, 12])
    rotate([-4, 0, 0])
    cube([
        wall_size,
        arm_height + .2,
        arm_depth/2
    ]);

    //cross bar
    translate([0, base_clamp_height + wall_size + arm_height, 0])
    cube([
        wall_size + outer_width,
        wall_size * 2,
        arm_depth
    ]);

    //lower support
    translate([0, base_clamp_height + arm_height - outer_height - 3, 0])
    cube([
        outer_width-4,
        wall_size,
        arm_depth
    ]);

    // link
    translate([wall_size+outer_width/2, base_clamp_height + wall_size + arm_height, 0])
    rotate([-90, 0, 180])
    link_back();
}
