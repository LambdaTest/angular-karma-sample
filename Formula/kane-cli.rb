# typed: false
# frozen_string_literal: true

class KaneCli < Formula
  desc "KaneAI browser automation CLI - AI-powered testing"
  homepage "https://www.lambdatest.com/kane-ai"
  url "https://registry.npmjs.org/@testmuai/kane-cli/-/kane-cli-0.2.7.tgz"
  sha256 "8797e961974a39ef89e63d5e569930ed851cedebff4f6192f9343388791a5618"
  license "Apache-2.0"
  version "0.2.7"

  # Bottle block intentionally removed — the previously published bottles
  # ship without the v16-runner binary (platform optional dep was missing
  # from the brew install). Build bottles workflow will repopulate this
  # block once the install fix below is merged.

  depends_on "node"

  def install
    # Strip --build-from-source from std_npm_args (brew/Library/Homebrew/
    # language/node.rb injects it unconditionally). For sharp, that flag
    # forces a node-gyp compile instead of using the prebuilt — which
    # invokes the toolchain. Strip it so install stays toolchain-free.
    args = std_npm_args.reject { |arg| arg == "--build-from-source" }
    system "npm", "install", *args

    # Install the platform-specific optional dep that ships v16-runner.
    # brew's `--prefix=#{libexec}` mode behaves like a global install and
    # modern npm skips `optionalDependencies` in that mode, so the platform
    # subpackage (@testmuai/kane-cli-<plat>) is missing after the main
    # install — kane-cli then can't find v16-runner at runtime.
    #
    # Install it explicitly into the main package's nested node_modules so
    # the runtime resolver finds it via the first probed path (`<pkg>/dist
    # /../node_modules/<plat-pkg>/bin/v16-runner`). brew's --ignore-scripts
    # also blocks the platform pkg's postinstall (which chmods the binary),
    # so chmod here ourselves.
    platform_pkg =
      if OS.mac?
        Hardware::CPU.arm? ? "@testmuai/kane-cli-darwin-arm64" : "@testmuai/kane-cli-darwin-x64"
      elsif OS.linux?
        "@testmuai/kane-cli-linux-x64"
      end

    if platform_pkg
      pkg_dir = libexec/"lib/node_modules/@testmuai/kane-cli"
      cd pkg_dir do
        system "npm", "install", "--no-save",
               "--cache=#{HOMEBREW_CACHE}/npm_cache",
               "#{platform_pkg}@#{version}"
      end
      runner = pkg_dir/"node_modules/#{platform_pkg}/bin/v16-runner"
      chmod 0755, runner if runner.exist?
    end

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
    # Smoke-test the v16-runner binary is present and executable. Without
    # this, `kane-cli --version` passes (it's pure JS) but `kane-cli run`
    # throws `v16-runner not found`. See git history for the regression.
    runner_pkg =
      if OS.mac?
        Hardware::CPU.arm? ? "@testmuai/kane-cli-darwin-arm64" : "@testmuai/kane-cli-darwin-x64"
      elsif OS.linux?
        "@testmuai/kane-cli-linux-x64"
      end
    runner = libexec/"lib/node_modules/@testmuai/kane-cli/node_modules/#{runner_pkg}/bin/v16-runner"
    assert_predicate runner, :exist?, "v16-runner binary missing — platform pkg #{runner_pkg} not installed"
    assert_predicate runner, :executable?, "v16-runner not executable — postinstall chmod missed"
  end
end
