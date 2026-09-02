cask "opentraffic" do
  version "1.2.0"
  sha256 "fe76c5198129f77a640dd70a31cf39864ef66d71e7c7d93a57cb569327efa5c7"

  url "https://open-traffic-site.vercel.app/downloads/OpenTraffic.dmg"
  name "OpenTraffic"
  desc "Menu bar app that routes links to the right app"
  homepage "https://open-traffic-site.vercel.app/"

  app "OpenTraffic.app"

  # The app is ad-hoc signed; without this, Gatekeeper blocks the first launch
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/OpenTraffic.app"]
  end
end
