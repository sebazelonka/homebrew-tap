# homebrew-tap

Install [OpenTraffic](https://open-traffic-site.vercel.app/) via Homebrew:

```bash
brew tap sebazelonka/tap
brew trust sebazelonka/tap
brew install --cask opentraffic
```

The cask points to the canonical DMG served by Vercel; the CI in the private
app repo updates `version` and `sha256` automatically on every `vX.Y.Z` tag
(requires the `DEPLOY_TOKEN` secret to have write access to this repo).
