class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews."
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.17.tar.gz"
  sha256 "f53c4fffd1550be654340295e34cd2805d6d136ccb6536ff32649f4485766c4b"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.17"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peakypanes", "--version"
  end
end
