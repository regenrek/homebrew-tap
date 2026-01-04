class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews."
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.18.tar.gz"
  sha256 "1959e0a6902b21b7fe6c1caa691459de912625cec08174f19491f9d9382b974c"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.18"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peakypanes", "--version"
  end
end
