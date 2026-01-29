class Codex1up < Formula
  desc "TypeScript CLI for codex-1up (citty-based)"
  homepage "https://github.com/regenrek/codex-1up"
  url "https://registry.npmjs.org/codex-1up/-/codex-1up-0.3.19.tgz"
  sha256 "80c4b9685947adfba89dbb8c3af267c87164415027c22664d27ea43b53499815"
  license "MIT"

  depends_on "node"

  def install
    ENV["HOME"] = buildpath
    system "npm", "install", *std_npm_args
    # npm install doesn't reliably create prefix/bin shims for ESM .mjs bins;
    # symlink the package's bin entrypoint explicitly (preserves relative dist paths).
    bin.install_symlink libexec/"lib/node_modules/codex-1up/bin/codex-1up.mjs" => "codex-1up"
  end

  test do
    system "#{bin}/codex-1up", "--help"
  end
end
