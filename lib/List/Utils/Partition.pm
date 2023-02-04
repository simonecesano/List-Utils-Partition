use strict;
use warnings;
package List::Utils::Partition;

# ABSTRACT: splits lists based on functions

use Exporter 'import';
our @EXPORT_OK = qw(partition segment);  # symbols to export on request

use Want;

sub partition(&@) {
    my $cb = shift;
    my @input = @_;
    my %ret;
    my @keys;

    for (@input) {
	my $k = $cb->($_);
	unless ($ret{$k}) { $ret{$k} = []; push @keys, $k }
	push $ret{$k}->@*, $_;
    }
    if    (want('ARRAY')) { rreturn map { $ret{$_} } @keys }
    elsif (want('HASH'))  { rreturn \%ret }
    rreturn map { $ret{$_} } @keys;
}

sub segment(&@) {
    my $cb = shift;
    my @input = @_;

    my @retval = [];

    my $pkg = caller;
    my $max = $#input;

    for my $i (0 .. $max) {
        push @{$retval[$#retval]}, $input[$i];
        no strict 'refs';
        local *{"${pkg}::a"} = \$input[$i];
        local *{"${pkg}::b"} = \$input[$i + 1]; # autovivification!
        if (($i < $max) && $cb->()) {
            push @retval, [];
        }
    }
    pop @retval unless @{$retval[$#retval]};
    return @retval;
}

1;

=head1 NAME

List::Utils::Partition - partition lists

=head1 SYNOPSIS

    use List::Utils::Partition qw/segment partition/;

    my $segmented   = [ segment { $a ne $b } split "", "aaaaccccddeeeeefffffggggggghhhhhhhhiiiijjjjjjjjjllllllllnnnnnnnnpppppppppqqqqqqqqrrssssssssttttuuuuvvvvvvvvwwwxxxxxxxxyyz" ];

    my $partitioned = [ partition { $_ } split "", "thcevvhjnyqxpgfjwdjrggqwhvlxquipslqvjgfdespcqulqxfxjpqsrvnnxntapnhljsijnphlcuguhjastvsgseazlyetnilnhqpavgxfpxhpscwlxvijef" ];

=head1 DESCRIPTION

=head1 FUNCTIONS

=head2 partition

=head2 segment

=head1 SEE ALSO

=cut

