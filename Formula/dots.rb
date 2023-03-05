class Dots < Formula
  desc "A command line tool for managing my dotfiles."
  homepage "https://github.com/m-housh/dots"
  url "https://github.com/m-housh/dots.git"
  version "0.0.1"
  sha256 ""
  license "Apache-2.0"

  depends_on xcode: ["12", :build]

  def install
    system "make", "install", "PREFIX=#{prefix}"
    (bash_completion/"dots").write `#{bin}/dots --generate-completion-script bash`
    (fish_completions/"dots").write `#{bin}/dots --generate-completion-script fish`
    (zsh_completions/"dots").write `#{bin}/dots --generate-completion-script zsh`
  end

  test do
    system "#{bin}/dots" "--version"
  end

end
