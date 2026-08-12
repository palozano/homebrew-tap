# Palozano Tap

## How do I install these formulae?

Install `todolog` directly:

```sh
brew install palozano/tap/todolog
```

Or tap the repository first:

```sh
brew tap palozano/tap
brew install todolog
```

In a `brew bundle` `Brewfile`:

```ruby
tap "palozano/tap"
brew "todolog"
```

## Maintaining todolog

Update `Formula/todolog.rb` for a new release by changing the tag URL and
`sha256`, then verify it locally:

```sh
brew install --build-from-source --verbose palozano/tap/todolog
brew test palozano/tap/todolog
brew audit --new --formula palozano/tap/todolog
```

The tap includes the Homebrew `brew test-bot` workflow. To build bottles, open a
pull request against this tap, wait for the bottle artifacts, then run the
`brew pr-pull` workflow for that pull request.

For a local bottle pull:

```sh
brew pr-pull --tap=palozano/tap <pull-request-number>
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
