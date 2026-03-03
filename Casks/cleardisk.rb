cask "cleardisk" do
  version "1.6.2"
  sha256 "8920db4a6bd8d87ed17ebde3ed6ef022902f3b4f133c2a91822e1bd54661a6ad"

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
