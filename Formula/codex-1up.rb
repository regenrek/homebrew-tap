class Codex1up < Formula
  desc "TypeScript CLI for codex-1up (citty-based)"
  homepage "https://github.com/regenrek/codex-1up"
  url "https://registry.npmjs.org/codex-1up/-/codex-1up-0.3.9.tgz"
  sha256 "4d4bd4fad374ce078f953017050ea789637579262eaf3a555761a0e2651bfa17"
  license "MIT"

  depends_on "node"

  def install
    ENV["HOME"] = buildpath
    system "npm", "install", *std_npm_install_args
  end

  test do
    system "#{bin}/codex-1up", "--help"
  end
end
