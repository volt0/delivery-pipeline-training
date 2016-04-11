## Failover

If something paintful, do it often


### SnowflakeServers

It can be finicky business to keep a production server running. You have to
ensure the operating system and any other dependent software is properly patched
to keep it up to date. Hosted applications need to be upgraded regularly.
Configuration changes are regularly needed to tweak the environment so that it
runs efficiently and communicates properly with other systems. This requires
some mix of command-line invocations, jumping between GUI screens, and editing
text files.

The result is a unique snowflake - good for a ski resort, bad for a data center.

The first problem with a snowflake server is that it's difficult to reproduce.
Should your hardware start having problems, this means that it's difficult to
fire up another server to support the same functions. If you need to run a
cluster, you get difficulties keeping all of the instances of the cluster in
sync. You can't easily mirror your production environment for testing. When you
get production faults, you can't investigate them by reproducing the transaction
execution in a development environment.

[SnowflakeServers](http://martinfowler.com/bliki/SnowflakeServer.html)


### Phenix Server 

One day I had this fantasy of starting a certification service for operations.
The certification assessment would consist of a colleague and I turning up at
the corporate data center and setting about critical production servers with a
baseball bat, a chainsaw, and a water pistol. The assessment would be based on
how long it would take for the operations team to get all the applications up
and running again

The primary advantage of using phoenix servers is to avoid configuration drift:
ad hoc changes to a systems configuration that go unrecorded. Drift is the name
of a street that leads to SnowflakeServers, and you don't want to go there
without a big plough.


* http://martinfowler.com/bliki/PhoenixServer.html
* http://techblog.netflix.com/2011/07/netflix-simian-army.html


### House Monkey

Simian Army consists of services (Monkeys) in the cloud for generating various
kinds of failures, detecting abnormal conditions, and testing our ability to
survive them. The goal is to keep our cloud safe, secure, and highly available.
More details can be found at this blog.

Currently the simians include Chaos Monkey, Janitor Monkey, and Conformity Monkey.

Refer to the Quick start guide to get started setting up and using the Monkeys.

* http://techblog.netflix.com/2011/07/netflix-simian-army.html
