class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews."
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.20.tar.gz"
  sha256 "0972daaaf4adbd639dc30a8a304c4e08d10361554adba070c73f340e2110300e"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.20"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peky"), "./cmd/peky"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peakypanes"), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peky", "--version"
    system "#{bin}/peakypanes", "--version"
  end
end
