Cloyne blog
===========

http://cloyne.org/

Development
-----------

For development, you have to install [Docker](https://docs.docker.com/) and
[docker-compose](https://docs.docker.com/compose/install/).

On Mac OS X you can install [Docker for Mac](https://docs.docker.com/docker-for-mac/install/) which comes bundled with docker-compose. Requirements include Yosemite 10.10.3+ or newer.
* Download and open the dmg from [Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac?tab=reviews)
* This requires you to make a login with Docker Hub, which somewhat [controversial](https://github.com/docker/docker.github.io/issues/6910)

Or if you use homebrew
* `brew install docker`

If you're on MAC OS X or Linux, you have to add yourself to the docker group in order to run docker commands without root privileges. Running docker commands with root privileges will cause hard-to-debug errors to crop up. To add yourself to the docker group, run `sudo usermod -aG docker <YOUR USERNAME>`.

Clone this repository and run `docker-compose up -d` to run it locally. (If you encounter a TLS Handshake timeout, try running `docker logout` as disccused in this [issue](https://github.com/docker/kitematic/issues/1125)). This will create two Docker containers, one for MySQL database, another for Cloyne
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

### How to Update WP Plugins
Navigate to this repository (docker-blog) in your terminal. Then, run the following commands:

* `git submodule update --init --recursive`
* `git submodule update --remote`

In the `plugins` folder, you will find a folder for each WordPress plugin. Inside each one, will be a php file named after the plugin. For example, for the Redirection plugin, you can find the following file: `plugins/redirection/redirection.php`.

In the top few lines of this file, you should be able to find the plugin version number. Verify that it has increased to the desired version. When you are satisfied, [commit](https://git-scm.com/docs/git-commit) the changes.

Theme
-----

Most changes you will do by modifying theme. Simply modify necessary PHP or CSS
files and this is it. Have in mind that sometimes it is better to create a
placeholder in the template which can later on be filled through Wordpress web
admin interface instead of hard-coding the code change you want.

To upgrade the theme, start by upgrading
[cloyne/wordpress](https://github.com/cloyne/docker-wordpress). This will update
the [twentythirteen theme](https://github.com/WordPress/WordPress/tree/131440c1a5f0e1e2273f7c2fff2533b94c77c30d/wp-content/themes/twentythirteen).
We want to apply all the updates from that to
[themes/cloyne](https://github.com/cloyne/docker-blog/themes/cloyne) in this
repository.
One way to do this is to simply copy the twentythirteen folder over the cloyne
folder:

    cp PATH_TO_DOCKER-WORDPRESS/docker-wordpress/wordpress/wp-content/themes/twentythirteen/* themes/cloyne -Rf

and then go through with `git add -p` to skim the changes and add the ones in
files Cloyne hasn't changed. The files with Cloyne-specific changes are
`footer.php`, `functions.php`, `header.php`, and `style.css`.

WordPress
---------
To upgrade the version of wordpress, see
[cloyne/docker-wordpress](https://www.github.com/cloyne/docker-wordpress)

Trouble-Shooting
----------------
If you click the first page and forget the password go back to the terminal and close the processes by typing docker-compose down. Then type git reset --hard to reset the directories and try the process again. Note: this resets everything in the local working copy.
