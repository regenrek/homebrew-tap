class Codex1up < Formula
  desc "TypeScript CLI for codex-1up (citty-based)"
  homepage "https://github.com/regenrek/codex-1up"
  url "https://registry.npmjs.org/codex-1up/-/codex-1up-0.3.7.tgz"
  sha256 "84f27ef5b941fce1da274a01f8ded88502de8dcaebd0a9d0350ab7f64bd0448d"
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
