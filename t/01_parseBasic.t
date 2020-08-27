#!/usr/bin/env perl

use strict;
use warnings;
use lib './lib';
use File::Basename qw/dirname basename/;
use Getopt::Long qw/GetOptions/;

use Test::More tests => 1;

my $scriptDir = dirname $0;
local $0 = basename $0;
$ENV{PATH}="$0/../scripts:$ENV{PATH}";

my $tmpdir = "$scriptDir/tmp";
mkdir $tmpdir;

subtest 'basic' => sub{
  plan tests => 1;

  system("parseBruker.pl $scriptDir/raw/01.08.2020.AOH.Raw.xlsx > $tmpdir/01.08.2020.AOH.Raw.tsv");
  my $expected = readTsv("$scriptDir/expected/01.08.2020.AOH.Raw.tsv");
  my $observed = readTsv("$tmpdir/01.08.2020.AOH.Raw.tsv");

  is_deeply($observed, $expected, "Convert 01.08.2020.AOH.Raw.tsv");

};

sub readTsv{
  my($file) = @_;
  my %tsv;

  open(my $fh, $file) or BAIL_OUT "ERROR: could not read $file: $!";
  my $header = <$fh>;
  chomp($header);
  my @header = split(/\t/, $header);
  while(<$fh>){
    chomp;
    my %F;
    my @F = split /\t/;

    # Read in the line and index it according to the header
    @F{@header} = @F;

    # The special key for these spreadsheets is plate + isolate
    my $key = join("~~~", $F{plate}, $F{sample});

    $tsv{$key} = \%F;
  }
  close $fh;

  return \%tsv;
}
