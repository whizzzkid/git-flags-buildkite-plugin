# Git flags Buildkite Plugin

![Github Workflow (CI)](https://github.com/whizzzkid/git-flags-buildkite-plugin/actions/workflows/ci.yml/badge.svg)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/whizzzkid/git-flags-buildkite-plugin)

Sets the Buildkite git flags for the current build. This can be useful to customize the behavior of the git commands used by Buildkite.

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - command: ls
    plugins:
      - whizzzkid/git-flags#<latest_tag>:
          clone: "--all"
          fetch: "--all"
```

## Configuration

### `clone` (Optional, string)

Git clone flags, for example `--all`. Supports any pattern supported by [git clone](http://man7.org/linux/man-pages/man1/git-clone.1.html).

### `fetch` (Optional, string)

Git fetch flags, for example `--all`. Supports any pattern supported by [git fetch](http://man7.org/linux/man-pages/man1/git-fetch.1.html).

## Developing

To run the tests:

```shell
docker-compose run --rm tests
```

## Contributing

1. Fork the repo
2. Make the changes
3. Run the tests
4. Commit and push your changes
5. Send a pull request
