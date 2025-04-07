# Git flags Buildkite Plugin

![Github Workflow (CI)](https://github.com/whizzzkid/git-flags-buildkite-plugin/actions/workflows/ci.yml/badge.svg)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/whizzzkid/git-flags-buildkite-plugin)

Sets the Buildkite git flags for the current build. This can be useful to customize the behavior of the git commands used by Buildkite.

## Example

Add the following to your `pipeline.yml` (all flags are optional and update the [corresponding flags](https://buildkite.com/docs/agent/v3/configuration) in your pipeline:

```yml
steps:
  - command: ls
    plugins:
      - whizzzkid/git-flags#<latest_tag>:
          clean_flags: "-ffxdq"
          clone_flags: "--depth=1"
          clone_mirror_flags: "--mirror"
          fetch_flags: "--depth=1"
          mirrors_lock_timeout: 100
          mirrors_path: "~/new/path"
          mirrors_skip_update: "false"
```

If you're using [`buildkite-builder`](https://github.com/Gusto/buildkite-builder), then you can introduce the plugin like:

```rb
Buildkite::Builder.pipeline do
  # ...
  # other setups
  # ...
  plugin :shallow_clone, 'ssh://git@github.com/whizzzkid/git-flags-buildkite-plugin.git#<latest-tag>', {
    clone_flags: '--single-branch --depth 1',
    fetch_flags: '--depth 1'
  }
  # then int the command step
  command do
    label 'Do Something'
    # ... command config
    plugin :shallow_clone
  end
end
```

> [!NOTE]  
> Don't forget to replace `<latest-tag>` with a corresponding tag from the [releases](https://github.com/whizzzkid/git-flags-buildkite-plugin/releases).

## Configuration

### `clean_flags` (Optional, string)

Git clean flags, e.g. "-ffxdq". Supports any pattern supported by [git-clean](https://man7.org/linux/man-pages/man1/git-clean.1.html). Corresponding Buildkite documentation can be found [here](https://buildkite.com/docs/agent/v3/configuration#git-clean-flags).

### `clone_flags` (Optional, string)

Git clone flags, e.g `--depth=1`. Supports any pattern supported by [git clone](https://man7.org/linux/man-pages/man1/git-clone.1.html). Corresponding Buildkite documentation can be found [here](https://buildkite.com/docs/agent/v3/configuration#git-clone-flags)

### `fetch_flags` (Optional, string)

Git fetch flags, e.g `--all`. Supports any pattern supported by [git fetch](https://man7.org/linux/man-pages/man1/git-fetch.1.html). Corresponding Buildkite documentation can be found [here](https://buildkite.com/docs/agent/v3/configuration#git-fetch-flags)

### `clone_mirror_flags` (Optional, string)

Buildkite clone mirror flags, e.g `--mirror`. Corresponding Buildkite documentation can be found [here](https://buildkite.com/docs/agent/v3/configuration#git-clone-mirror-flags)

### `mirrors_lock_timeout` (Optional, number)

Buildkite mirror lock timeout, e.g `100`, default `300`. Corresponding Buildkite documentation can be found [here](https://buildkite.com/docs/agent/v3/configuration#git-mirrors-lock-timeout)

### `mirrors_path` (Optional, string)

Buildkite mirrors path, e.g `~/new/path`. Corresponding Buildkite documentation can be found [here](https://buildkite.com/docs/agent/v3/configuration#git-mirrors-path)

### `mirrors_skip_update` (Optional, boolean)

Buildkite skip mirrors update, e.g `true`. Corresponding Buildkite documentation can be found [here](https://buildkite.com/docs/agent/v3/configuration#git-mirrors-skip-update).

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
