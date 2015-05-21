#!/usr/bin/tclsh

set x 1

while {$x < 1000000 } {
	puts "hello"
	set x [expr {$x + 1}]
}

