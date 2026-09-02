cask "opentraffic" do
  version "0.6.6"
  sha256 "b23e599263fa1d940674a1352d2e3a8922466fc53073574f3eb0f76df80cbd12"

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
