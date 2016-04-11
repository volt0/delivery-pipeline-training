## What is countinuous integration?


> Continuous Integration is a software development practice where members of a team integrate their work frequently, 
> usually each person integrates at least daily - leading to multiple integrations per day. 
> Each integration is verified by an automated build (including test) to detect integration errors as quickly as possible. 
> Many teams find that this approach leads to significantly reduced integration problems and allows a team to develop cohesive software more rapidly. 
> This article is a quick overview of Continuous Integration summarizing the technique and its current usage.


PRE/POST coordination concept

### Maintain a code repository

This practice advocates the use of a revision control system for the project's
source code. All artefacts required to build the project should be placed in the
repository. In this practice and in the revision control community, the
convention is that the system should be buildable from a fresh checkout and not
require additional dependencies. Extreme Programming advocate Martin Fowler also
mentions that where branching is supported by tools, its use should be
minimised.[9] Instead, it is preferred for changes to be integrated rather than
for multiple versions of the software to be maintained simultaneously. The
mainline (or trunk) should be the place for the working version of the software.

### Automate the build

A single command should have the capability of building the system. Many build
tools, such as make, have existed for many years. Other more recent tools are
frequently used in continuous integration environments. Automation of the build
should include automating the integration, which often includes deployment into
a production-like environment. In many cases, the build script not only compiles
binaries, but also generates documentation, website pages, statistics and
distribution media (such as Debian DEB, Red Hat RPM or Windows MSI files).


### Make the build self-testing[edit]

Once the code is built, all tests should run to confirm that it behaves as the
developers expect it to behave.

### Everyone commits to the baseline every day

By committing regularly, every committer can reduce the number of conflicting
changes. Checking in a week's worth of work runs the risk of conflicting with
other features and can be very difficult to resolve. Early, small conflicts in
an area of the system cause team members to communicate about the change they
are making. Committing all changes at least once a day (once per feature built)
is generally considered part of the definition of Continuous Integration. In
addition performing a nightly build is generally recommended.[citation needed]
These are lower bounds; the typical frequency is expected to be much higher.

### Every commit (to baseline) should be built

The system should build commits to the current working version to verify that
they integrate correctly. A common practice is to use Automated Continuous
Integration, although this may be done manually. For many[who?], continuous
integration is synonymous with using Automated Continuous Integration where a
continuous integration server or daemon monitors the revision control system for
changes, then automatically runs the build process.

### Keep the build fast

The build needs to complete rapidly, so that if there is a problem with
integration, it is quickly identified.

### Test in a clone of the production environment

Having a test environment can lead to failures in tested systems when they
deploy in the production environment because the production environment may
differ from the test environment in a significant way. However, building a
replica of a production environment is cost prohibitive. Instead, the test
environment, or a separate pre-production environment ("staging") should be
built to be a scalable version of the actual production environment to both
alleviate costs while maintaining technology stack composition and nuances.
Within these test environments, service virtualization is commonly used to
obtain on-demand access to dependencies (e.g., APIs, third-party applications,
services, mainframes, etc.) that are beyond the team's control, still evolving,
or too complex to configure in a virtual test lab.


### Make it easy to get the latest deliverables

Making builds readily available to stakeholders and testers can reduce the
amount of rework necessary when rebuilding a feature that doesn't meet
requirements. Additionally, early testing reduces the chances that defects
survive until deployment. Finding errors earlier also, in some cases, reduces
the amount of work necessary to resolve them. All programmers should start the
day by updating the project from the repository. That way, they will all stay up
to date.

### Everyone can see the results of the latest build

It should be easy to find out whether the build breaks and, if so, who made the
relevant change.

### Automate deployment

Most CI systems allow the running of scripts after a build finishes. In most
situations, it is possible to write a script to deploy the application to a live
test server that everyone can look at. A further advance in this way of thinking
is continuous deployment, which calls for the software to be deployed directly
into production, often with additional automation to prevent defects or
regressions.


## More

Problem:

* Refactoring
* Incremental Design
* Работа над одной кодовой базой
* Болезненные merge
* Опасность сломать работающий функционал 

Solution:

* VCS as communication point (github)
* README driven (lean)
* standups
* chat (slack, hipchat)
* branching (only trunk vs feature branches)
* pre/post coordination (Coder Review vs Pair Programming)


Built-in Quality

* autotests 
  * built in quality (andon)
  * pyramid and where to start (DHH hangouts)
* green line (andon) - stop the line, if waste
* Visual Management
