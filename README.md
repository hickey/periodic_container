Periodic Container
==================
The Periodic container is based on the Alpine Linux distribution and is used
to execute any number of scripts at a regular interval. Anything that can be
specified in a cron time specification can be managed by the Periodic
container.

Whether the container is executed as a standalone container or as an
orchestrated set of containers, Periodic is able to manage an arbitrary
number of cron jobs.

Adding cron jobs and scripts
----------------------------
All of the scripts and crontab definitions are placed in directories
under `/data`. Crontab definitions need to be placed in `/data/crontabs`
and scripts can reside anywhwere within the `/data` hierarchy where
`/data/scripts` is strongly suggested.

A quick note about providing scripts to be invoked under `crond`. Most
container technologies do not provide a direct mechanism to mount the
scripts into `/data/scripts` as executable files (i.e. they have read
access only). So either the end user must have a mechanism to change the
permissions on the scripts or the scripts must be called from `crond`
with the interpreter for the script on the command line in the crontab
file (i.e. `/bin/sh /data/scripts/run_every_hour.sh`)

As a result of using Alpine Linux, the `crond` process _only_ supports the
crontab convention for specifying files and not the cron.d convention.
Any crontab files placed in `/data/crontabs` need to be named after a
user on the system. All of the normal users are in the password file and
are ready to be used. The most likely prospects would be:

   * root
   * bin
   * daemon
   * adm
   * mail
   * nobody

Twelve Factor Controls
----------------------
As discussed above all crontabs and scripts are mounted in the `/data`
directory for most of the configuration of the container.

In addition the following environmental variables are used to configure
aspects of the container:

   * CRON_LOG_LEVEL: Set the verbosity of the logging output from the
           crond process. Default is set to 6 and the lower the number
           the more verbose the output.

Additional Commands
-------------------
Because [semi](https://github.com/hickey/semi/) is used as an entrypoint
script, there are a few additional commands available through `semi`.
Currently these are:

    * help: Provide an overview of the additional commands supported
            through `semi`.
    * README/readme: Print out this README file to the screen.

