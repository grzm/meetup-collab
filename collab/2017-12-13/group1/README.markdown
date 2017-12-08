# Halite 2 Clojure bot

From the [Halite site](https://halite.io/):

> Halite is an open source artificial intelligence programming
> challenge, created by Two Sigma, where players build bots using the
> coding language of their choice to battle on a two-dimensional virtual
> board.

Use this project to create a Halite bot written in Clojure.

## Getting started

### Get an account

To submit your bots, you need a Halite account. If you don't already have one,
[create one](https://halite.io/).

### Install your API key

The hlt client allows you to use an API key to submit your bot from
the command line. Create an API key via your [profile
settings](https://halite.io/user/settings).

Install the API key for your project. First, set the appropriate
environment variables.

```bash
> source config.env
```

Then, install the API key using the `hlt` client tool. **If you did not source
the `config.env` file, your API key will be placed in the user-root rather than
your collab group directory. So go do that if you haven't already** You'll be
prompted to enter the API key you generated:

```bash
> hlt auth
Please go to http://halite.io/user/settings to obtain an api_key, and paste here:
```

### Confirm everything works

You should now be able to build and upload your bot. Smoke test it to
confirm everything is working as expected.

```bash
# build and run (battling two instances of your bot against each other)
> script/run_game.sh

# package and upload
> script/package && script/upload
```

You can safely ignore warnings regarding missing `hlt/` library
folders. You should see `Successfully uploaded bot with version 1`
once the upload is complete.

## Hack, hack, hack away!

You can find the source files in the `src/` directory. When you're
ready to submit a new version, package and upload.

## Notes

This project is based on the [Halite 2 Clojure starter kit][clj-starter-kit].

[clj-starter-kit]: https://github.com/HaliteChallenge/Halite-II/tree/master/airesources/Clojure

The helper scripts use a modified version of the `hlt_client` Python
library which allows the Halite API authorization key to be stored in
an arbitrary directory via the `HALITE_CONFIG_DIR` environment
variable. The script in `script/init` downloads and installs this
modified `hlt_client` and the `halite` environment binary suitable for
64-bit Linux machines.
