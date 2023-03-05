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

  bottle do
    root_url "https://github.com/m-housh/dots/releases/download/0.0.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_ventura: "bcbe519fa301ba54d2670cc7ca0e829529f32ee0a4d8552ab8ef2142858743f9"
  end
end
