basic_nitrogen_cowboy
=====

This repository contains a minimal installation of the [nitrogen] web framework running on the [cowboy] web server.
The purpose in creating this is to catalog the steps for adding `nitrogen` to an existing `cowboy` server and to do so without relying on the setup sripts provided by `nitrogen`.

Why? If scripts scare you then you should be able to use this repository as an example of the minimum amount of work required to integrate these two libraries.


## Setup Process

### Start with a `rebar3` project.

This repository was initialized with the following `rebar3` incantation.

```bash
rebar3 new app basic_nitrogen_cowboy
```

This creates the application structure and the default README and configurations. The first step is adding the names of the project where appropriate and checking in the "starting commit" from which we'll add everything in sequence.


[nitrogen]: https://github.com/nitrogen/nitrogen_core
[cowboy]: https://github.com/ninenines/cowboy/