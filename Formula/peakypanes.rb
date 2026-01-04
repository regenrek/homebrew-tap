class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews."
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.16.tar.gz"
  sha256 "bb3e02d11d9427e1ff3f38b2a7e35994ae3b4e12c9987ec1a8b1771b45d9f698"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.16"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peakypanes", "--version"
  end
end
