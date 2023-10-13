#!/bin/bash

# Define the list of VLANs
vlanlist=(1 2 32)

# Output file to store the results
output_file="ping_results.txt"

# Clear the output file (if it exists)
> "$output_file"

# Function to ping an IP address and save the results
perform_ping() {
    ip="$1"
    if ping -c 1 "$ip" >/dev/null 2>&1; then
        echo "IP: $ip is up" >> "$output_file"
    fi
}

# Iterate through the list of VLANs and perform ping
for vlan in "${vlanlist[@]}"; do
    for i in {0..255}; do
        ip="10.16.$vlan.$i"
        perform_ping "$ip"
    done
done

echo "Results are stored in $output_file"

