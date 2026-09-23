cask "opentraffic" do
  version "0.0.2"
  sha256 "16098d2821a88b8daa6709f47be60621a7cca27731d872bb68df49a58b5a8c56"

  url "https://open-traffic-site.vercel.app/downloads/OpenTraffic-0.0.2.dmg"
  name "OpenTraffic"
  desc "Menu bar app that routes links to the right app"
  homepage "https://open-traffic-site.vercel.app/"

  app "OpenTraffic.app"

  # Quit the app before replacing the bundle so brew upgrade does not need a
  # manual quit/reopen. Kept on preflight/postflight: the *_steps names
  # Homebrew suggests are a new declarative DSL that does not support
  # system_command (nor quit) yet.
  preflight do
    system_command "/usr/bin/osascript", args: ["-e", 'quit app "OpenTraffic"']
  end

  # The app is ad-hoc signed; without this, Gatekeeper blocks the first launch.
  # Relaunch at the end so the menu bar icon comes back on its own.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/OpenTraffic.app"]
    system_command "/usr/bin/open",
                   args: ["-a", "#{appdir}/OpenTraffic.app"]
  end
end
