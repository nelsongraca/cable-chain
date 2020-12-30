# Easy Parametric Cable Chain

A fully parametric cable chain made in [OpenSCAD](http://www.openscad.org/).

This is a fork with only what I need from: https://gitlab.com/plaidphantom/cable-chain
I also modified the clips to someting more closed.

Features include:

* OpenSCAD code for all parts
* Fully Parametric Design - just edit `parameters.scad` to modify chain geometry
* a long link for stretches that don't move

## SCAD Files

* `parameters.scad` - Base Chain Geometry parameters.  Change a variable and the result will carry through to all the other models. Most of the variables have been commented.
* `link.scad` - modelled link geometry. This file will directly render a link and clip, or you can `use` this file in others to use the `full_link()`, `link_back()`, `link_mid()`, `link_front()`, and `clip()` functions to incorporate into your own models.
* `long_link.scad` - as it says, a longer link. I realized about half of my chains wouldn't actually need to move, so I made this.
* `ends.scad` - the basic chain ends, with screw holes for mounting.

The connector studs have a slope cut in the bottom for both ease of assembly and to make the model more reliable to print without post-processing (cleaning up overhangs, etc.). This might make it more likely that a link "pops out" if too much force is applied to a sharp bend. If this is an issue you can change `key_slope_bottom` in `parameters.scad` to 0 for no sloping.

## License

These models are made available under a [Creative Commons Attribution Share-Alike](https://creativecommons.org/licenses/by-sa/4.0/) license.
