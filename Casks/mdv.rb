cask "mdv" do
  version "1.2.0"
  sha256 "b7ef1a1bf24128ecb29a1234c84a689c30056d044934c7a003eff9f3dbbbd293"

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
