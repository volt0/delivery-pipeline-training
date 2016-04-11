## What is Continuous Delivery

Paradox:

High performance teams consistently deliver services faster and more 
reliably than their low performing competition.

> Continuous delivery (CD) is a software engineering approach in which teams produce software in short cycles,
> ensuring that the software can be reliably released at any time. It aims at building,
> testing, and releasing software faster and more frequently. The approach helps reduce the cost,
> time, and risk of delivering changes by allowing for more incremental updates to applications in production.
> A straightforward and repeatable deployment process is important for continuous delivery.


> Continuous Delivery is the ability to get changes of all types—including new features, 
> configuration changes, bug fixes and experiments—into production, 
> or into the hands of users, safely and quickly in a sustainable way.


> Continuous Delivery is a software development discipline where you build software in such a way 
> that the software can be released to production at any time.

You’re doing continuous delivery when:

* Your software is deployable throughout its lifecycle
* Your team prioritizes keeping the software deployable over working on new features
* Anybody can get fast, automated feedback on the production readiness of their systems any time somebody makes a change to them
* You can perform push-button deployments of any version of the software to any environment on demand

To achieve continuous delivery you need:

* a close, collaborative working relationship between everyone involved 
  in delivery (often referred to as a DevOps Culture)
* extensive automation of all possible parts of the delivery process, 
  usually using a DeploymentPipeline
  
The principal benefits of continuous delivery are:


* **Reduced Deployment Risk:** since you are deploying smaller changes, 
  there's less to go wrong and it's easier to fix should a problem appear.

* **Believable Progress:** many folks track progress by tracking work done. 
  If "done" means "developers declare it to be done" that's much less believable than if it's deployed into a production (or production-like) environment.

* **User Feedback:** the biggest risk to any software effort is that you end up building something that isn't useful. The earlier and more frequently you get working software in front of real users, 
  the quicker you get feedback to find out how valuable it really is (particularly if you use ObservedRequirements).
  
## Principles

* **repeatable & reliable** The process for releasing/deploying software MUST be repeatable and reliable. This leads onto the 2nd principle…
* **Automate everything!** A manual deployment can never be described as repeatable and reliable (not if I’m doing it anyway!). You have to invest seriously in automating all the tasks you do repeatedly, and this tends to lead to reliability.
* **If somethings difficult or painful, do it more often**. On the surface this sounds silly, but basically what this means is that doing something painful, more often, will lead you to improve it, probably automate it, and this will eventually make it painless and easy. Take for example doing a deployment of a database schema. If this is tricky, you tend to not do it very often, you put it off, maybe you’ll do 1 a month. Really what you should do is improve the process of doing the schema deployments, get good at it, and do it more often, like 1 a day if needed. If you’re doing something every day, you’re going to be a lot better at it than if you only do it once a month.
* **Keep everything in source control** – this sounds like a bit of a weird one in this day and age, I mean seriously, who doesn’t keep everything in source control? Apparently quite a few people. Who knew?
* **Done means “released”**. This implies ownership of a project right up until it’s in the hands of the user, and working properly. There’s none of this “I’ve checked in my code so it’s done as far as I’m concerned”. I have been fortunate enough to work with some software teams who eagerly made sure their code changes were working right up to the point when their changes were in production, and then monitored the live system to make sure their changes were successful. On the other hand I’ve worked with teams who though their responsibility ended when they checked their code in to the VCS.
* **Build quality in! (LEAN)** Take the time to invest in your quality metrics. A project with good, targeted quality metrics (we could be talking about unit test coverage, code styling, rules violations, complexity measurements – or preferably, all of the above) will invariably be better than one without, and easier to maintain in the long run.
* **Everybody has responsibility for the release process**. A program running on a developers laptop isn’t going to make any money for the company. Similarly, a project with no plan for deployment will never get released, and again make no money. Companies make money by getting their products released to customers, therefore, this process should be in the interest of everybody. Developers should develop projects with a mind for how to deploy them. Project managers should plan projects with attention to deployment. Testers should test for deployment defects with as much care and attention as they do for code defects (and this should be automated and built into the deployment task itself).
* **Improve continuously (LEAN)** Don’t sit back and wait for your system to become out of date or impossible to maintain. Continuous improvement means your system will always be evolving and therefore easier to change when needs be.
  

## Delivery pipeline

Continuous delivery is enabled through the deployment pipeline. 
The purpose of the deployment pipeline has three components: Visibility, Feedback, and Continually Deploy.[9]


* **Visibility** – All aspects of the delivery system including building, deploying, testing, and releasing are visible to every member of the team to promote collaboration.
* **Feedback** – Team members learn of problems ASAP when they occur so that they are able to fix them as quickly as possible.
* **Continually Deploy** – Through a fully automated process, you can deploy and release any version of the software to any environment.


One of the challenges of an automated build and test environment is you want your build to be fast, 
so that you can get fast feedback, but comprehensive tests take a long time to run. 
A deployment pipeline is a way to deal with this by breaking up your build into stages. 
Each stage provides increasing confidence, usually at the cost of extra time. 
Early stages can find most problems yielding faster feedback, while later stages provide slower and more through probing. 
Deployment pipelines are a central part of ContinuousDelivery.

Usually the first stage of a deployment pipeline will do any compilation and provide binaries for later stages. 
Later stages may include manual checks, such as any tests that can't be automated. 
Stages can be automatic, or require human authorization to proceed, they may be parallelized over 
many machines to speed up the build. Deploying into production is usually the final stage in a pipeline.

More broadly the deployment pipeline's job is to detect any changes that will lead to problems in production. 
These can include performance, security, or usability issues. 
A deployment pipeline should enable collaboration between the various groups involved in delivering software 
and provide everyone visibility about the flow of changes in the system, together with a thorough audit trail.

A good way to introduce continuous delivery is to model your current delivery process as a deployment pipeline, 
then examine this for bottlenecks, opportunities for automation, and collaboration points


## Story 

In the late 90's I paid a visit to Kent Beck, then working in Switzerland for an insurance company. 
He showed me around his project and one of the interesting aspects of his highly disciplined team was the 
fact that they deployed their software into production every night. 
This regular deployment gave them many advantages: written software wasn't waiting uselessly before it was used, 
they could respond quickly to problems and opportunities, 
and the rapid turn-around led to a much deeper relationship between them, their business customer, and their final customers.

(http://martinfowler.com/books/continuousDelivery.html)


## Links

* https://en.wikipedia.org/wiki/Continuous_delivery
* http://continuousdelivery.com/
* http://martinfowler.com/bliki/ContinuousDelivery.html
* http://www.infoq.com/interviews/CD-JezHumble
* https://yow.eventer.com/events/1004/talks/1062
* https://www.youtube.com/watch?v=aoMfbgF2D_4
* https://www.youtube.com/watch?v=_I94-tJlovg&nohtml5=False

