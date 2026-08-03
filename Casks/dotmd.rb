cask "dotmd" do
  version "0.1.0"
  sha256 "07ab88cab0ebc2e8a595735af1db1b254292e384ce538f8f8c20f0d1db251b2f"

  url "https://github.com/oiysful/dotmd/releases/download/v#{version}/DotMD-#{version}-arm64-mac.zip"
  name "DotMD"
  desc "Native macOS markdown editor, the native counterpart to MDV"
  homepage "https://github.com/oiysful/dotmd"

  depends_on arch: :arm64
  depends_on :macos

  app "DotMD.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/DotMD.app"],
                   sudo: false
  end

  caveats do
    <<~EOS
      DotMD is an unsigned, unnotarized app. This cask removes the
      com.apple.quarantine attribute after install so macOS Gatekeeper
      will not report the app as damaged. See the DotMD README's
      "Distribution Notes" section for details.
    EOS
  end
end
