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

### Install and configure `cowboy`.

Before we can add `nitrogen` to the project we need a running `cowboy` webserver.
Thankfully this is fairly straightforward.

We're going to need a directory to serve static files so we'll only setup that one route.
If we were using a front-end webserver, such as `nginx`, then we wouldn't necessarily need this route.

Remember to tell your application to start `cowboy` during its startup.

### Install and configure `nitrogen`.

With `cowboy` running we can install `nitrogen_core` directly. 
We'll need to connect it using the `cowboy_simple_bridge_anchor` module as well as provide our own main handler.
For this stage we'll create our main index page, but leave it's content static.
In the next step we'll configure full interactivity to provide dynamic content.

The main handler needs to export `run/0`, where we can inject our custom [nitrogen handlers].
It can also export `ws_init/0` for setting up special behaviors for `WebSocket` connections.
While I typically like to provide my own routing and security handler we can rely on the defaults.

To tell `nitrogen` to use this we need to have `simple_bridge` use this handler.
In practice I place this in a config file, but for demonstration simplicity we'll set this manually before starting `cowboy`.
Although the module's name should end in `_main_handler` we'll only add the first part to the config.

```erlang
application:set_env(simple_bridge, handler, nitrogen).
```

Our index page (`index.erl`) is can return a simple static string.
We can also use any of the pre-defined HTML tags or widgets, but hat we can't use at this stage are postbacks, continuations, or comets.
These interactive elements depend on the JavaScript, CSS, and templates we'll setup next.

In the released version of `nitrogen` (as of the time of this writing) we have to remember to have our application not only start `nitrogen_core`, but also (and prior to `nitrogen_core`) we have to start `nitro_cache`.
In the upcoming major `nitrogen` release this additional `nitro_cache` step isn't necesssary.
In both versions we also need to start `nprocreg` which `nitrogen` uses for name registration.

[nitrogen]: https://github.com/nitrogen/nitrogen_core
[cowboy]: https://github.com/ninenines/cowboy/
[nitrogen handlers]: https://nitrogenproject.com/doc/handlers#the-handlers
