FROM heroku/cedar

ENV VERSION 0.20.0

RUN mkdir -p /app/user

RUN apt-get update && apt-get install -y --no-install-recommends sqlite3 libsqlite3-dev

RUN curl -L https://github.com/crystal-lang/crystal/releases/download/$VERSION/crystal-$VERSION-1-linux-x86_64.tar.gz | tar xvz -C /app/.

RUN curl -Lo /app/crystal-$VERSION-1/bin/shards.gz https://github.com/crystal-lang/shards/releases/download/v0.6.3/shards-0.6.3_linux_x86_64.gz

RUN cd /app/crystal-$VERSION-1/bin && gunzip shards.gz && chmod 755 shards

ENV PATH /app/crystal-$VERSION-1/bin:$PATH

ADD . /app/user
WORKDIR /app/user
