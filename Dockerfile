FROM heroku/cedar

ENV CRYSTAL_VERSION 0.21.1

RUN mkdir -p /app/user

RUN apt-get update && apt-get install -y --no-install-recommends sqlite3 libsqlite3-dev

RUN curl -L https://github.com/crystal-lang/crystal/releases/download/$CRYSTAL_VERSION/crystal-$CRYSTAL_VERSION-1-linux-x86_64.tar.gz | tar xvz -C /app/.

ENV PATH /app/crystal-$CRYSTAL_VERSION-1/bin:$PATH

ADD . /app/user
WORKDIR /app/user
