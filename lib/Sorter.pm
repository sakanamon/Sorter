use strict;
use warnings;
package Sorter;

sub new {
    my $class = shift;
    my $self = { values=>[] };
    return bless $self, $class;
}

sub set_values {
    my $self = shift;
    $self->{values} = [ @_ ];
}

sub get_values {
    my $self = shift;
    @{$self->{values}};
}

sub sort {
    my $self = shift;
    qsort($self->{values}, 0, $#{$self->{values}});
}

sub qsort {
    my $array = shift;
    my $left = shift;
    my $right = shift;
    my ($i, $j, $pivot, $tmp);
    if ($left < $right) {
        $i = $left;
        $j = $right;
        $pivot = $array->[($left+$right)/2];
        while ($i <= $j) {
            while ($array->[$i] < $pivot) { $i++; }
            while ($array->[$j] > $pivot) { $j--; }
            if ($i <= $j) {
		$tmp = $array->[$i];
		$array->[$i] = $array->[$j];
		$array->[$j] = $tmp;
		$i++;
		$j--;
            }
        }
        qsort($array, $left, $j);
        qsort($array, $i, $right);
    }
}
1;
