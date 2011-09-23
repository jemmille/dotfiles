#!/usr/bin/perl

# usage: nagios_scraper.pl [user:password@]nagios_host STATUS
# To use this with the .screenrc in this repo you MUST enter your username and password as well
# as a valid URL to the nagios installation
# You also may need to verify the path to your tac.cgi file and modify line 16 accordingly
# where STATUS is green, red, yellow or all

$nagios_host="<nagios_url>";
$nagios_host_friendly="nag"
$show=shift;
$user_nm="<username>";
$pass_wd='<password>';


open TAC,"wget --timeout=2 -q --no-check-certificate --user=${user_nm} --password='${pass_wd}' -O - https://$nagios_host/nagios/cgi-bin/tac.cgi |"; @tac = <TAC>;
close TAC;

foreach $line (@tac){
  if ($line =~ /(\d+) Down/){  $hosts_down = $1; }
    elsif ($line =~ /(\d+) Unreachable/){  $hosts_unreachable = $1; }
    elsif ($line =~ /(\d+) Up/){  $hosts_up = $1; }
    elsif ($line =~ /(\d+) Pending/){  $hosts_pending = $1; }
    elsif ($line =~ /(\d+) Critical/){  $services_critical = $1; }
    elsif ($line =~ /(\d+) Warning/){  $services_warning = $1; }
    elsif ($line =~ /(\d+) Unknown/){  $services_unknown = $1; }
    elsif ($line =~ /(\d+) Ok/){  $services_ok = $1; }
    elsif ($line =~ /(\d+) Pending/){  $services_pending = $1; }
  }

#remove the username and password from the output
$nagios_host =~ s/.*\@//;

if($show eq "green" && ($hosts_down == 0 && $services_cricical == 0 && $services_warning == 0)){
  print "$nagios_host_friendly: OK";

  }

  elsif($show eq "red" && ($hosts_down > 0 || $services_cricical > 0)){
    print "$nagios_host_friendly: ${hosts_down}D ${services_critical}C ";

  }

  elsif($show eq "yellow" && $services_warning > 0){
    print "$nagios_host_friendly: ${services_warning}W ";

  }

  elsif($show eq "all"){
    print "${hosts_down}D ${hosts_up}U ${services_critical}C ${services_warning}W ${services_ok}OK";

  }
    


