# Casks/nekode.rb — template for the homebrew-nekode tap.
# CI replaces SHA256 placeholders during release (see .github/workflows/release.yml).
# Copy this file to Casks/nekode.rb in github.com/Jakob-98/homebrew-nekode.
#
# Usage:
#   brew tap Jakob-98/nekode
#   brew install --cask nekode
#
cask "nekode" do
  version "1.0.2"

  on_arm do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-arm64.zip"
    sha256 "40241f9f993156f3ed3b4da1f97bd77e6c672da3f7945bc742454cac95d2ec6d"
  end
  on_intel do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-x86_64.zip"
    sha256 "843b715f35336359264c203fc0968ea8f0eb343055c88b3ba0a95dd3aee6df9e"
  end

  name "Nekode"
  desc "Monitor AI coding sessions from the macOS menu bar"
  homepage "https://nekode.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "Nekode.app"
  binary "#{appdir}/Nekode.app/Contents/MacOS/nekode-cli", target: "nekode"

  zap trash: [
    "~/.nekode",
  ]
end
