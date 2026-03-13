# Casks/nekode.rb
# This formula is for the homebrew-nekode tap (github.com/Jakob-98/homebrew-nekode)
# Copy this file to Casks/nekode.rb in that repo.
#
# Usage:
#   brew tap Jakob-98/nekode
#   brew install --cask nekode
#
cask "nekode" do
  version "0.9.1"

  on_arm do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-arm64.zip"
    sha256 "ef5d16a0a1d438bbc0bbc945386d23f7fed3912249e76facdb6e544d6b96ab2e"
  end
  on_intel do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-x86_64.zip"
    sha256 "0164ab2127503656814fa75cca82cb9e4a3615a47096c134006be79687ff27a8"
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
  binary "#{appdir}/Nekode.app/Contents/MacOS/nekode"

  zap trash: [
    "~/.nekode",
  ]
end
