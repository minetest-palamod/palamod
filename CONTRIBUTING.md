# Contributing

External Work
---------------

This modpack is mostly a personal project for now.
Howether, I will accept:
- bug fixes
- translation
- small fixes (like color adjustement)
- better textures (not copied from the original palamod!)

Security
---------------

Security leaks should be patched (depending of the `disable_anticheat` setting then possible) and exploited in [the official Dragonfire mod](https://github.com/minetest-palamod/palamod-test-dragonfire) for informational and documentation purpose.

Release Process
---------------

Releases will use 0.x form until the modpack get playable.

Create a tag:

```sh
git tag 0.x
```

Push the tag:

```sh
git push --tags
```

The ContentDB will be updated automaticaly by webhooks.

**WARNING: ContentDB will update package info from the `.cdb.json` file, its very important to fill it properly before creating the release.**

Then, a release should be created from the GitHub interface or GitHub CLI containing infos about the major changes.

```sh
gh release create <tag> --title v0.x --notes <release description>
```

