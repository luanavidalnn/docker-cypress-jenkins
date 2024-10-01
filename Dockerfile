FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
  libgtk2.0-0 \
  libgtk-3-0 \
  libgbm-dev \
  libnotify-dev \
  libnss3 \
  libxss1 \
  libasound2 \
  libxtst6 \
  xauth \
  xvfb \
  libxrandr2 \
  libglib2.0-0 \
  libgbm1 \
  libatk1.0-0 \
  libatk-bridge2.0-0 \
  libcups2 \
  libdrm2 && \
  apt-get install -f

RUN mkdir -p /var/jenkins_home/.ssh && \
    ssh-keyscan -t rsa github.com >> /var/jenkins_home/.ssh/known_hosts && \
    chown -R jenkins:jenkins /var/jenkins_home && \
    chmod -R 775 /var/jenkins_home

RUN chown -R jenkins:jenkins /var/jenkins_home/workspace/*/.git || true

USER jenkins

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]