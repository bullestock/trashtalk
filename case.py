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

slot_w = 14
slot_h = 2

slot_v_offset = 11.5
slot_h_offset = 15

recess_w = slot_w+4
recess_h = slot_h+4

outside_w = inside_w + 2*d
outside_l = inside_l + 2*d
outside_h = inside_h + 2*d

hole_y_offset = 0
hole_z_offset = 15

def outer():
    return translate([-outside_w/2, -outside_l/2, 0])(cube([outside_w, outside_l, outside_h]))

def inner():
    return translate([-inside_w/2, -inside_l/2, d])(cube([inside_w, inside_l, inside_h+3*d]))

def card_slot():
    return translate([-2*d-inside_w/2, -slot_w/2-slot_h_offset, slot_v_offset])(cube([3*d, slot_w, slot_h]))

def recess():
    return translate([-inside_w/2-1.5*d, -recess_w/2-slot_h_offset, slot_v_offset-(recess_h-slot_h)/2])(cube([d, recess_w, recess_h]))

def usb_hole():
    h = 7
    w = 10
    return translate([inside_w/2-d, outside_l/2-w-11, 14+h/2])(rotate([0, 90, 0])(cube([h, w, 3*d])))

def wire_hole(direction):
    return translate([outside_w/2-2*d if direction > 0 else -outside_w/2-d, 0, outside_h-6])(back(2)(cube([3*d, 4, 7]))+rotate([0, 90, 0])(cylinder(r = 2, h = 3*d)))

def lidsups():
    l = up(inside_h-d)(cylinder(h = 2, r = 2))
    return translate([-inside_w/2, -inside_l/2])(l) + translate([-inside_w/2, inside_l/2])(l) + translate([inside_w/2, -inside_l/2])(l) + translate([inside_w/2, inside_l/2])(l)

def screwhole():
    return translate([0, -outside_l/2+d*2, outside_h-10])(rotate([90, 0, 0])(cylinder(r = 2, h = 3*d)))

def assembly():
    return outer() - usb_hole() - card_slot() - inner() - recess() +  lidsups() - forward(outside_w/2-6)(wire_hole(1)) - back(outside_w/2-6)(wire_hole(-1)) - left(15)(screwhole()) - right(15)(screwhole())

if __name__ == '__main__':
    a = assembly()
    scad_render_to_file(a, file_header='$fn = %s;' % SEGMENTS, include_orig_code=False)
