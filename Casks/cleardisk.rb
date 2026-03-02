cask "cleardisk" do
  version "1.6.1"
  sha256 "e1884ea674fe5828b30cf2c245f0f5ec147e7397750fa37accb0a264fe631355"

  url "https://github.com/bysiber/cleardisk/releases/download/v#{version}/ClearDisk-v#{version}.dmg"
  name "ClearDisk"
  desc "Free, open-source macOS app to find and clean developer caches"
  homepage "https://github.com/bysiber/cleardisk"

  depends_on macos: ">= :sonoma"

  app "ClearDisk.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClearDisk.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.bysiber.ClearDisk.plist",
    "~/Library/Caches/com.bysiber.ClearDisk",
  ]
end
