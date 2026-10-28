cask "rum@2" do
	version "2.0.0-alpha.2"
	sha256 "cd6e615ba22b8c24ccee5fd5f41144ca462d92bb1c3d0533171aaecc46358ac1"

	url "https://github.com/adrianlungu/rum/releases/download/v#{version}/Rum.zip"
	name "Rum (v2)"
	desc "Wine wrapper for running Windows apps on macOS"
	homepage "https://github.com/adrianlungu/rum"

	conflicts_with cask: "rum"
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
