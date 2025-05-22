FROM ubuntu:latest

USER root

# Installation des dépendances
RUN apt update && apt install -y \
    # Utilitaires
    wget \
    curl \
    unzip \
    git \
    nano \
    jq \
    # X11 deviation
    libx11-6 \
    libxrender1 \
    libxtst6 \
    libfreetype6 \
    libxi6 \
    x11-apps \
    # Runtime dependencies Python \
    python3 \
    python3-pip \
    python3-venv \
    # For running Pycharm with ubuntu user
    sudo # \
    #\
    #&& rm -rf /var/lib/apt/lists/*

# Téléchargement et installation de PhpStorm
WORKDIR /home/ubuntu

#COPY requirements.txt .
#RUN pip3 install -r requirements.txt

RUN mkdir /home/ubuntu/workspace && mkdir /home/ubuntu/.config && mkdir /home/ubuntu/.local
RUN git config --global --add safe.directory /home/ubuntu/workspace 

COPY --from=pycharm-downloader:latest /root/ /home/ubuntu

# PhpStorm Plugin "Php Inspections (EA Extended)"
#RUN /home/ubuntu/PhpStorm/bin/phpstorm installPlugins de.espend.idea.php.annotation

# Changer de propriétaire pour éviter les problèmes de permission
RUN chown -R ubuntu:ubuntu /home/ubuntu
RUN chown -R ubuntu:ubuntu /home/ubuntu/.*
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#RUN echo "export PATH=\"${PHP_PREFIX}/bin:\$PATH\"" | tee -a /etc/environment
#RUN echo "export PATH=\"${COMPOSER_HOME}:\$PATH\"" | tee -a /etc/environment
RUN echo "source /etc/environment" >> /etc/bash.bashrc

# Commande pour lancer Pycharm
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
