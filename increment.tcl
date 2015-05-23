#!/usr/bin/tclsh

set x 1

while {$x < 10000000 } {
	set x [expr {$x + 1}]
}

