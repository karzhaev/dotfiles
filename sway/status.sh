media=$(playerctl metadata -f "{{playerName}}-{{artist}}/{{title}}-{{status}}")

gpu_dpm_socclk=$(grep '*' /sys/class/drm/card1/device/pp_dpm_mclk | sed -e "s/.* \([0-9]*Mhz\) .*/\1/g")
gpu_busy_percent=$(cat /sys/class/drm/card1/device/gpu_busy_percent)
gpu_power_average=$(cat /sys/class/drm/card1/device/hwmon/hwmon*/power1_average | rev | cut -c7- | rev)
gpu_tempr_edge=$(cat /sys/class/drm/card1/device/hwmon/hwmon*/temp1_input | rev | cut -c4- | rev)
gpu_tempr_junction=$(cat /sys/class/drm/card1/device/hwmon/hwmon*/temp2_input | rev | cut -c4- | rev)

gpu=$(echo "$gpu_dpm_socclk ${gpu_busy_percent}% ${gpu_power_average}W ${gpu_tempr_edge}/${gpu_tempr_junction}°")

timetrace_status=$(echo "$(timetrace status -o json | jq -r '.project') $(timetrace status -o json | jq -r '.trackedTimeToday')")

ping_global=
network_global=$(ip route get 8.8.8.8 | grep -Po '(?<=dev\s)\w+')
ping_global=$(ping -c1 -w1 8.8.8.8 | sed -ne 's/^.*time=\([^ ]* ms\)/\1/p; s/^.*100% packet loss.*$/LOSS/p')
network_ap=$(ip route get 192.168.1.20 | grep -Po '(?<=dev\s)\w+')

network=$(ip link show | sed -ne 's/.*\(enp[^ ]\+\): .* state \([^ ]\+\) .*/\1-\2/pg' \
	-e 's\$\ - \g')

date=$(date +'%Y-%m-%d %H:%M:%S')

echo "$media: $(echo $timetrace_status) : $gpu : $(echo $network) : $(echo $ping_global) : $date"
