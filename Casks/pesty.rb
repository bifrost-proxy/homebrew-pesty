cask "pesty" do
  version "1.6.1"
  sha256 "53390cc6f4c4fbe7be456e3e0127723c59431d6379009d7741524fd30784fe36"

  url "https://github.com/bifrost-proxy/pesty/releases/download/v#{version}/Pesty-#{version}.dmg"
  name "Pesty"
  desc "Free, open-source clipboard manager"
  homepage "https://github.com/bifrost-proxy/pesty"

  depends_on macos: :sonoma

  app "Pesty.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pesty.app"]
  end

  zap trash: [
    "~/Library/Application Support/Pesty",
    "~/Library/Preferences/com.bifrostproxy.pesty.plist",
  ]

  caveats <<~EOS
    This community build is ad-hoc signed because it is published without an
    Apple Developer ID certificate. The cask removes the quarantine attribute
    after verifying the release SHA-256 so macOS can open the app.
  EOS
end
