# homebrew-tap

Instalación de [OpenTraffic](https://open-traffic-site.vercel.app/) vía Homebrew:

```bash
brew tap sebazelonka/tap
brew trust sebazelonka/tap
brew install --cask opentraffic
```

El cask apunta al DMG canónico servido por Vercel; el CI del repo privado de la
app actualiza `version` y `sha256` automáticamente en cada tag `vX.Y.Z`
(requiere que el token `DEPLOY_TOKEN` tenga acceso de escritura a este repo).
