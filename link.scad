include<parameters.scad>;

module notch_profile(with_tolerance=false) {
    polygon([
        [clip_thickness,
         -1.25 - (with_tolerance ? tolerance/2 : 0)],
        [(with_tolerance ? -.1 : 0),
         -.75 - (with_tolerance ? tolerance/2 : 0)],
        [(with_tolerance ? -.1 : 0),
         .75 + (with_tolerance ? tolerance/2 : 0)],
        [clip_thickness,
         1.25 + (with_tolerance ? tolerance/2 : 0)]
    ]);
}

module link_back() {
    union()
    translate([0, 0, outer_height/2])
    for(n=[0, 1])
    mirror([n, 0, 0])
    translate([-outer_width/2, 0, 0])
    union() {
        translate([0, _trim, 0])
        union() {
            difference() {
                translate([0, -outer_height/2, 0])
                rotate([0, 90, 0])
                cylinder(d=outer_height, h=wall_thickness-tolerance/2);

                translate([-.1, -outer_height/2, -outer_height/2])
                cube([wall_thickness+.2, outer_height/2, outer_height]);
            }

            translate([0, -outer_height, -outer_height/2])
            cube([wall_thickness-tolerance/2, outer_height/2, outer_height/2]);

            radius = (outer_height/2);
            translate([0, -(radius*(1+cos(45))), radius*sin(45)])
            rotate([90, 0, 90])
            linear_extrude(height=wall_thickness-tolerance/2)
            polygon([
                [0, 0],
                [radius*(1-sin(45)), radius*(1-sin(45))],
                [radius*cos(45), radius*(1-sin(45))],
                [radius*cos(45), 0]
            ]);
        }

        translate([0, -outer_height/2, -outer_height/2])
        cube([wall_thickness-tolerance/2, outer_height/2, outer_height]);

        // key
        translate([0, -outer_height/2-tolerance, 0])
        rotate([0, 90, 0])
        translate([0, 0, wall_thickness-.1])
        difference() {
            cylinder(d=key_diameter-tolerance, h=key_depth+.1-tolerance);

            translate([key_diameter/2, -key_diameter/2-1, 0])
            rotate([0, 270-key_slope_bottom, 0])
            translate([0, 0,-.9])
            cube([10,10,1]);
        }
    }
}

module link_mid() {
    translate([0, -mid_depth, 0])
    difference() {
        union() {
            translate([0, 0, outer_height/2])
            for(n=[0, 1])
            mirror([n, 0, 0])
            translate([-outer_width/2, 0, -outer_height/2])
            cube([wall_thickness * 2, mid_depth, outer_height]);

            translate([-outer_width/2, 0, 0])
            cube([outer_width, mid_depth, wall_thickness]);
        }

        translate([-outer_width/2-.5, mid_depth/2, outer_height])
        rotate([0, 90, 0])
        linear_extrude(height=outer_width+1)
        notch_profile(true);
    }
}

module link_front() {
    union()
    translate([0, 0, outer_height/2])
    for(n=[0, 1])
    mirror([n, 0, 0])
    translate([-outer_width/2 + wall_thickness, 0, 0])
    difference() {
        union() {
            translate([0, -_trim, 0])
            difference() {
                translate([tolerance/2, outer_height/2, 0])
                rotate([0, 90, 0])
                cylinder(d=outer_height, h=wall_thickness-tolerance/2);

                translate([tolerance-.1, 0, -outer_height/2])
                cube([wall_thickness-tolerance+.2, outer_height/2, outer_height]);
            }

            translate([tolerance/2, 0, -outer_height/2])
            cube([wall_thickness-tolerance/2, outer_height/2-_trim, outer_height]);
        }

        // keyhole
        translate([0, outer_height/2-_trim, 0])
        rotate([0, 90, 0])
        translate([0, 0, -.1])
        cylinder(d=key_diameter+tolerance, h=key_depth+.1+tolerance);
    }
}

module clip() {
    union() {
        for(r=[0, 180])
        rotate([0, 0, r]) {
            translate([outer_width/2-wall_thickness*2.5, 0, clip_thickness])
            rotate([0, 90, 0])
            linear_extrude(height=wall_thickness+.25)
            notch_profile(false);

            translate([outer_width/2-wall_thickness*2-clip_curve_thickness, -1.5, 0])
            cube([clip_curve_thickness, 3, clip_thickness]);

            translate([-clip_curve_thickness/2, -clip_curve_thickness, 0])
            cube([clip_curve_thickness, clip_curve_thickness*2, clip_thickness]);

            cyl_radius=(outer_width-wall_thickness*4+clip_curve_thickness)/4;

            translate([cyl_radius-clip_curve_thickness/2, 1, 0])
            difference() {
                cylinder(r=cyl_radius, h=clip_thickness);

                translate([0, 0, -.1])
                cylinder(r=cyl_radius-clip_curve_thickness, h=clip_thickness+.2);

                translate([-outer_width/2, -outer_width/2, -.1])
                cube([outer_width, outer_width/2, clip_thickness + .2]);
            }
        }
    }
}

module full_link() {
    union() {
        translate([0, -mid_depth, 0])
        link_back();
        link_mid();
        link_front();
    }
}

//translate([0, -mid_depth/2, outer_height-clip_thickness])
//translate([outer_width, 0, 0])
clip();

//full_link();
