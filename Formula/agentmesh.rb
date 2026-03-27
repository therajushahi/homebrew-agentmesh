class Agentmesh < Formula
  desc "Turn any AI coding assistant into a dispatchable, nudge-able agent"
  homepage "https://agentmeshhq.dev"
  url "https://registry.npmjs.org/@agentmeshhq/agent/-/agent-0.4.13.tgz"
  sha256 "5d91f5b24f14bd5b267aea48ead6fca832a6d1731de531b00d3238983dba7c4f"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      To get started, run:
        agentmesh init

      This will prompt you for your API key from https://agentmeshhq.dev
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentmesh --version")
  end
end
