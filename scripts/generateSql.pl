#!/usr/bin/perl -w


use strict;
use Getopt::Long;

use SQL::Abstract;

use Data::Dumper;

my $sql = SQL::Abstract->new;


my $numFields = 0;
my $tableNames = "";
my $fields = "";
my $datas = "";

my $tableName = "";
my $field = "";
my @datas = ();
my $help = "";
my $options  = GetOptions( 'table-name=s' => \$tableName,
                           'num-fields=i' => \$numFields,
                           'field=s' => \$field,
                           'data=s'   => \$datas,
                           'help'     => \$help,
                         );

my %data;

my $counter = 1;

#my @fields = split /,/, $fields; 

#/

for($i=1; $i==$numFields; $i++)
{
    print "inserting ".$field."\n";
    $data{"Id"} = $i;
    $data{$field} = $counter;
}

print Dumper(%data);

my($stmt, @bind) = $sql->insert($tableName, \%data);


print "ha: ".$stmt."\n";
