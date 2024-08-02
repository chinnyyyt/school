#!/bin/bash

# Execute IpInfo.sh script and capture output
ip_info=$(./IpInfo.sh)

# Display only lines containing 'IP Address' using sed
echo "$ip_info" | sed -n '/IP Address/p'
