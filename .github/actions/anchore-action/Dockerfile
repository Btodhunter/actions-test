FROM anchore/inline-scan:v0.5.0

USER root:root

RUN groupadd -g 115 docker; \
    usermod -aG docker anchore

COPY entrypoint.sh /entrypoint.sh

# USER anchore:anchore

ENTRYPOINT ["/entrypoint.sh"]