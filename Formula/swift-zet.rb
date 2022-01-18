class SwiftZet < Formula
  desc "A command line tool for managing Zettelkasten repositories."
  homepage "https://github.com/m-housh/swift-zet"
  url "https://github.com/m-housh/swift-zet.git",
      tag: "0.1.2", revision: "00759d0dcdbccf37fc0c802f5a4987b415c1fbc1"
  head "https://github.com/m-housh/swift-zet.git"

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
