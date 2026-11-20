cask "ezreader" do
  version "1.1.10"
  sha256 "e7ef6326f26f57323070a64c65fa0c85b12b29da0f9ecded4b0df50bafb90b09"

  url "https://github.com/alxbdn/homebrew-ezreader/releases/download/v#{version}/ezreader-#{version}-macos-universal.dmg"
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
