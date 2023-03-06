class Dots < Formula
  desc "A command line tool for managing my dotfiles"
  homepage "https://github.com/m-housh/dots"
  url "https://github.com/m-housh/dots.git", branch: "main"
  license "MIT"
  version "0.0.3"

  depends_on xcode: ["14.2", :build]

  def install
    system "make", "install", "PREFIX=#{prefix}"
    (bash_completion/"dots").write `#{bin}/dots --generate-completion-script bash`
    (fish_completion/"dots.fish").write `#{bin}/dots --generate-completion-script fish`
    (zsh_completion/"dots").write `#{bin}/dots --generate-completion-script zsh`
  end

  bottle do
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_ventura: "60219fa9a287063456d42f1f761e0d1d760fdeb7246ea45f65511eae0a93cdde"
  end

  test do
    system "#{bin}/dots" "--version"
  end
end
