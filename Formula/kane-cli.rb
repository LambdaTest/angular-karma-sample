# typed: false
# frozen_string_literal: true

class KaneCli < Formula
  desc "KaneAI browser automation CLI - AI-powered testing"
  homepage "https://www.lambdatest.com/kane-ai"
  url "https://registry.npmjs.org/@testmuai/kane-cli/-/kane-cli-0.2.7.tgz"
  sha256 "8797e961974a39ef89e63d5e569930ed851cedebff4f6192f9343388791a5618"
  license "Apache-2.0"
  version "0.2.7"

  # No source compilation — the install step just pulls a precompiled npm
  # package (with platform-specific prebuilt sub-packages) and symlinks the
  # bin entry. Declaring `bottle :unneeded` skips brew's build-environment
  # setup, which otherwise runs `fatal_setup_build_environment_checks` and
  # hard-fails with "Your Xcode is too outdated" on machines whose Xcode
  # is older than the current macOS SDK requires (e.g. Xcode 16.x on
  # macOS 26). brew/Library/Homebrew/extend/os/mac/diagnostic.rb#L236.
  bottle :unneeded

  depends_on "node"

  def install
    # Strip --build-from-source from std_npm_args (brew/Library/Homebrew/
    # language/node.rb injects it unconditionally). For sharp specifically,
    # this forces compilation via node-gyp instead of using the platform
    # prebuilt — which also tries to invoke the toolchain. With `bottle
    # :unneeded` above, the build env isn't set up at all, but the flag
    # would still steer sharp toward source on machines that DO have a
    # current toolchain. Strip it to keep behavior consistent.
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
