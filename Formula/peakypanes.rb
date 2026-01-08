class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews"
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.23.tar.gz"
  sha256 "9a24de0a7f0ddea1b7a9912d0b09b1ecda385f3b4f6d036f4cdae486c061e7a8"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.23"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peky"), "./cmd/peky"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peakypanes"), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peky", "--version"
    system "#{bin}/peakypanes", "--version"
  end
end
