cask "rum@1" do
	version "1.2.2"
	sha256 "694da3f6177fb66ea30a583b55228b6c13cdf8b8893a80b304fc4c70919c7243"

	url "https://github.com/lunguini/rum/releases/download/v#{version}/Rum.zip"
	name "Rum (v1)"
	desc "Wine wrapper for running Windows apps on macOS"
	homepage "https://github.com/lunguini/rum"

	depends_on macos: ">= :sequoia"
	depends_on arch: :arm64

	conflicts_with cask: ["rum", "rum@2"]

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
