cask "opentraffic" do
  version "0.0.3"
  sha256 "64eb66f0dc93f9b9b03a3f653656090c8fd9733bce2a204227149eafc8d62d65"

  url "https://open-traffic-site.vercel.app/downloads/OpenTraffic-0.0.3.dmg"
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
