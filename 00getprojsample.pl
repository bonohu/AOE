#! /usr/bin/env perl
# script to get GSE and related data from BioProject

my $rows = 10000;
my $sleep = 1;
my $prjgsenum2 = 999999;
my $apip = "IP.txt";

# get IP of DBCLS SRA API
open(FILE, "$apip") or die "Cannot open $apip";
while(<FILE>) {
        chomp;
        $ip = $_;
}
close FILE;

#api/bioproject/search?external_db=GEO&start=1&rows=10

# iteration
foreach my $i (1..$prjgsenum2) {
	print STDERR "$i..";
	open(FILE, "curl -s \"http://$ip/api/bioproject/search?external_db=GEO&start=$i&rows=$rows\" |") or die "Cannot open API\n";
	# after the scraping, '\n' should be inserted by running the following command
        while(<FILE>) {
                exit 0 unless(/\[\{\"Package\":/);
                s/\{\"Package\":/\n\{\"Package\":/g;
                print "$_";
        }
        close FILE;
        sleep $sleep;
}
