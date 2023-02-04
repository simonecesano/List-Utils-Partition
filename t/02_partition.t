use List::Utils::Partition qw/partition/;

use Test::More tests => 1;
use Test::Deep;

$\ = "\n";

my $arr = "thcevvhjnyqxpgfjwdjrggqwhvlxquipslqvjgfdespcqulqxfxjpqsrvnnxntapnhljsijnphlcuguhjastvsgseazlyetnilnhqpavgxfpxhpscwlxvijef";

my $res = [ partition { $_ } split "", $arr ];

my $chk = [['t','t','t','t'],['h','h','h','h','h','h','h','h'],['c','c','c','c'],['e','e','e','e','e'],['v','v','v','v','v','v','v','v'],['j','j','j','j','j','j','j','j','j'],['n','n','n','n','n','n','n','n'],['y','y'],['q','q','q','q','q','q','q','q'],['x','x','x','x','x','x','x','x'],['p','p','p','p','p','p','p','p','p'],['g','g','g','g','g','g','g'],['f','f','f','f','f'],['w','w','w'],['d','d'],['r','r'],['l','l','l','l','l','l','l','l'],['u','u','u','u'],['i','i','i','i'],['s','s','s','s','s','s','s','s'],['a','a','a','a'],['z']];

cmp_deeply(
	   $res,
	   $chk,
	   "partition ok"
);

