use<link.scad>;

include<parameters.scad>;

overlap = .5;

module mount_end() {
    difference() {
        //baseplate
        translate([-outer_width/2, -overlap, 0])
        cube([outer_width, outer_width+overlap, wall_thickness]);

        // inner screw hole
        translate([0, outer_width/4, -.1])
        cylinder(d=end_screw_hole_diameter, h=wall_thickness+.2);

        // outer screw hole
        translate([0, outer_width/4*3, -.1])
        cylinder(d=end_screw_hole_diameter, h=wall_thickness+.2);
    }

    //vertical walls
    for(n=[0, 1])
    mirror([n, 0, 0])
    translate([outer_width/2-wall_thickness*2, 0, 0])
    difference() {
        // bevelled wall
        linear_extrude(height=outer_height)
        polygon([
            [0, 0],
            [wall_thickness*2, outer_width],
            [wall_thickness*2, 0],
            [wall_thickness*2, -overlap],
            [0, -overlap]
        ]);
        // slope cut
        translate([-.1, 0, outer_height])
        rotate([-35, 0, 0])
        cube([wall_thickness*2+.2, outer_width*2, outer_height]);
    }
}

// male end
translate([-outer_width, 0, 0])
union() {
    translate([0, -mid_depth, 0])
    link_back();
    link_mid();
    mount_end();
}

// female end
translate([outer_width, 0, 0])
union() {
    translate([0, mid_depth, 0])
    union() {
        link_mid();
        link_front();
    }

    rotate([0, 0, 180])
    mount_end();
}
