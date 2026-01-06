class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews"
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.22.tar.gz"
  sha256 "3f307a279fc2fa45227e48acd5a06686de32907dbedf85d68c53b01964023e59"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.22"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peky"), "./cmd/peky"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peakypanes"), "./cmd/peakypanes"
  end

  test do
    system "#{bin}/peky", "--version"
    system "#{bin}/peakypanes", "--version"
  end
end
