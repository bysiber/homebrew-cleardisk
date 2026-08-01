cask "cleardisk" do
  version "1.8.4"
  sha256 "3389b26bb46f3273073c47817ccda6bd4023a1b445e888d487815f0cb05abf00"

  url "https://github.com/bysiber/cleardisk/releases/download/v#{version}/ClearDisk-v#{version}.dmg"
  name "ClearDisk"
  desc "Free, open-source macOS app to find and clean developer caches"
  homepage "https://github.com/bysiber/cleardisk"

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
