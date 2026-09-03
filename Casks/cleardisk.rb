cask "cleardisk" do
  version "2.3.1"
  sha256 "f12eb1e8698c3d68dd42a2391cb872fa7740516e905acaa3f23d641c088a8edd"

  url "https://github.com/bysiber/cleardisk/releases/download/v#{version}/ClearDisk-v#{version}.dmg"
  name "ClearDisk"
  desc "Free, open-source macOS app to find and clean developer caches"
  homepage "https://github.com/bysiber/cleardisk"

  auto_updates true
  depends_on macos: :sonoma

  app "ClearDisk.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClearDisk.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.cleardisk.app.plist",
    "~/Library/Caches/com.cleardisk.app",
    "~/Library/Saved Application State/com.cleardisk.app.savedState",
  ]
end
