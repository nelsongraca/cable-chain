include<parameters.scad>;
use<link.scad>;

length = 150;
spacing = 25;

difference() {
    union() {
        link_back();

        // wall profile
        for(n=[0, 1])
        mirror([n, 0, 0])
        translate([-outer_width/2, 0, 0])
        union() {
            //wall span
            translate([0, length, 0])
            rotate([90, 0, 0])
            linear_extrude(height=length)
            polygon([
                [0, 0],
                [0, wall_thickness],
                [wall_thickness, wall_thickness*2],
                [wall_thickness, outer_height - wall_thickness*2.25],
                [0, outer_height - wall_thickness*1.25],
                [0, outer_height],
                [wall_thickness * 2, outer_height],
                [wall_thickness * 2, 0]
            ]);

            // leading bevel
            linear_extrude(height=outer_height)
            polygon([
                [0, 0],
                [0, wall_thickness],
                [wall_thickness*2, wall_thickness*3],
                [wall_thickness*2, 0]
            ]);

            // trailing bevel
            translate([0, length, 0])
            linear_extrude(height=outer_height)
            polygon([
                [0, 0],
                [wall_thickness*2, 0],
                [wall_thickness*2, -wall_thickness*3],
                [0, -wall_thickness]
            ]);
        }

        for(n=[0:spacing:length])
        translate([-outer_width/2, n - mid_depth*n/length, 0])
        cube([outer_width, mid_depth, wall_thickness]);

        translate([0, length, 0])
        link_front();
    }

    // notch cutouts
    for(n=[0:spacing:length])
    translate([-outer_width/2-.5, mid_depth/2 + n - mid_depth*n/length, outer_height])
    rotate([0, 90, 0])
    linear_extrude(height=outer_width+1)
    notch_profile(true);
}
