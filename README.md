# docker-crystal

This Dockerfile creates a Heroku compatible docker image that has `crystal`
and `shards` available.  This can be used in your own crystal deployments.

The working directory is `app/user` which is required by Heroku.  Although
it's built to support Heroku, it will work with generic deployments to
Rackspace, AWS or other docker machine compatible deployments.

## Usage

You can build the image using:
`docker build -t {your-docker-repo-name}/crystal-0.18 .`

Then you can push it to your repository:
`docker push {your-docker-repo-name}/crystal-0.18`

An example `Dockerfile` that uses your new image:

```
FROM {your-docker-repo-name}/crystal-0.18

ADD . /app/user
WORKDIR /app/user

RUN shards update

CMD ["crystal", "spec"]
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/kemalyst/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [drujensen](https://github.com/drujensen) drujensen - creator, maintainer
