#!usr/bin/perl

=head 

Author: Vipul Todarwal (Jain)

* This script splits 2nd column by semicolon and puts elements on new row with repeated relevent 1st column element.

Example: 

INPUT
	chr17_7579867_G_	COSM100007; COSM100008; COSM100010


OUTPUT
	chr17_7579867_G_	COSM100007
	chr17_7579867_G_	COSM100008
	chr17_7579867_G_	COSM100010  
=cut

$INfilename = $ARGV[0];
$OUTfilename = $ARGV[1];


$columntosplit=2, $j=0;
$splitchar=";";
unless(open(V,$INfilename)){
print "\n\nCan't open file $INfilename";
}

@data=<V>;

close(V);

foreach $aline(@data){
$wt1='';
$wt2='';
$wt3='';

chomp $aline;

@bline=split('\t',$aline);

$column=$bline[$columntosplit-1];

@split=split($splitchar,$column);

$len=scalar@split;

$wt1=$bline[0];

for ($i=0;$i<$len;$i++){

$wt2=$split[$i];
$wt3="\n";
@entry[$j]=$wt1."\t".$wt2."\t".$wt3;
$j++;
}
unless(open(OUTS,">$OUTfilename")){
print "\n\nCan't open output file $OUTfilename ...";
}

print OUTS @entry;

}


exit;
