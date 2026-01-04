class Codex1up < Formula
  desc "TypeScript CLI for codex-1up (citty-based)"
  homepage "https://github.com/regenrek/codex-1up"
  url "https://registry.npmjs.org/codex-1up/-/codex-1up-0.3.8.tgz"
  sha256 "32d7154b2ac682ad45285cdc62c40b70301681bc7be42d83418551baf7abb554"
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
