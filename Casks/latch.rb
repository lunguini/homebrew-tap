cask "latch" do
	version "0.1.0"
	sha256 "5e16e564a918b2dd17d0b7cd09745dc35c8e9010bc9d9e0498c8985343651bb9"

	url "https://github.com/lunguini/latch/releases/download/v#{version}/Latch.zip"
	name "Latch"
	desc "Menu bar app that restores window positions and Spaces per display config"
	homepage "https://github.com/lunguini/latch"

	depends_on macos: ">= :ventura"
	depends_on arch: :arm64

	app "Latch.app"

	postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Latch.app"]
  end

	zap trash: [
		"~/Library/Application Support/Latch",
		"~/Library/Preferences/com.lunguini.Latch.plist",
	]
end
