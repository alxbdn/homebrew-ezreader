cask "ezreader" do
  version "1.0.0"
  sha256 "abd9c85cffe95ecc706c2fcef5502c52dc4ea32c1a83911f5823f5c55d614012"

  url "https://github.com/alxbdn/EzReader/releases/download/v#{version}/ezreader-#{version}-macos-universal.dmg",
      verified: "github.com/alxbdn/EzReader/"
  name "EzReader"
  desc "Lightweight PDF reader and editor: annotate, sign, edit, compress, protect"
  homepage "https://github.com/alxbdn/EzReader"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "EzReader.app"

  # The app is signed ad hoc, not notarized by Apple: without this, macOS
  # refuses to open it the first time ("cannot be opened because the
  # developer cannot be verified").
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/EzReader.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.alxbdn.ezreader",
    "~/Library/Caches/com.alxbdn.ezreader",
    "~/Library/Saved Application State/com.alxbdn.ezreader.savedState",
    "~/Library/WebKit/com.alxbdn.ezreader",
  ]
end
