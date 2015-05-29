FROM codenvy/angular-yeoman

RUN npm install elm@1.5.1

ENV PATH /home/user/application/node_modules/elm/bin/:$PATH
RUN echo "export PATH=$PATH" >> /home/user/.bashrc

ENV ELM_HOME /home/user/application/node_modules/elm/share
RUN echo "export ELM_HOME=$ELM_HOME" >> /home/user/.bashrc

VOLUME ["/home/user/app"]

EXPOSE 3000
ENV CODENVY_APP_PORT_80_HTTP 3000

ENV CODENVY_APP_BIND_DIR /home/user/app/

CMD cd /home/user/app && elm-package install -y && elm-make && elm-reactor --port=3000
