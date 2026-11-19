class Xpunge < Formula
  desc "See how much disk space Xcode uses, and reclaim it safely"
  homepage "https://github.com/ajithrnayak/xpunge"
  url "https://github.com/ajithrnayak/xpunge/releases/download/v0.1.0/xpunge-0.1.0-macos-universal.tar.gz"
  sha256 "0594ab091a11602462b35255c724fc2b0dd28cc989109754fbeaf1e7051aee48"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "xpunge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xpunge --version")
    # Refused before any folder or simctl is touched: runtimes need an explicit selector.
    assert_match "never deletes all runtimes", shell_output("#{bin}/xpunge clean runtimes 2>&1", 1)
  end
end
