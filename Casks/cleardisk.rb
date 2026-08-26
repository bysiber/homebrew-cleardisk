cask "cleardisk" do
  version "2.0.0"
  sha256 "fac2c83692f8bbdf92f3f039034416a87e1bab132cd1f1c2817bc3a7cd6dbbdf"

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
