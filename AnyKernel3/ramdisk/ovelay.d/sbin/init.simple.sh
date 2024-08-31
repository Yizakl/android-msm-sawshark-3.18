################################################################################
# helper functions to allow Android init like script

function write() {
    echo -n $2 > $1
}

function get-set-forall() {
    for f in $1 ; do
        cat $f
        write $f $2
    done
}

################################################################################

sleep 5

# Block
for block_device in /sys/block/*
	do
		echo 128 > $block_device/queue/read_ahead_kb
		echo 256 > $block_device/queue/nr_requests
	done

write /sys/devices/system/cpu/cpu0/cpufreq/max_freq 1267200
write /sys/devices/system/cpu/cpu0/cpufreq/min_freq 400000
write /sys/devices/system/cpu/cpu1/cpufreq/max_freq 1267200
write /sys/devices/system/cpu/cpu1/cpufreq/min_freq 400000
write /sys/devices/system/cpu/cpu2/cpufreq/max_freq 1267200
write /sys/devices/system/cpu/cpu2/cpufreq/min_freq 400000
write /sys/devices/system/cpu/cpu3/cpufreq/max_freq 1267200
write /sys/devices/system/cpu/cpu3/cpufreq/min_freq 400000
write /sys/class/kgsl/kgsl-3d0/devfreq/max_freq 307200000
write /sys/class/kgsl/kgsl-3d0/devfreq/min_freq 200000000

write /sys/class/devfreq/soc:qcom,cpubw/governor "bw_hwmon"
write /sys/class/devfreq/soc:qcom,cpubw/bw_hwmon/bw_step 60
write /sys/class/devfreq/soc:qcom,cpubw/bw_hwmon/guard_band_mbps 30
write /sys/class/devfreq/soc:qcom,gpubw/bw_hwmon/io_percent 40
write /sys/class/devfreq/soc:qcom,gpubw/bw_hwmon/bw_step 60
write /sys/class/devfreq/soc:qcom,gpubw/bw_hwmon/guard_band_mbps 30

write /proc/sys/kernel/sched_schedstats 0
write /proc/sys/kernel/printk_devkmsg off
write /proc/sys/vm/dirty_background_ratio 2
write /proc/sys/vm/dirty_ratio 5
write /proc/sys/vm/dirty_expire_centisecs 500
write /proc/sys/vm/dirty_writeback_centisecs 500
write /proc/sys/vm/page-cluster 0
write /proc/sys/vm/stat_interval 10
write /proc/sys/vm/swappiness 100
write /proc/sys/vm/vfs_cache_pressure 100
