# author: muzhan
import os
import sys
import time

cmd = 'python run-gpu.py'

# def gpu_info():
#     gpu_status = os.popen('nvidia-smi | grep %').read().split('|')
#     gpu_memory = int(gpu_status[2].split('/')[0].split('M')[0].strip())
#     gpu_power = int(gpu_status[1].split('   ')[-1].split('/')[0].split('W')[0].strip())
#     return gpu_power, gpu_memory

def gpu_info(gpu_index=2):
    info = os.popen('nvidia-smi | grep %').read().split('\n')[gpu_index].split('|')
    power = int(info[1].split()[-3][:-1])
    memory = int(info[2].split('/')[0].strip()[:-3])
    return power, memory

def narrow_setup(interval=2):
    gpu_power, gpu_memory = gpu_info()
    i = 0
    while gpu_memory > 1000 or gpu_power > 20:  # set waiting condition
        gpu_power, gpu_memory = gpu_info()
        i = i % 5
        symbol = 'monitoring: ' + '>' * i + ' ' * (10 - i - 1) + '|'
        gpu_power_str = 'gpu power:%d W |' % gpu_power
        gpu_memory_str = 'gpu memory:%d MiB |' % gpu_memory
        sys.stdout.write('\r' + gpu_memory_str + ' ' + gpu_power_str + ' ' + symbol)
        sys.stdout.flush()
        time.sleep(interval)
        i += 1
    print('\n' + cmd)
    os.system(cmd)


if __name__ == '__main__':
    narrow_setup()