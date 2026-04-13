cask "rum" do
	version "1.0.3"
	sha256 "1f267b8d75d68808024e72ed6973960a12a6b23152b134a2de80dd7b96d1e4da"

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
