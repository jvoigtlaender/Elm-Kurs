FROM debian:latest

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends curl git ca-certificates && \
    # apt-get clean --yes && \
    mkdir /nodejs && \
    curl http://nodejs.org/dist/v0.10.38/node-v0.10.38-linux-x64.tar.gz | tar xzf - --strip-components=1 --directory /nodejs && \
    /nodejs/bin/npm install --global elm@1.5.1

ENV PATH /nodejs/bin:$PATH
ENV ELM_HOME /nodejs/lib/node_modules/elm/share

