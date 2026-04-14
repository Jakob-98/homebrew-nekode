# Casks/nekode.rb — template for the homebrew-nekode tap.
# CI replaces SHA256 placeholders during release (see .github/workflows/release.yml).
# Copy this file to Casks/nekode.rb in github.com/Jakob-98/homebrew-nekode.
#
# Usage:
#   brew tap Jakob-98/nekode
#   brew install --cask nekode
#
cask "nekode" do
  version "1.1.0"

  on_arm do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-arm64.zip"
    sha256 "98965a76d3d31ff9d42d3bcd28aabe7bd230ae18faaa1d3ada448abdfd9f041c"
  end
  on_intel do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-x86_64.zip"
    sha256 "1cb6351a139288e9fe1ca024d64a5212967bfa0e1755e71163cb0a977b6b7223"
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
