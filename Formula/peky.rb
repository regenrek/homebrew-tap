class Peky < Formula
  desc "Terminal dashboard with YAML-based layouts and native live previews"
  homepage "https://github.com/regenrek/peakypanes"
  url "https://github.com/regenrek/peakypanes/archive/refs/tags/v0.0.31.tar.gz"
  sha256 "9230a205e1a73d600ea73dc522a0d278e57f193bad934aff272864b75911ceeb"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=0.0.31"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"peky"), "./cmd/peky"
  end

  service do
    run [opt_bin/"peky", "daemon"]
    keep_alive true
    working_dir HOMEBREW_PREFIX
    log_path var/"log/peky.log"
    error_log_path var/"log/peky.log"
  end

  def caveats
    <<~EOS
      Peakypanes runs a background daemon for managing sessions.

      Start the daemon:
        brew services start peky

      Then run:
        peky
    EOS
  end

  test do
    system "#{bin}/peky", "--version"
  end
end
