# Scuole Parrocchiali Desio: sito web

[![Netlify Status](https://api.netlify.com/api/v1/badges/95c1c049-f895-4c8c-8c46-50d40b26d82c/deploy-status)](https://app.netlify.com/sites/scuoleparrocchialidesio-www/deploys)

- [Netlify](https://scuoleparrocchialidesio.netlify.com)
- Style guide:
  - [web site](https://style-guide-site.netlify.com)
  - [repository](https://github.com/scuoleparrocchialidesio/style-guide)

## Setup

```shell
$ bundle install
$ bundle exec middleman serve
```

Copy `.env.sample` in `.env`:

```shell
$ cp .env.sample .env
```

And make sure to fill the field `DATO_API_TOKEN` with the proper value from

https://scuoleparrocchialidesio.admin.datocms.com/admin/access_tokens

It is required a read-only API token.

Open http://localhost:4567

## Deploy

Every commit to master will be deployed automatically.

## LICENSE

Developed by [olistik](https://olisti.co) and [Edivad](https://github.com/EnigmaEdivad) under the GNU Affero GPLv3 license.

See [LICENSE](https://github.com/scuoleparrocchialidesio/www/blob/master/LICENSE).
