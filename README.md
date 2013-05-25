Multi-PHP
=========

Run multiple versions of PHP on the same Apache instance on Slackware.

A couple of SlackBuild scripts to run multiple versions of PHP on the same
Apache instance on Slackware.  Currently only PHP 5.3 is supported.


Build and install
========
Same procedure as using a regular SlackBuild, except for the following:
*   It needs a full copy of the alpine source-dir from Slackware 13.37 (!!)
    to exist in the parent dir from where you're building (i.e. ../), just
    like when building regular PHP from Slackware.  This is required for the
    IMAP support and the build *will* fail without it.
*   The appropriate PHP source needs to be downloaded separately, a
    fetch-php.sh script is supplied for your convenience.


Usage
=====
*   Build and install the php53 package
*   Enable support for PHP 5.3 on your Apache server by including the
    /etc/httpd/extra/cgi-php53.conf file from your httpd.conf like so:

    ```apache
    # Uncomment the following line to enable PHP 5.3 CGI:
    #
    Include /etc/httpd/extra/cgi-php53.conf
    ```
    Note that this will only provide the 'php53-script' handler itself, to
    be used wherever needed.  Any PHP file on your server will still be
    served as before, PHP 5.3 is only used if explicitly enabled.
    See the cgi-php53.conf file for more information.
*   Use PHP 5.3 for each file or directory where it's wanted.
    To use PHP 5.3 for all files a given dir (and all it's subdirs) with an
    extension of '.php', add the following (either to the .htaccess file or
    the appropriate section in httpd.conf itself):

    ```apache
    # NOTE: this requires mod_mime
    AddHandler php53-script .php
    ```
    To revert that behavior on some specific files inside that dir to
    Apache's default PHP handler (i.e. ignore the above for the given
    file(s)), also add:

    ```apache
    # Specifically exempt filename.php, use regular mod_php for it
    <Files "filename.php">
        RemoveHandler .php
    </Files>
    ```
    There are some other methods for using the php53-script handler, see
    the Apache documentation on handlers for more information.  It should
    work wherever a handler can be used, if not, please report.
