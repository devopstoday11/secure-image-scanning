FROM python:3-alpine

LABEL maintainer="Néstor Salceda <nestor.salceda@sysdig.com>"

RUN apk update
RUN apk add --no-cache bash jq
RUN pip install anchorecli

COPY ./docker-entrypoint.sh /

ENV IMAGE_TO_SCAN ""
ENV ANCHORE_CLI_PASS ""
ENV ANCHORE_CLI_URL "https://secure.sysdig.com/api/scanning/v1/anchore"
ENV MAX_RETRIES "3"
ENV ANCHORE_CLI_SSL_VERIFY "n"

ENTRYPOINT ["/docker-entrypoint.sh"]
