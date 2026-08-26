cask "cleardisk" do
  version "2.0.1"
  sha256 "b69e26d2bc0484b90ae184012144e75868b7b7e6711c153b412a456d88171e48"

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
