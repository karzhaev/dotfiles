gpu_dpm_socclk=$(grep '*' /sys/class/drm/card1/device/pp_dpm_mclk | sed -e "s/.* \([0-9]*Mhz\) .*/\1/g")
gpu_busy_percent=$(cat /sys/class/drm/card1/device/gpu_busy_percent)
gpu_power_average=$(cat /sys/class/drm/card1/device/hwmon/hwmon2/power1_average | rev | cut -c7- | rev)
gpu_power_junction=$(cat /sys/class/drm/card1/device/hwmon/hwmon2/temp2_input | rev | cut -c4- | rev)

gpu=$(echo "$gpu_dpm_socclk ${gpu_busy_percent}% ${gpu_power_average}W ${gpu_power_junction}°")

network_global=$(ip route get 8.8.8.8 | grep -Po '(?<=dev\s)\w+')
network_ap=$(ip route get 192.168.1.20 | grep -Po '(?<=dev\s)\w+')

network=$(ip link show | sed -ne 's/.*\(enp[^ ]\+\): .* state \([^ ]\+\) .*/\1-\2/pg' \
	-e 's\$\ - \g')

date=$(date +'%Y-%m-%d %H:%M:%S')

echo "$gpu : $(echo $network) : $date"
