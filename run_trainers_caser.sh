#!/bin/bash
worker_id=$1 #ID in RPC
world_size=$2 #World Size for rpc
master_ip=$3 #Master IP
dist_worker_id=$4 #workerID for distributed
world_size_trainers=$5 #world size trainers
dist_master_ip=$6 # dist master IP
logging_prefix=$7
stop_iter=$8
cache_size=$9
source activate pytorch_latest_p37
python examples/trainer_caser_main.py --worker-id $worker_id --lookahead-value 200 --world-size $world_size --cache-size $cache_size --master-ip $master_ip --dist-worker-id $dist_worker_id --world-size-trainers $world_size_trainers --dist-master-ip $dist_master_ip --device cuda:0 --emb-info-file /home/ubuntu/emb_table_info_h.txt --logging-prefix $logging_prefix --dist-backend nccl --stop-iter $stop_iter --s3 2>&1 | tee out
