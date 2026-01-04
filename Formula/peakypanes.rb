class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews."
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.19.tar.gz"
  sha256 "92c35f2118ff75aa30ddd616cd1430d88ca4aadcc635f779f3a8a4815bf97f80"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.19"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peakypanes", "--version"
  end
end
