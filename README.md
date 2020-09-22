# Easy Parametric Cable Chain

A fully parametric cable chain made in [OpenSCAD](http://www.openscad.org/).

I needed some cable chains for my MPCNC, and while there are already a number of good cable chains on Thingiverse, I wanted to remix some of my favorite features into a single easily modifiable and remixable model. So, here it is.

Features include:

* OpenSCAD code for all parts
* Fully Parametric Design - just edit `parameters.scad` to modify chain geometry
* Modularization, so link components can be added to other models (see the MPCNC directory for examples)
* a long link for stretches that don't move
* a sprue

I made this for a MPCNC (Burly version) build, so I included various mounts and brackets I made for it, in case anyone finds them useful.

## SCAD Files

* `parameters.scad` - Base Chain Geometry parameters.  Change a variable and the result will carry through to all the other models. Most of the variables have been commented.
* `link.scad` - modelled link geometry. This file will directly render a link and clip, or you can `use` this file in others to use the `full_link()`, `link_back()`, `link_mid()`, `link_front()`, and `clip()` functions to incorporate into your own models.
* `long_link.scad` - as it says, a longer link. I realized about half of my chains wouldn't actually need to move, so I made this.
* `ends.scad` - the basic chain ends, with screw holes for mounting.
* `clip_sprue.scad` - the clips printed on their own are a bit of work to remove from a print bed, so I joined them into a simple sprue to make them somewhat easier to manage.
* `MPCNC` - a folder of related brackets for the Burly MPCNC.
	* `center_chain_bracket.scad` - a mount that connects to the X trucks for mounting an angle bracket along the axis. This is how I ran a cable chain to the head.
	* `xy_mount.scad` - clips with "B" ends that snap onto the 3/4" galvanized pipe I used for my axes.
	* `z_mount.scad` - this clips onto the head assembly via two bolts and nuts.

The connector studs have a slope cut in the bottom for both ease of assembly and to make the model more reliable to print without post-processing (cleaning up overhangs, etc.). This might make it more likely that a link "pops out" if too much force is applied to a sharp bend. If this is an issue you can change `key_slope_bottom` in `parameters.scad` to 0 for no sloping.

## License

These models are made available under a [Creative Commons Attribution Share-Alike](https://creativecommons.org/licenses/by-sa/4.0/) license.
