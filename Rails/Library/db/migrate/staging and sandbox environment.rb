Staging environment vs Sandbox environment:
Staging environment:
A good staging environment will be a close replica (less the data) of the production system. It is used to test upgrades and patches prior to going to production. This means that it should be a controlled environment.
Access restrictions in a staging environment should be as close to production as possible. I.E. deployment by those engineers who are responsible for deployment. No root (or privileged access for developers).

Sandbox environment:
A sandbox is an isolated testing environment that enables users to run programs or open files without affecting the application, system or platform on which they run. Software developers use sandboxes to test new programming code. 
As the name suggests this typically a playground for the engineering team. It has less restrictions than a staging environment because it is designed to allow the engineers to try out things easily and quickly. Access to a sandbox environment typically allows privileged access to any engineer (developer, QA etc.) who are working on the project for easy / quick deployment and debugging.A sandbox environment is likely to drift away from the production environment as engineers try out different versions of the product, dependancies, plugins etc.
If you want to perform some data migration/modification on production and you want to be sure that it will not break anything you can always perform a test run using rails console with --sandbox flag.


staging: 
  <<: *default
  database: library_staging

sandbox:
  <<: *default
  database: library_sandbox


