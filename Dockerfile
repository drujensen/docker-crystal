FROM heroku/cedar

ENV CRYSTAL_VERSION 0.21.1

RUN mkdir -p /app/user

RUN apt-get update -qq

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -

RUN apt-get install -y --no-install-recommends sqlite3 libsqlite3-dev libpq-dev libmysqlclient-dev nodejs

RUN npm install -g wait-on

RUN cd /tmp && curl -L https://github.com/crystal-lang/crystal/releases/download/$CRYSTAL_VERSION/crystal-$CRYSTAL_VERSION-1-linux-x86_64.tar.gz | tar xvz && cp crystal-$CRYSTAL_VERSION-1/bin/crystal /usr/local/bin/.

ADD . /app/user
WORKDIR /app/user
