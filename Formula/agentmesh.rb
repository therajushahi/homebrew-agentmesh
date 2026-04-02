class Agentmesh < Formula
  desc "Turn any AI coding assistant into a dispatchable, nudge-able agent"
  homepage "https://agentmeshhq.dev"
  url "https://registry.npmjs.org/@agentmeshhq/agent/-/agent-0.4.18.tgz"
  sha256 "edddaf806039f4c3c3a2fb3626cc16d8b7e31d2a28be867190963e51140a5d5a"
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
