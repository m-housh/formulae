class SwiftZet < Formula
  desc "A command line tool for managing Zettelkasten repositories."
  homepage "https://github.com/m-housh/swift-zet"
  url "https://github.com/m-housh/swift-zet.git", tag: "0.3.7", revision: "50cf70e7273c1c4ff5188d2a90b4191a24408678"

  license "Apache-2.0"

    bottle do
      root_url "https://github.com/m-housh/swift-zet/releases/download/0.3.7"
      rebuild 1
      sha256 cellar: :any, big_sur: "ccb2ee344fb49307a610a2102fc98f9ca1f9ae3df0b156de35dadb760bd3366c"
    end




  head "https://github.com/m-housh/swift-zet.git", shallow: false

  depends_on xcode: ["10.15", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
    (bash_completion/"zet").write `#{bin}/zet --generate-completion-script bash`
    (fish_completion/"zet.fish").write `#{bin}/zet --generate-completion-script fish`
    (zsh_completion/"_zet").write `#{bin}/zet --generate-completion-script zsh`
  end

  test do
    system "#{bin}/zet" "--version"
  end
end
