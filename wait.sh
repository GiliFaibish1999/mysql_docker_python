#!/bin/bash

max_wait_time=360 # 6 minutes
interval=5

echo "Waiting for MySQL init process to finish in the MySQL container..."

# Function to check if the logs contain the desired text
check_logs() {
    local container_id=$1
    local logs=$(docker logs "$container_id" 2>/dev/null)
    if [[ "$logs" == *"MySQL init process done. Ready for start up."* ]]; then
        return 0
    else
        return 1
    fi
}

# Start waiting loop
wait_time=0
while [ $wait_time -lt $max_wait_time ]; do
    # Get the container ID for the MySQL container
    cont=$(docker ps | grep mysql-1 | awk '{print $1}')
    if check_logs "$cont"; then
        echo "MySQL is ready for connections. wait finished."
        exit 0
    fi
    echo "Waited for $wait_time seconds."
    sleep $interval
    wait_time=$((wait_time + interval))
done

echo "Timeout reached. Text not found in logs."
exit 1