cask "pesty" do
  version "1.6.12"
  sha256 "ea20278d44af7c8fad941c91397892b1f3f419aae0008fed6cf1eee7266f1451"

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
