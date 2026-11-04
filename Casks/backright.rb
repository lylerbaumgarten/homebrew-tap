cask "backright" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "9bcc7f05b47adfe4c0d4c3d96676de2036c0c34219eb9de64074f54d00170990",
         intel: "66bcab29641743c4d868867ab5645c8344a104dcfa82c9496813fcceabcdc229"

  url "https://github.com/lylerbaumgarten/backright/releases/download/v#{version}/BackRight-#{version}-#{arch}.dmg"
  name "BackRight"
  desc "Posture nudges from your webcam, analysed on-device"
  homepage "https://github.com/lylerbaumgarten/backright"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "BackRight.app"

  # BackRight is free and open source but not notarized by Apple (that needs a paid developer account), so macOS would
  # ask you to confirm it in System Settings. Installing it with Homebrew is you choosing to trust this download, which
  # Homebrew has just verified against the checksum above, so the quarantine flag is cleared here. The app is ad-hoc signed.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/BackRight.app"]
  end

  zap trash: [
    "~/Library/Application Support/BackRight",
    "~/Library/Caches/com.lylebaumgarten.backright",
    "~/Library/Preferences/com.lylebaumgarten.backright.plist",
    "~/Library/Saved Application State/com.lylebaumgarten.backright.savedState",
  ]

  caveats <<~EOS
    BackRight is not notarized by Apple. This cask removes macOS's "downloaded from the internet" flag from the app after
    Homebrew has checked the download's SHA-256, so you won't see the "Open Anyway" prompt. If you'd rather keep that
    check, download the .dmg from the GitHub release instead.

    BackRight needs camera access (analysed on this Mac, never saved or sent). macOS will ask the first time.
  EOS
end
