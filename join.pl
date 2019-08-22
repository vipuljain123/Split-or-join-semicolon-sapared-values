#!usr/bin/perl


=head 

* This script makes 1st column unique and puts relevent elements of 2nd column in 1 row separated by semicolon.

Example: 

INPUT
	chr17_7579867_G_	COSM100007
	chr17_7579867_G_	COSM100008
	chr17_7579867_G_	COSM100010  


OUTPUT
	chr17_7579867_G_	COSM100007; COSM100008; COSM100010


=cut

use List::MoreUtils qw/ uniq /;


$INfilename = $ARGV[0];
$OUTfilename = $ARGV[1];

$fname="j";
unless(open(I,"$INfilename")){
print "\n\nCan't open input file $INfilename";
}

@data=<I>;

close(I);

$i=0, $j=0, $k=0, $a=0;
@fcolumn='';

# extract unique elements from column

foreach $line (@data){

@elements='';

@elements=split("\t",$line);

$fcolumn[$i]=@elements[0];

$i++;

}

@unique = uniq @fcolumn;

# perform join using unique list

foreach $uline (@unique){
$r1=0;
@s1='';
$a++;
print "\n\n\t",$a;

foreach $line2 (@data){
@elements2='';

@elements2=split('\t',$line2);

if ($elements2[0] eq $uline){
$elements2[1] =~ s/\n//g;
$s1[$j]=$elements2[1]."; ";
$j++;
}
}

$r1=join('',@s1);
chop($r1);
chop($r1);
$r2=$r1."\n";

print "\n\n\t",$r2, "\t\n";
$result[$k]=$uline."\t".$r2;
$k++;
}

unless(open(O,">$OUTfilename")){
print "\n\nCan't open output file...";
}

print O @result;

exit;




