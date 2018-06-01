FROM sunside/simple-nuget-server:0.5


ENV APP_BASE /var/www
ENV APP_BRANCH master
ENV DEBIAN_VERSION jessie
ENV HHVM_VERSION 3.18.1~$DEBIAN_VERSION

# Install the supervisor configuration
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY scripts/*.sh /tmp/
RUN chmod +x /tmp/*.sh

# The base URL
ENV BASE_URL /

# Define the volumes
VOLUME ["$APP_BASE/db", "$APP_BASE/packagefiles"]

# Fire in the hole!
CMD ["supervisord", "-n"]
