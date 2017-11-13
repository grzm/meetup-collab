## Meetup Collab

Repository for collaboration projects at meetup events.

## About

The code for each collaboration event is in a directory named by date.
For example, the code for the event on 2017-12-13 is in the
`collab-2017-12-13` directory. `current` is a symlink pointing
to the current collaboration activity.

Each collaboration event directory contains subdirectories, one per
collaboration group (e.g., `group1`, `group2`, `group3`), as well as a
`group-template` directory which is (unsurprisingly) the template from
which each per-group directory is copied.

## Usage

While this is intended to be used with a remote collaboration server
(where people at a collab event all log into a remote host), it can also
be used on individual machines. Clone this repo and have at it!

If at an event with a remote host, the event organizers will likely
have event-specific login information. It will typically involve
logging into the remote host and either `cd`'ing into
`meetup-collab/current/groupX` (where `X` is your group) or some other
session-specific environment (such as `tmux`).

## Set up

The [`seed-template`](script/seed-template) script provides a convenient
way to set up a group directories for a collaboration event based on an
existing git repo.

For example, to set up group directories for an event on 2017-12-13
based on Carin Meier's [Alice in Wonderland katas][aiw-katas], run

```bash
script/seed-template -d 2017-12-13 -r https://github.com/gigasquid/wonderland-clojure-katas
```

The `current` symlink will be set to `collab/2017-12-13`.

[aiw-katas]: https://github.com/gigasquid/wonderland-clojure-katas

## Thanks!

Inspired by (*read: blatantly stolen from*) the [Southern New Hampshire
Clojure Meetup Collaboration Repo](https://github.com/snh-clj/collab).
(Thanks, [Aaron](https://github.com/abrooks)!)
