cask "opentraffic" do
  version "0.0.2"
  sha256 "16098d2821a88b8daa6709f47be60621a7cca27731d872bb68df49a58b5a8c56"

  url "https://open-traffic-site.vercel.app/downloads/OpenTraffic-0.0.2.dmg"
  name "OpenTraffic"
  desc "Menu bar app that routes links to the right app"
  homepage "https://open-traffic-site.vercel.app/"

  # Official stanza: quits the app before the bundle is replaced. Replaces the
  # old preflight osascript (preflight_steps, the suggested rename, does not
  # support system_command in current Homebrew).
  quit "zlnk.OpenTraffic"

  app "OpenTraffic.app"

  # The app is ad-hoc signed until Developer ID (security plan phase 6);
  # while the download carries quarantine, Gatekeeper blocks first launch.
  # Relaunch at the end so the menu bar icon comes back on its own.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/OpenTraffic.app"]
    system_command "/usr/bin/open",
                   args: ["-a", "#{appdir}/OpenTraffic.app"]
  end
end
