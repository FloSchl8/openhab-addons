FROM gitpod/workspace-full

USER root

RUN wget -qO - 'https://openhab.jfrog.io/artifactory/api/gpg/key/public' | sudo apt-key add - && \
    echo 'deb https://openhab.jfrog.io/artifactory/openhab-linuxpkg stable main' | sudo tee /etc/apt/sources.list.d/openhab.list && \
    sudo apt-get update && \
    sudo apt-get -y install apt-transport-https openjdk-11-jdk

WORKDIR /tmp

RUN wget -O openhab-download.zip https://openhab.jfrog.io/artifactory/libs-release-local/org/openhab/distro/openhab/3.1.0/openhab-3.1.0.zip && \
    sudo unzip openhab-download.zip -d /opt/openhab && \
    rm openhab-download.zip && \
    sudo chown -hR gitpod:gitpod /opt/openhab
    # sudo su -s /bin/bash -c '/opt/openhab/start.sh' openhab

