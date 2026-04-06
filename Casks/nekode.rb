# Casks/nekode.rb — template for the homebrew-nekode tap.
# CI replaces SHA256 placeholders during release (see .github/workflows/release.yml).
# Copy this file to Casks/nekode.rb in github.com/Jakob-98/homebrew-nekode.
#
# Usage:
#   brew tap Jakob-98/nekode
#   brew install --cask nekode
#
cask "nekode" do
  version "1.0.4"

  on_arm do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-arm64.zip"
    sha256 "3d176de95d004f009382f34cf87e4ceeb9e407f38a013cc14e8f5950197f114e"
  end
  on_intel do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-x86_64.zip"
    sha256 "0077d5e7d5ac67b3f414b81a0fb46621c9e9d66df2d5c0d140a5be10f68e8fcb"
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
