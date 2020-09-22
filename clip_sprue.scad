use<link.scad>;

include<parameters.scad>;

sprue_count=10;

clip_width=(outer_width-wall_thickness*4+clip_curve_thickness)/2;

rail_thickness = 2;
tab_thickness = .5;

//clip();

union() {
    // clips
    for(n=[0:clip_width:clip_width*sprue_count])
    translate([0, n, 0])
    clip();

    for(n=[0,1])
    mirror([n, 0, 0])
    union() {
        // rail
        translate([outer_width/2-wall_thickness, -clip_width/2, 0])
        cube([rail_thickness, clip_width*(sprue_count+1), rail_thickness]);

        for(n=[0:clip_width:clip_width*sprue_count])
        translate([outer_width/2-wall_thickness*1.75, n-tab_thickness, 0])
        cube([wall_thickness+.1, tab_thickness*2, tab_thickness]);
    }
}
