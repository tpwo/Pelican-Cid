# Cid

Cid is a simple theme for static site generator, [Pelican][pelican]. 

## Features summary:

* Disqus comment. `DISQUS_SITENAME` must be defined in configuration file.
* Analytics support. `ANALYTICS` must be defined in configuration.
* Obfuscated Email. `CONTACT_EMAIL` must be defined in the configuration file. Javascript is required to view the email address.
* Integration with [pelican-neighbors](https://github.com/pelican-plugins/neighbors) plugin.
* Responsive theme.
* Landing Page template.
* Pagination.

## Screenshots

See in the `scrshot/` directory.

## Landing Page Template

Cid includes a landing page template that can be used to generate a landing page for your site.
To use it, simply create a static page that uses the `landing.html` template and configure it
to be the index page of your site.

## Custom links on the landing page and footer

By default, the landing page and site footer will display the list of static pages configured on the site. To replace them
with a list of links you want, specify a `USE_CUSTOM_MENU` configuration variable to be true, and create
`CUSTOM_MENUITEMS` tuple in the `(Title, url)` format within your configuration file to contain the list
of items you want to display. The url are specified relative to the `SITEURL`. Example:

    USE_CUSTOM_MENU = True
    CUSTOM_MENUITEMS = (('Blog', `blog`),
                 ('Contact', 'contact'),
                 ('Projects', 'pages/projects'))

## Custom Site Footer

Define a `SITEFOOTER` in your configuration file to replace the site footer. Will default to
Pelican and theme credit if not defined. The site footer can contains HTMl tags, but it's better to
keep it simple as it will be printed inside a `p` tag.

## Custom page URLs

### Archives

Set `ARCHIVES_URL` in your configuration file to replace URL to archives.
It works well with built-in Pelican `ARCHIVES_SAVE_AS`:

```python
ARCHIVES_URL = 'blog'
ARCHIVES_SAVE_AS = f'{ARCHIVES_URL}/index.html'
```

Default value is `archives`.

### Categories

Set `CATEGORIES_URL` in your configuration file to replace URL to categories.
It works well with built-in Pelican `CATEGORIES_SAVE_AS`:

```python
CATEGORIES_URL = 'category'
CATEGORIES_SAVE_AS = f'{CATEGORIES_URL}/index.html'
```

Default value is `categories`.

### Tags

Set `TAGS_URL` in your configuration file to replace URL to tags.
It works well with built-in Pelican `TAGS_SAVE_AS`:

```python
TAGS_URL = 'tag'
TAGS_SAVE_AS = f'{TAGS_URL}/index.html'
```

Default value is `tags`.

## Obfuscated Email

If `CONTACT_EMAIL` is configured, the theme will display the email address in a `mailto` link, but
the email address will be printed through a Javascript ROT13 function in order to obfuscate the email addres.
This means the email address won't be displayed if the site visitor doesn't have Javascript enabled.

This feature requires a plugin that is included with the theme. The plugin needs to be enabled in order to
use the theme.

```
PLUGIN_PATHS = ['./path/to/themes/pelican-cid/plugins']
PLUGINS = ['cid_filters']
```

## Contacts Links

Additional contact information can be displayed in the same way as the custom menu item/ pages links. To use it,
define a `CONTACTS` tuple in the configuration file.

    CONTACTS = (('facebook', 'https://www.facebook.com/fbAcc'),
                ('twitter', 'https://twitter.com/twttrAcc'),)

# Development Notes

The style sheet for this theme is written in SASS, located in the `src/sass/cid.sass` file,
which are then compiled to `static/css/cid.css`. There is a `package.json` and `gulpfile.json`
that I used during the development of the theme draft, which can be used to quickly set up a
live reload server and auto-compile. Note that the you would still need to have the sass ruby gem
installed.

## Rebuilding CSS with Docker

Run to recompile CSS file after any changes in SASS files.

```
make build
```

# LICENSE

MIT

[pelican]: http://getpelican.com
