FROM codenvy/angular-yeoman

RUN sudo npm install --global elm@1.5.1

ENV ELM_HOME /usr/local/lib/node_modules/elm/share
# RUN echo "export ELM_HOME=$ELM_HOME" >> ~/.bashrc

EXPOSE 3000
ENV CODENVY_APP_PORT_80_HTTP 3000

ENV CODENVY_APP_BIND_DIR $HOME/application

CMD elm-package install -y && elm-make && elm-reactor --port=3000

