FROM        node:12.18-alpine3.11
# release version passed in on build, just default it temporarily
ARG         RELEASE_VERSION=0.0.1
WORKDIR     /workdir
COPY        . org-formation-cli
RUN         cd org-formation-cli && npm install && npm run build
RUN         npm install -g --production ./org-formation-cli
ENV         AWS_PROFILE=default
ENTRYPOINT  [ "org-formation" ]
