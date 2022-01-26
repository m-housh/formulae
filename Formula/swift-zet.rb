class SwiftZet < Formula
  desc "A command line tool for managing Zettelkasten repositories."
  homepage "https://github.com/m-housh/swift-zet"
  url "https://github.com/m-housh/swift-zet.git", tag: "0.3.10", revision: "dc5386d0ddf7d852c4653e3ebeb5656af2715164"

  license "Apache-2.0"

    bottle do
      root_url "https://github.com/m-housh/swift-zet/releases/download/0.3.10"
      rebuild 2
      sha256 cellar: :any, big_sur: "58d9a47881b2605f88fffcbaf0151e7df3e165be2ddf50c49ca96acc7a74fe40"
      sha256 cellar: :any_skip_relocation, arm64_monterey: "4967188b1ca963b7352f4579edde58ab55fe58baa71267dcf9517a7d15dc3f38"
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
