cask "opentraffic" do
  version "0.6.6"
  sha256 "d3c626a8ef819e7a24b4cbc3a28a581e56a3db3ff03f5884cc5ea15519f16e1a"

  url "https://open-traffic-site.vercel.app/downloads/OpenTraffic.dmg"
  name "OpenTraffic"
  desc "Menu bar app that routes links to the right app"
  homepage "https://open-traffic-site.vercel.app/"

  app "OpenTraffic.app"

  # Quit the app before replacing the bundle so brew upgrade does not need a
  # manual quit/reopen
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
