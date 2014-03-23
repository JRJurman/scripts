#!/usr/bin/ruby
# Script to start virtual box manager and ssh as soon as it's ready

# Grab the current state of the machine
vm = ARGV[0] ? ARGV[0] : "TallyArch"
info = `VBoxManage showvminfo #{vm}`
statusIndex = info.split(?\n).index { |e| /State:/ =~ e }
statusValue = info.split(?\n)[statusIndex]
puts statusValue

# Kick off the machine if it's off
if (/running/ =~ statusValue) == nil
  `VBoxManage startvm #{vm} --type headless`
end

# While we are getting nothing from ping
# keep pinging until we get an echo back
ip = ARGV[1] ? ARGV[1] : '192.168.56.101'
pingStatus = "Lost = 1"
counter = 0
while ( /Lost = 1/ =~ pingStatus ) != nil
  pingStatus = `ping -n 1 -w 1000 #{ip}`

  print "Loading#{'.'*(counter%4)} \t ping lost packet \r"
  counter += 1
end
if ( /Lost = 0/ =~ pingStatus ) != nil
  puts "Loading Done! Make sure to close everything when your done!"
end

puts pingStatus
