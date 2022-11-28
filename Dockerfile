FROM alpine/terragrunt:1.0.6

# add common tools
RUN apk --update add \
    bash \
    curl \
    jq

# prepare python environment
RUN apk add python3 py-pip
ENV PYTHONDONTWRITEBYTECODE=1

# purge apk cache
RUN rm /var/cache/apk/*

WORKDIR /opt/fb

# aws cli
RUN pip install --no-cache --upgrade awscli
RUN pip install boto3

# unset ENTRYPOINT from parent
ENTRYPOINT []
CMD ["/bin/bash"]
