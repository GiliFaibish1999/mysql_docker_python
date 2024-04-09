FROM ubuntu/mysql:8.0-22.04_beta

# Define DB
COPY ./combo.sql /docker-entrypoint-initdb.d/init.sql

# Add users tom and zoe
RUN useradd -ms /bin/bash tom && \
    useradd -ms /bin/bash zoe && \
    echo "CREATE USER 'tom'@'%' IDENTIFIED WITH mysql_native_password BY '';" > /docker-entrypoint-initdb.d/01-create-tom-user.sql && \
    echo "GRANT ALL PRIVILEGES ON *.* TO 'tom'@'%' WITH GRANT OPTION;" >> /docker-entrypoint-initdb.d/01-create-tom-user.sql && \
    echo "CREATE USER 'zoe'@'%' IDENTIFIED WITH mysql_native_password BY '';" > /docker-entrypoint-initdb.d/02-create-zoe-user.sql && \
    echo "GRANT ALL PRIVILEGES ON *.* TO 'zoe'@'%' WITH GRANT OPTION;" >> /docker-entrypoint-initdb.d/02-create-zoe-user.sql

    