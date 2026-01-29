class Codex1up < Formula
  desc "TypeScript CLI for codex-1up (citty-based)"
  homepage "https://github.com/regenrek/codex-1up"
  url "https://registry.npmjs.org/codex-1up/-/codex-1up-0.3.20.tgz"
  sha256 "46d4920efe73a9d54e37b83ccfcc1aa4994479035333def57193f152f57f6155"
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
