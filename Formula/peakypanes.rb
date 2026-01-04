class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews"
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.12.tar.gz"
  sha256 "4c58fde17814c0640a232c0d2c0f366388511b2c1c5442ffc6d8e8b8b7204fc3"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/peakypanes"
  end

  test do
    system bin/"peakypanes", "--version"
  end
end
