class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews."
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "71aabeaccb0bb824019a9c9edd9b04ba469cb1845e39ba58806bca106bac4fca"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peakypanes", "--version"
  end
end
