cask "opentraffic" do
  version "1.3.0"
  sha256 "389e4869634a99e9a3995cecd3a7616f649f80a21baeb8ecde69ae1f146264aa"

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
