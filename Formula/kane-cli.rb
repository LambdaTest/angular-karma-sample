# typed: false
# frozen_string_literal: true

class KaneCli < Formula
  desc "KaneAI browser automation CLI - AI-powered testing"
  homepage "https://www.lambdatest.com/kane-ai"
  url "https://registry.npmjs.org/@testmuai/kane-cli/-/kane-cli-0.2.7.tgz"
  sha256 "8797e961974a39ef89e63d5e569930ed851cedebff4f6192f9343388791a5618"
  license "Apache-2.0"
  version "0.2.7"

  depends_on "node"

  def install
    # Strip --build-from-source from std_npm_args. Brew injects this flag
    # unconditionally (Library/Homebrew/language/node.rb), which forces every
    # native dep to compile via node-gyp. kane-cli pulls in `sharp`, whose
    # libvips bindings need a current macOS SDK; on machines with an older
    # Xcode (e.g. 16.x on macOS 26) the compile blows up with brew's
    # "Your Xcode is too outdated" hard-fail. Letting npm install the
    # `@img/sharp-{platform}` prebuilt instead avoids any compilation.
    args = std_npm_args.reject { |arg| arg == "--build-from-source" }
    system "npm", "install", *args
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
