FROM jvoigtlaender/elm:0.15

RUN useradd --uid 5001 --create-home user
USER user
ENV HOME /home/user

EXPOSE 3000
ENV CODENVY_APP_PORT_80_HTTP 3000

RUN mkdir ~/application
ENV CODENVY_APP_BIND_DIR $HOME/application

WORKDIR $HOME/application

CMD elm-package install --yes && elm-make && elm-reactor --port=3000

