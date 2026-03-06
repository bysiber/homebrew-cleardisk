cask "cleardisk" do
  version "1.6.5"
  sha256 "75c2bfefca39ba0222317a5f2f90ee365bfa2ab70a98a12b3fe9e714e92526b7"

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
