cask "rum" do
	version "1.2.0"
	sha256 "3df34bd91e8fdd7b98e23dca5fce0715ce4a379a0c083841a3a3012a5c1c64a4"

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
