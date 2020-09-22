include<../parameters.scad>

thickness = 5;

width = 42;
corner_diameter = 5;
screw_hole_xy = 15.5;
screw_hole_diameter = 3.5;

axle_hole_diameter = 30;

mount_offset_x = -10;
mount_offset_y = 30;
mount_width = outer_width;
mount_depth = 37;
mount_support_height = 15;
mount_support_depth = 25;

$fa = 3;
$fs = 1;

mirror([1,0,0])
union() {
    // motor mount
    difference() {
        // plate
        hull()
        union() {
            translate([(width-corner_diameter)/2, (width-corner_diameter)/2, 0])
            cylinder(d=corner_diameter, h=thickness);

            translate([-(width-corner_diameter)/2, (width-corner_diameter)/2, 0])
            cylinder(d=corner_diameter, h=thickness);

            translate([-(width-corner_diameter)/2, -(width-corner_diameter)/2+2, 0])
            cylinder(d=corner_diameter, h=thickness);

            translate([(width-corner_diameter)/2, -(width-corner_diameter)/2+2, 0])
            cylinder(d=corner_diameter, h=thickness);
        }

        // axle hole
        translate([0, 0, -.1])
        cylinder(d=axle_hole_diameter, h=thickness+.2);

        // screw holes
        for(r=[0, 90, 180, 270])
        rotate([0, 0, r])
        translate([screw_hole_xy, screw_hole_xy, -.1])
        cylinder(d=screw_hole_diameter, h=thickness+.2);

        // belt opening
        difference() {
            translate([-axle_hole_diameter/2, -axle_hole_diameter, -.1])
            cube([axle_hole_diameter, axle_hole_diameter, thickness + .2]);

            // screw holes
            for(r=[0, 90, 180, 270])
            rotate([0, 0, r])
            translate([screw_hole_xy, screw_hole_xy, -.1])
            cylinder(d=screw_hole_diameter+4, h=thickness+.2);
        }
    }

    // support
    translate([-width/2, width/2, 0])
    linear_extrude(height=thickness)
    polygon([
        [0, -corner_diameter/2],
        [width, -corner_diameter/2],
        [width, -width/2],
        [width+mount_offset_x+mount_width, mount_offset_y-mount_support_height],
        [width+mount_offset_x+mount_width, mount_offset_y],
        [width+mount_offset_x, mount_offset_y]
    ]);

    // mounting
    translate([width/2+mount_offset_x, width/2+mount_offset_y, 0])
    union() {
        difference () {
            // mount plate
            cube([mount_width, thickness, mount_depth]);

            translate([mount_width/2, -.1, outer_width/4+thickness*2])
            rotate([-90, 0, 0])
            cylinder(d=end_screw_hole_diameter, h=thickness+.2);

            translate([mount_width/2, -.1, outer_width/4*3+thickness*2])
            rotate([-90, 0, 0])
            cylinder(d=end_screw_hole_diameter, h=thickness+.2);
        }

        // left mount support (from global above)
        translate([thickness, -mount_support_height, thickness])
        rotate([0, -90, 0])
        linear_extrude(height=thickness)
        polygon([
            [0, 0],
            [0, mount_support_height],
            [mount_support_depth, mount_support_height]
        ]);

        // right mount support (from global above)
        translate([mount_width, -mount_support_height, thickness])
        rotate([0, -90, 0])
        linear_extrude(height=thickness)
        polygon([
            [0, 0],
            [0, mount_support_height],
            [mount_support_depth, mount_support_height]
        ]);
    }
}
