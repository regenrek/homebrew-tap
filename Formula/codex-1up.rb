class Codex1up < Formula
  desc "TypeScript CLI for codex-1up (citty-based)"
  homepage "https://github.com/regenrek/codex-1up"
  url "https://registry.npmjs.org/codex-1up/-/codex-1up-0.3.16.tgz"
  sha256 "5a007b9ed48eaf1d102aa229c06f0d57df0892eed12949c90bf4abc429b5b650"
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
