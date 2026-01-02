class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews"
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "091f6f3b0f5cbeff674b0c34b2f977c8086237e99176f468260a79f4bb013bd4"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/peakypanes"
  end

  test do
    system bin/"peakypanes", "--version"
  end
end
