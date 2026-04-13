cask "rum" do
	version "1.0.3"
	sha256 "3fc0394639ca5ff7651d22bd37f13f606fce0c8fab6441f0f4a7e35f0d07b091"

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
