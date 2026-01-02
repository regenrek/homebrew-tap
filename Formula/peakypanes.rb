class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews"
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "7355198c801b8ccd0da01e756e8a3fbba4d57fab9b4ceff5cfe3b104f954feb8"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/peakypanes"
  end

  test do
    system bin/"peakypanes", "--version"
  end
end
