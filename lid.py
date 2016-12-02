#! /usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import division
import os
import sys
import re

# Assumes SolidPython is in site-packages or elsewhwere in sys.path
from solid import *
from solid.utils import *
from defs import *

SEGMENTS = 16

lid_h = 5+d

hole_x_offset = 6
hole_y_offset = 18.5
corr = 0.5

def outer():
    return translate([-(inside_w-corr)/2, -(inside_l-corr)/2, 0])(cube([inside_w-corr, inside_l-corr, lid_h]))

def inner():
    x = inside_w-2*d
    y = inside_l-2*d
    return translate([-x/2, -y/2, -0.1])(cube([x, y, lid_h-d]))

def hole():
    return translate([hole_x_offset, -hole_y_offset, -d])(cylinder(r = 3.5, h = lid_h+2*d))

def assembly():
    return rotate([180, 0, 0])(outer() - hole() - inner())

if __name__ == '__main__':
    a = assembly()
    scad_render_to_file(a, file_header='$fn = %s;' % SEGMENTS, include_orig_code=False)
