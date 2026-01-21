class Codex1up < Formula
  desc "TypeScript CLI for codex-1up (citty-based)"
  homepage "https://github.com/regenrek/codex-1up"
  url "https://registry.npmjs.org/codex-1up/-/codex-1up-0.3.10.tgz"
  sha256 "6d24ffddc9f2f61cb438ff7a00ece9babf3981974d0dc1fcd574c93bca83bce1"
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
