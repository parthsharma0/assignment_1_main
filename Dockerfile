# FROM jenkins/jenkins:2.462.2-jdk17
# USER root
# RUN apt-get update && apt-get install -y lsb-release
# RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
#   https://download.docker.com/linux/debian/gpg
# RUN echo "deb [arch=$(dpkg --print-architecture) \
#   signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
#   https://download.docker.com/linux/debian \
#   $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
# RUN apt-get update && apt-get install -y docker-ce-cli
# USER jenkins
# RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
# RUN apt-get update && apt-get install -y python3 python3-pip

FROM jenkins/jenkins:2.462.2-jdk17

USER root

# Install dependencies for Docker and Jenkins
RUN apt-get update && apt-get install -y lsb-release curl gnupg2 \
    && curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update && apt-get install -y docker-ce-cli \
    git python3 python3-pip python3-venv \
    && apt-get clean

# Allow Jenkins user to use Docker without sudo
RUN usermod -aG docker jenkins

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"

# Switch back to the Jenkins user
USER jenkins

# Set python3 and pip as default
RUN ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip

# Add environment variables to ensure proper Python environment
ENV PATH="/usr/local/bin:${PATH}"



