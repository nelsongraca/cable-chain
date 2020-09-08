include<parameters.scad>
use<link.scad>

pipe_size = 23.5+tolerance*2;
sleeve_thickness = 2;
spacing = 10;

union() {
    difference() {
        union() {
            cylinder(d=pipe_size+sleeve_thickness*2, h=outer_width);

            translate([
                0,
                pipe_size/2+sleeve_thickness-outer_height,
                outer_width-(wall_thickness-tolerance/2)
            ])
            cube([
                pipe_size/2+sleeve_thickness+spacing+.1,
                outer_height,
                wall_thickness-tolerance/2
            ]);
            translate([
                0,
                pipe_size/2+sleeve_thickness-outer_height,
                0
            ])
            cube([
                pipe_size/2+sleeve_thickness+spacing+.1,
                outer_height,
                wall_thickness-tolerance/2
            ]);

            linear_extrude(height=outer_width)
            polygon([
                [0, pipe_size/2+sleeve_thickness],
                [10, pipe_size/2+sleeve_thickness],
                [pipe_size/2+sleeve_thickness+spacing/2, 0],
                [0, 0]
            ]);
        }

        translate([0, 0, -.1])
        cylinder(d=pipe_size, h=outer_width+.2);

        rotate([0, 0, -135])
        translate([0, 0, -.1])
        cube([pipe_size, pipe_size, outer_width+.2]);
    }


    translate([
        outer_width/2+sleeve_thickness+spacing,
        pipe_size/2+sleeve_thickness,
        outer_width/2
    ])
    rotate([90, -90, 0])
    link_back();
}
