class Peakypanes < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews"
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.26.tar.gz"
  sha256 "1cff524e6e0708468b6f3feab867bfd5d2372fb8c398cd3bcdfa507f159dc408"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.26"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peky"), "./cmd/peky"
  end

  service do
    run [opt_bin/"peky", "daemon"]
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
        peky
    EOS
  end

  test do
    system "#{bin}/peky", "--version"
  end
end
