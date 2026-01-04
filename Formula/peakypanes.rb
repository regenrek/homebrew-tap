class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews."
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.15.tar.gz"
  sha256 "61e0b09f3b2bf26a25afc5cfe572d1b58767123246e8c554fb7d00237183030f"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.15"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peakypanes", "--version"
  end
end
