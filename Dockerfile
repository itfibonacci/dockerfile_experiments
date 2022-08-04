FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade && apt-get install -y \
	nmap curl iproute2 iputils-ping traceroute net-tools netcat procps lsof \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

# Set user and group
ARG user=levtuman
ARG group=gamers
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${gid} ${group}
RUN useradd -u ${uid} -g ${group} -s /bin/sh -m ${user} # <--- the '-m' create a user home directory

# Switch to user
USER ${uid}:${gid}

EXPOSE 8080

#CMD ["nc", "-l", "-p", "8080"]

ENTRYPOINT [ "nc", "-l", "-p", "8080" ]
