
App Engine Ruby Cupcake
=======================

A minimal instalation of JRuby and JRuby-Rack for the Google App Engine.

Why?
----

Because I tried to set one JRuby sample up on App Engine and found it a little tough.

For instance, there's a well-known incompatibility between the Ruby libraries for the
App Engine and the more recent versions of JRuby-Rack.

I spent a few days getting to know all of the technologies better and spotted a bug
when trying to use the most recent version of JRuby-Rack when I tried to avoid using
some of the Java classes of the Ruby libraries for the App Engine.

I've also seen many other folks having issues getting started with it because of said
incompatibilies. Even the more recent JRuby-Jars files (1.6x series) seem to have
gotten in the way.

Laundry List
------------

While trying to use the Ruby libraries for the App Engine I learned that they worked
better with Ruby 1.8.7 when getting things like the older version of the Bundler
(bundler08-0.8.4) working.

After I got those versions sorted I could issue commands like appcfg.rb and
dev_appserver.rb.

The App Engine Ruby libraries developers found it better to lock the versions of
JRuby-Rack (1.0.4) and JRuby-Jars (1.5.6) to the versions that worked.

Like many others I had a hard time getting it all in my head. Not really used to the
Bundler tool, even! :-)

Getting Better At It
--------------------

Getting App Engine errors was no fun. To me it was like a blackbox. It was a little
maddening when it worked locally during development/testing and when I uploaded it
it stopped working with no meaningful feedback.

I had a break-through when I could see the logs from the Dashboard:
https://appengine.google.com/

I was able to cut some dependency on a few Java classes of the App Engine Ruby
libraries, namely those 5 classes created with a Mirah file. It was only a matter
of replacing the Servlet Event Listener with the one provided by JRuby-Rack.

Tips
----

Depending on the version of the JRuby-Rack or App Engine Ruby libraries you 
may need to place the config.ru file accordingly, either to /WEB-INF/config.ru or
to its parent directory /config.ru

Using the Java Ant tool can be handy at the build.xml directory, like so:

    ant runserver

    ant update

Those are shorter versions to these commands:

    /long/path/to/appengine-java-sdk-1.5.5/bin/dev_appserver.sh www

    /long/path/to/appengine-java-sdk-1.5.5/bin/appcfg.sh update www

Edit the WEB-INF/appengine-web.xml file and add your application id.

Edit the build.xml file and update the location to the "appengine.sdk", like so:

    /long/path/to/appengine-java-sdk-1.5.5

For now, only JRuby-Jars-1.5.6 work. There's an issue with the latest
JRuby-Jars-1.6.5 versions. To keep it simple I'll just include the files myself, in
the WEB-INF/lib directory.

Related Projects
----------------

JRuby-Rack - https://github.com/jruby/jruby-rack

App Engine Ruby libraries - http://code.google.com/p/appengine-jruby/

Thanks
------

Thanks to all the wonderful folks who have worked on these open source projects.

Enjoy!



