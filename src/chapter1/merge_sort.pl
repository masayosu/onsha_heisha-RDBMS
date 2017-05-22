#! /usr/bin/env perl
use strict;
use warnings;

# main
my @lines;
open (READ, "<", "./merge_sort.txt");
while(<READ>){
    chomp;
    push @lines, $_;
}
close READ;

mergeSort(\@lines);

print join(',', @lines);


sub mergeSort{
    my $a = shift;
    my $a_cnt = @$a;

    if ($a_cnt > 1) {
        my $m = int($a_cnt / 2);
        my $n = $a_cnt - $m; 
    
        my @a1;
        my @a2;
        for( my $i = 0; $i < $m; $i++){ push @a1, $a->[$i];}
        for( my $i = 0; $i < $n; $i++){ push @a2, $a->[$m + $i];}

        mergeSort(\@a1);
        mergeSort(\@a2);
        merge(\@a1, \@a2, $a);
    }
}

sub merge{
    my $a1 = shift;
    my $a2 = shift;
    my $a  = shift;

    my $a1_cnt = @$a1;
    my $a2_cnt = @$a2;

    my $i = 0; # a1 index
    my $j = 0; # a2 index

    while($i < $a1_cnt || $j < $a2_cnt){
        if ( $j >= $a2_cnt || 
           ( $i < $a1_cnt  && $a1->[$i] < $a2->[$j])
        ){
            $a->[$i+$j] = $a1->[$i];
            $i++;
        }
        else{
            $a->[$i+$j] = $a2->[$j];
            $j++;
        }
    }
}
