cask "mdv" do
  version "1.0.2"
  sha256 "0dedacb37e393581096a2bd408b338c8515973e910d7d0bfed7ad51a676828a1"

  url "https://github.com/oiysful/MDV/releases/download/v#{version}/MDV-#{version}-arm64-mac.zip"
  name "MDV"
  desc "Claude-style desktop Markdown editor"
  homepage "https://github.com/oiysful/MDV"

  depends_on arch: :arm64

  app "MDV.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/MDV.app"],
                    sudo: false
  end

  caveats do
    <<~EOS
      MDV is an unsigned, unnotarized app. This cask removes the
      com.apple.quarantine attribute after install so macOS Gatekeeper
      will not report the app as damaged. See the MDV README's
      "Distribution Notes" section for details.
    EOS
  end
end
