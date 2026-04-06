# Casks/nekode.rb — template for the homebrew-nekode tap.
# CI replaces SHA256 placeholders during release (see .github/workflows/release.yml).
# Copy this file to Casks/nekode.rb in github.com/Jakob-98/homebrew-nekode.
#
# Usage:
#   brew tap Jakob-98/nekode
#   brew install --cask nekode
#
cask "nekode" do
  version "1.0.3"

  on_arm do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-arm64.zip"
    sha256 "ae046e298d8f67e4ed04974045b516397bce00f464445e282acb70663c224ec6"
  end
  on_intel do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-x86_64.zip"
    sha256 "feeeedb30d3fd116e09cea4586f512f55dacd0b7e88d82c2169702c48d467c57"
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
