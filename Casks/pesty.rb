cask "pesty" do
  version "1.3.1"
  sha256 "3b10c56071cadf5d60f117380057c375514b77f1f704d4bf0d20deac5a41a30b"

  url "https://github.com/bifrost-proxy/pesty/releases/download/v#{version}/Pesty-#{version}.dmg"
  name "Pesty"
  desc "Free, open-source clipboard manager for macOS"
  homepage "https://github.com/bifrost-proxy/pesty"

  depends_on macos: :sonoma

  app "Pesty.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pesty.app"]
  end

  caveats <<~EOS
    This community build is ad-hoc signed because it is published without an
    Apple Developer ID certificate. The cask removes the quarantine attribute
    after verifying the release SHA-256 so macOS can open the app.
  EOS

  zap trash: [
    "~/Library/Application Support/Pesty",
    "~/Library/Preferences/com.bifrostproxy.pesty.plist",
  ]
end
