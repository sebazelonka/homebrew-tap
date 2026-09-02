cask "opentraffic" do
  version "1.3.1"
  sha256 "6575b0e34c412e06f52c154460a42ad4f1ab41af564012f0fa58d7be42322ca7"

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
