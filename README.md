Cloyne blog
===========

http://cloyne.org/

Development
-----------

For development, you have to install [Docker](https://docs.docker.com/) and
[docker-compose](https://docs.docker.com/compose/install/).

On Mac OS X you can install [Docker for Mac](https://docs.docker.com/docker-for-mac/install/) which comes bundled with docker-compose. Requirements include Yosemite 10.10.3+ or newer. 
* download and open the dmg from [Docker Desktop for Map](https://hub.docker.com/editions/community/docker-ce-desktop-mac?tab=reviews)
* This requires you to make a login with Docker Hub, which somewhat [controversial](https://github.com/docker/docker.github.io/issues/6910)

Or if you use homebrew 
* `brew install docker`

Clone this repository and run `docker-compose up -d` to run it locally. This
will create two Docker containers, one for MySQL database, another for Cloyne
blog. You should see them running through `docker ps`. Wait for around 10
seconds for all internal container processes to start correctly and open IP as
returned by `boot2docker ip`, or open `127.0.0.1` on Linux, in your browser and
you should see Wordpress installation wizard. Initially database is empty and
you have to configure your local version of Cloyne blog. Probably you should
configure it similar to deployed Cloyne blog is so that you can test things.

Script runs Cloyne blog in a way that it maps `plugins` and `themes` directories
directly into the container. This means you can just work directly on them and
just reload in the browser. Once you are satisfied with your changes, you commit
and push to GitHub.

See also: [cloyne/servers](https://www.github.com/cloyne/servers) for how to
update the version on the website.

Plugins
-------

Plugins are stored in `plugins` directory. You can add plugins you want there.
But the best way is that you add plugin through as a [git
submodule](http://git-scm.com/book/en/Git-Tools-Submodules). For example:

```
git submodule add https://github.com/benhuson/wp-mailfrom.git plugins/wp-mailfrom-ii
```

Theme
-----

Most changes you will do by modifying theme. Simply modify necessary PHP or CSS
files and this is it. Have in mind that sometimes it is better to create a
placeholder in the template which can later on be filled through Wordpress web
admin interface instead of hard-coding the code change you want.

WordPress
---------
To upgrade the version of wordpress, see
[cloyne/docker-wordpress](https://www.github.com/cloyne/docker-wordpress)
