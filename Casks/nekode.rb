# Casks/nekode.rb — template for the homebrew-nekode tap.
# CI replaces SHA256 placeholders during release (see .github/workflows/release.yml).
# Copy this file to Casks/nekode.rb in github.com/Jakob-98/homebrew-nekode.
#
# Usage:
#   brew tap Jakob-98/nekode
#   brew install --cask nekode
#
cask "nekode" do
  version "1.0.1"

  on_arm do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-arm64.zip"
    sha256 "ca7314b4f47d5c77138caa84287d40222d8ae765b5f525aa49e6426afe75d8d8"
  end
  on_intel do
    url "https://github.com/Jakob-98/nekode/releases/download/v#{version}/nekode-macOS-x86_64.zip"
    sha256 "5b70f696f9e9a85df4526dab2968a6db6eeffe5a31be71cca99ef2ff3113afc0"
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
