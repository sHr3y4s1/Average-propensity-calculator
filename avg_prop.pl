print "Enter the file name:" ;
$filename=<STDIN>;
chomp $filename;

open (FILE, $filename);
open(OUT,">>Avg_propensity.txt");
@file = <FILE>; 
close FILE;

$seq=join ('',@file);

$fline=index($seq,"\n");
$seq=substr($seq,$fline+1);
$seq =~ s/\s+//g;
$size=length($seq);
@seq=split("",$seq);


%a = qw(A 1.42
         R 0.98 
         N 0.67
         D 1.01
         C 0.70
         E 1.39
         Q 1.11
         G 0.57
         H 1.00
         I 1.08
         L 1.41
         K 1.14
         M 1.45
         F 1.13
         P 0.57
         S 0.77
         T 0.83
         W 1.08
         Y 0.69
         V 1.06); 

%b = qw(A 0.83
         R 0.93 
         N 0.89
         D 0.54
         C 1.19
         E 1.17
         Q 1.10
         G 0.75
         H 0.87
         I 1.60
         L 1.30
         K 0.74
         M 1.05
         F 1.38
         P 0.55
         S 0.75
         T 1.19
         W 1.37
         Y 1.47
         V 1.70); 

print OUT"Sequence\tAverage P(a)\t\tAverage P(b)\n";
while($size>=8)
{
$aprop=0;
$aavg=0;
for ($i = 0 ; $i < 8 ; $i++)
{
   $aa = @seq[$i];
   $inter=join("",@seq);
   $seqto=substr($inter,0,8);
   foreach (keys%a)
   {
      if($aa eq $_)
      {
        $aprop+=$a{$_};
      }
   }
}
print $aprop,"\n";
$aavg=$aprop/8;
print OUT"$seqto\t\t";
if($aavg>1)
{
 print OUT"$aavg\t\t\t";
}
else 
{ print OUT"--\t\t\t";}


$bprop=0;
$bavg=0;
for ($i = 0 ; $i < 8 ; $i++)
{
   $bb = @seq[$i];
   foreach (keys%b)
   {
      if($bb eq $_)
      {
        $bprop+=$b{$_};
      }
   }
}

$bavg=$bprop/8;
if($bavg>1)
{
 print OUT"$bavg\n";
}
else 
{ print OUT"--\n";}
shift(@seq);
$size=$size-1;
}


close OUT;
