cask "cleardisk" do
  version "1.8.0"
  sha256 "30b6e7a8108da746ef6215eea5c69286679daaf342ee2fe5fd0bc1c066ae9599"

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
