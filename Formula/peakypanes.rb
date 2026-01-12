class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews"
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.25.tar.gz"
  sha256 "eaacbc33819c082a73f612b9aecf87ca09b52b34bf78a05f15ddb0bd1e235e34"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.25"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peky"), "./cmd/peky"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peakypanes"), "./cmd/peakypanes"
  end

  service do
    run [opt_bin/"peakypanes", "daemon"]
    keep_alive true
    working_dir HOMEBREW_PREFIX
    log_path var/"log/peakypanes.log"
    error_log_path var/"log/peakypanes.log"
  end

  def caveats
    <<~EOS
      Peakypanes runs a background daemon for managing sessions.

      Start the daemon:
        brew services start peakypanes

      Then run:
        peakypanes
    EOS
  end

  test do
    system "#{bin}/peky", "--version"
    system "#{bin}/peakypanes", "--version"
  end
end
