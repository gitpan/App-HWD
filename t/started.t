#!perl

use Test::More tests => 5;

my $started;
my @lines;

# Test using the simple example
$started = `$^X -Mblib bin/hwd --started < t/simple.hwd`;
like($started, qr#Ape is working on.+ 104 - Add .+\(2/2\)#s);
like($started, qr#Chimp is working on.+ 107 - Refactor \(1/1\)#s);
is(scalar(@lines = split "\n", $started), 5, "Correct number of lines (5)");

# Test for only one user
$started = `$^X -Mblib bin/hwd --started Ape < t/simple.hwd`;
like($started, qr#Ape is working on.+ 104 - Add .+\(2/2\)#s);
unlink($started, qr#Chimp is working on.+ 107 - Refactor \(1/1\)#s);
is(scalar(@lines = split "\n", $started), 2, "Correct number of lines (2)");
