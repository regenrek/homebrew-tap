class Peakypanes < Formula
  desc "Native TUI dashboard for multi-pane sessions"
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "f1eeca029fefcc1df8162eddc8081f3bc7a45e31f4b31542ac51ec8cab5e6ce8"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/peakypanes"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/peakypanes version")
  end
end
