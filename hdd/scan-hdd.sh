#!/bin/bash

# 扫描：硬盘型号=“ST16000NM001G-2KK103” 的数量以及健康的硬盘数量
# Need: sudo apt install smartctl

# 确定硬盘设备目录
disk_dir="/home/ct/disk"

# 统计 ST16000NM001G-2KK103 型号的硬盘总数和健康状态为 PASSED 的硬盘总数
total_st16000=0
total_passed=0

# 轮询所有硬盘
for disk in $(cat "$disk_dir"); do
    # 确定硬盘的设备路径
    device="/dev/$disk"

    # 检查硬盘是否存在
    if [ -e "$device" ]; then
        echo "Checking $device ..."

        # 获取硬盘型号
        model=$(sudo smartctl -i $device | grep "Device Model" | awk -F: '{print $2}' | xargs)

        # 获取硬盘健康信息
        health=$(sudo smartctl -H $device | grep "overall-health" | awk -F: '{print $2}' | xargs)

        # 输出硬盘型号和健康信息
        echo "Device: $device"
        echo "Model: $model"
        echo "Health: $health"
        echo "---------------------------"

        # 统计 ST16000NM001G-2KK103 型号的硬盘总数
        if [[ "$model" == "ST16000NM001G-2KK103" ]]; then
            total_st16000=$((total_st16000 + 1))

            # 统计健康状态为 PASSED 的硬盘数量
            if [[ "$health" == "PASSED" ]]; then
                total_passed=$((total_passed + 1))
            fi
        fi
    else
        echo "Device $device not found or not available."
    fi
done

# 输出统计结果
echo "Total ST16000NM001G-2KK103 hard drives: $total_st16000"
echo "Total PASSED health status: $total_passed"