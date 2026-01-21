class Codex1up < Formula
  desc "TypeScript CLI for codex-1up (citty-based)"
  homepage "https://github.com/regenrek/codex-1up"
  url "https://registry.npmjs.org/codex-1up/-/codex-1up-0.3.11.tgz"
  sha256 "9ff3e3a31caf479faf8952a6ffc7e0ceab38af581ec4e5a37c5222cd56209e2b"
  license "MIT"

  depends_on "node"

  def install
    ENV["HOME"] = buildpath
    system "npm", "install", *std_npm_args
  end

  test do
    system "#{bin}/codex-1up", "--help"
  end
end
