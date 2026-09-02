cask "opentraffic" do
  version "1.0.5"
  sha256 "c2a32ca504f13db1b9459dfe4c1e14746430fbfb0d0f5a910cadda350e604428"

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
