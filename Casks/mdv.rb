cask "mdv" do
  version "1.4.0"
  sha256 "00889bfcd21f8dc9ae43de0bf1e5ff50a40fe1319cac460a528cca58d132b223"

  url "https://github.com/oiysful/MDV/releases/download/v#{version}/MDV-#{version}-arm64-mac.zip"
  name "MDV"
  desc "Claude-style desktop Markdown editor"
  homepage "https://github.com/oiysful/MDV"

  depends_on arch: :arm64
  depends_on :macos

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
