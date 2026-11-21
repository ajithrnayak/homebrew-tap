class Xpunge < Formula
  desc "See how much disk space Xcode uses, and reclaim it safely"
  homepage "https://github.com/ajithrnayak/xpunge"
  url "https://github.com/ajithrnayak/xpunge/releases/download/v0.1.1/xpunge-0.1.1-macos-universal.tar.gz"
  sha256 "9ea71d5784217f912bccd83614527e0960c1183faf384bfeabf60cc906992be1"
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
