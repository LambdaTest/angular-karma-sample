# typed: false
# frozen_string_literal: true

class KaneCli < Formula
  desc "KaneAI browser automation CLI - AI-powered testing"
  homepage "https://www.lambdatest.com/kane-ai"
  url "https://registry.npmjs.org/@testmuai/kane-cli/-/kane-cli-0.2.7.tgz"
  sha256 "8797e961974a39ef89e63d5e569930ed851cedebff4f6192f9343388791a5618"
  license "Apache-2.0"
  version "0.2.7"

  bottle do
    root_url "https://github.com/LambdaTest/homebrew-kane/releases/download/kane-cli-0.2.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7cf5cded5e6e0eed67d5be76e6e0b3b9e895d7a422add2d3d30625615ee19e17"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4b4e61f6e38d4b911b652ad7018a86d10ad17d4f102daa65b5194e1985116e7c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2cf64adeb2deaa709baa276026e5bbe12795d596e200461aacfd66516524c48d"
  end

  depends_on "node"

  def install
    # Strip --build-from-source from std_npm_args (brew/Library/Homebrew/
    # language/node.rb injects it unconditionally). For sharp, that flag
    # forces a node-gyp compile instead of using the prebuilt — which
    # invokes the toolchain. Strip it so install stays toolchain-free.
    args = std_npm_args.reject { |arg| arg == "--build-from-source" }
    system "npm", "install", *args
    bin.install_symlink libexec.glob("bin/*")
  end

  def caveats
    <<~EOS
      Currently supported platforms: macOS (Apple Silicon and Intel) and Linux x64.
      ARM Linux is not yet available.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kane-cli --version")
  end
end
