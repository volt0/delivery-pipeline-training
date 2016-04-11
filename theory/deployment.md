## Deploy Strategies

Deploy stragegies compatible with CD

### Blue/Green Deployment

Blue-green deployment is a release technique that reduces downtime and risk by
running two identical production environments called Blue and Green.

At any time, only one of the environments is live, with the live environment
serving all production traffic. For this example, Blue is currently live and
Green is idle.

* http://martinfowler.com/bliki/BlueGreenDeployment.html
* https://medium.com/aws-activate-startup-blog/upgrades-without-tears-part-1-introduction-to-blue-green-deployment-on-aws-e5bcf90eb60b#.5l0jjzvdi

??? Database


## Canary Releases

Canary release is a technique to reduce the risk of introducing a new software
version in production by slowly rolling out the change to a small subset of
users before rolling it out to the entire infrastructure and making it available
to everybody.

* http://martinfowler.com/bliki/CanaryRelease.html


## Feature Toggling


The basic idea is to have a configuration file that defines a bunch of toggles
for various features you have pending. The running application then uses these
toggles in order to decide whether or not to show the new feature.

* http://martinfowler.com/bliki/FeatureToggle.html
* http://martinfowler.com/articles/feature-toggles.html

