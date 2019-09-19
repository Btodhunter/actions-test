# FROM anchore/inline-scan:v0.5.0

# USER root:root
FROM docker:stable

RUN apk add curl bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]