class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews"
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.21.tar.gz"
  sha256 "fbb6387fc1672bd146c2f53ef834e38f0b94828ef89c6754f3a9b37c481012ab"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.21"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peky"), "./cmd/peky"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peakypanes"), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peky", "--version"
    system "#{bin}/peakypanes", "--version"
  end
end
