cask "opentraffic" do
  version "0.0.4"
  sha256 "7e4d38a887968648ccb1f4660d257628cde3b46398586431f1f0d5f10759fc0d"

  url "https://open-traffic-site.vercel.app/downloads/OpenTraffic-#{version}.dmg"
  name "OpenTraffic"
  desc "Menu bar app that routes links to the right app"
  homepage "https://open-traffic-site.vercel.app/"

  depends_on :macos

  app "OpenTraffic.app"

  # Quit the app before replacing the bundle so brew upgrade does not need a
  # manual quit/reopen.
  preflight_steps do
    terminate_process "OpenTraffic"
  end

  # The app is ad-hoc signed; without this, Gatekeeper blocks the first launch.
  # Install steps run sandboxed and cannot launch apps, so there is no relaunch
  # here: LaunchServices starts OpenTraffic again on the next link click.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/OpenTraffic.app"]
  end
end
