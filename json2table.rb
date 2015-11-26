#!/usr/bin/env ruby

#aws ec2 describe-instances | jq '[ .[] | .[] | .Instances[] as $ins
#  | select(.Platform == null)
#  | { instance_type: $ins.InstanceType,
#      name: ($ins.Tags[] as $ts | select($ts.Key == "Name") | $ts.Value ),
#      security_groups: $ins.SecurityGroups[].GroupName,
#      launched: $ins.LaunchTime } ]' | ./json-to-table.rb

require "json"
require "table_print"

def join_arrays row
  row.keys.each do |key|
    row[key] = row[key].join(', ') if row[key].respond_to? :join
  end
end

d = JSON.parse(ARGF.read).each { |row| join_arrays row }
w = `/usr/bin/env tput cols`.to_i
tp.set :max_width, w
tp d
