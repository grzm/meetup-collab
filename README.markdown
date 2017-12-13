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

The `join-group` helper script can simplify this:

```bash
### log in to remote instance
ssh meetup@meetup.example.com

### after successful login, run join-group with your group number to join
### the corresponding tmux session, creating one if one doesn't already exist.
join-group 1
```

### tmux

Thoughtbot has put together a good ["crash course" in tmux][tmux-crash-course]:

[tmux-crash-course]: https://robots.thoughtbot.com/a-tmux-crash-course

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

## Wrap up

After the collab event has finished, it's nice to be able to share the results
of the project. To push the changes to github, use [ssh forwarding][github-ssh-agent-forwarding] to use your
local keys on the remote instance. So, log into the remote instance

[github-ssh-agent-forwarding]: https://developer.github.com/v3/guides/using-ssh-agent-forwarding/

```bash
ssh -A meetup@meetup.example.com
```
On the remote instance, you can test if your credentials were properly forwarded:

```bash
ssh -T git@github.com
Hi <username>! You've successfully authenticated, but GitHub does not provide shell access.
```

Then, push the changes

```bash
cd meetup-collab
script/push-changes
```

## Thanks!

Inspired by (*read: blatantly stolen from*) the [Southern New Hampshire
Clojure Meetup Collaboration Repo](https://github.com/snh-clj/collab).
(Thanks, [Aaron](https://github.com/abrooks)!)
