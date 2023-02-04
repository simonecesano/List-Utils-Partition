use List::Utils::Partition qw/segment/;
use Test::More tests => 1;
use Test::Deep;

my $arr = "aaaaccccddeeeeefffffggggggghhhhhhhhiiiijjjjjjjjjllllllllnnnnnnnnpppppppppqqqqqqqqrrssssssssttttuuuuvvvvvvvvwwwxxxxxxxxyyz";

my $res = [ segment { $a ne $b } split "", $arr ];

my $chk = [['a','a','a','a'],['c','c','c','c'],['d','d'],['e','e','e','e','e'],['f','f','f','f','f'],['g','g','g','g','g','g','g'],['h','h','h','h','h','h','h','h'],['i','i','i','i'],['j','j','j','j','j','j','j','j','j'],['l','l','l','l','l','l','l','l'],['n','n','n','n','n','n','n','n'],['p','p','p','p','p','p','p','p','p'],['q','q','q','q','q','q','q','q'],['r','r'],['s','s','s','s','s','s','s','s'],['t','t','t','t'],['u','u','u','u'],['v','v','v','v','v','v','v','v'],['w','w','w'],['x','x','x','x','x','x','x','x'],['y','y'],['z']];

cmp_deeply(
  $res,
  $chk,
  "segment ok"
);
 
