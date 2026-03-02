cask "cleardisk" do
  version "1.6.2"
  sha256 "aa7a2b663a67456a9381016262cf59ca2bdd2963e35ca594c2555aa731cac0f9"

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
