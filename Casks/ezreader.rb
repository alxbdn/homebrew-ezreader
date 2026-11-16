cask "ezreader" do
  version "1.1.0"
  sha256 "7d8dd5d64ad583ba841c0391ccc872b5f6e12a2a2cac6e4674f92f3981842f8e"

  url "https://github.com/alxbdn/EzReader/releases/download/v#{version}/ezreader-#{version}-macos-universal.dmg"
  name "EzReader"
  desc "Lightweight PDF reader and editor: annotate, sign, edit, compress, protect"
  homepage "https://github.com/alxbdn/EzReader"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "EzReader.app"

  # The app is signed ad hoc, not notarized by Apple: without this, macOS
  # refuses to open it the first time ("cannot be opened because the
  # developer cannot be verified").
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/EzReader.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.alxbdn.ezreader",
    "~/Library/Caches/com.alxbdn.ezreader",
    "~/Library/Saved Application State/com.alxbdn.ezreader.savedState",
    "~/Library/WebKit/com.alxbdn.ezreader",
  ]
end
