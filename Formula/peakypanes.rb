class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews."
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "ed67d1b450dc9a51a9227f33e8a01ee2bad0f407eab3156edc2af4c5759e752a"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peakypanes", "--version"
  end
end
