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
    sha256 "7dbc5080fe46dfbd52ed498c1eca7abcf5c3a90c2bf05e7b7873fead1825ac34"
  end
  on_intel do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-x86_64.zip"
    sha256 "befb482234d072559dc6db24bd56a42ac50ec29ad1ac1e346d1b9c2dad946311"
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
