cask "rum" do
	version "1.2.1"
	sha256 "4e13facdbfac7f69b83bc10bd379d5334f374b582eb2c8cfa7ff993ed42bab17"

	url "https://github.com/adrianlungu/rum/releases/download/v#{version}/Rum.zip"
	name "Rum"
	desc "Wine wrapper for running Windows apps on macOS"
	homepage "https://github.com/adrianlungu/rum"

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
