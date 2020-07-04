# Easy Parametric Cable Chain

A parametric cable chain made in [OpenSCAD](http://www.openscad.org/).

There's a number of good cable chains on Thingiverse; I liked the removable top clip of [this one](https://www.thingiverse.com/thing:611593) but I wanted to change some dimensions (and incorporate links into some other designs) and the SCAD files weren't very conducive to the kind of changes I wanted. So, I figured it would be a fun project to design my own from scratch!

the connector studs have a slope cut in the bottom for both ease of assembly and to make the model more reliable to print without post-processing. This can potentially lead to a joint "pinching" out of its socket if too much force is applied to a sharp bend. If this is an issue I've put a flag in `parameters.scad` to disable it.

I made this for a MPCNC (Burly version) build, so I included the mounts I made for that, in case anyone finds them useful.

## Usage

Most chain parameters are found in `parameters.scad`.  Change a variable in that file and the new value will carry through to all the other files.  The link & clip geometry is in `link.scad` and imported into the other files.

I tried to make the links not too tight, but they still have a little bit of friction. If your printer's tolerances are different than mine, you may need to bump up the `tolerance` variable.

## License

These models are made available under a [Creative Commons Attribution Share-Alike](https://creativecommons.org/licenses/by-sa/4.0/) license.
