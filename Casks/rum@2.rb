cask "rum@2" do
	version "2.0.0-beta.1"
	sha256 "26749001f691db62271417980153f9cba9bd2d18da26f36979fe3b6154362b26"

	url "https://github.com/lunguini/rum/releases/download/v#{version}/Rum.zip"
	name "Rum (v2)"
	desc "Wine wrapper for running Windows apps on macOS"
	homepage "https://github.com/lunguini/rum"

	conflicts_with cask: ["rum", "rum@1"]
	depends_on macos: ">= :sequoia"
	depends_on arch: :arm64

	app "Rum.app"

	postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Rum.app"]
  end

	zap trash: [
		"~/Library/Application Support/com.adrianlungu.rum",
		"~/Library/Containers/com.adrianlungu.rum",
		"~/Library/Preferences/com.adrianlungu.rum.plist",
	]
end
