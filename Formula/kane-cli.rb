# typed: false
# frozen_string_literal: true

class KaneCli < Formula
  desc "KaneAI browser automation CLI - AI-powered testing"
  homepage "https://www.lambdatest.com/kane-ai"
  url "https://registry.npmjs.org/@testmuai/kane-cli/-/kane-cli-0.2.4.tgz"
  sha256 "3d6a8de041035e5aa87da86be6b76c1f409723d7dcc7e60aace051cce9084fe5"
  license "Apache-2.0"
  version "0.2.4"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")

    # The npm meta package declares optionalDependencies on platform-specific
    # native binary packages (@testmuai/kane-cli-{darwin-arm64,linux-x64,win-x64}).
    # npm installs only the matching one for the current platform — the others
    # are silently skipped and never present, so no cleanup is required here.
  end

  def caveats
    <<~EOS
      Currently supported platforms: macOS ARM64 (Apple Silicon) and Linux x64.
      Intel Mac and ARM Linux binaries are not yet available.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kane-cli --version")
  end
end
