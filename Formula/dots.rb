class Dots < Formula
  desc "Command-line tool for managing my dotfiles"
  homepage "https://github.com/m-housh/dots"
  url "https://github.com/m-housh/dots.git", branch: "main"
  version "0.0.7"
  license "MIT"

  bottle do
    root_url "https://github.com/m-housh/dots/releases/download/0.0.7"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "9da71760641d051eeea226f0b18beda0df3b5f9236c511dacdcd4a7437ab3468"
  end

  depends_on xcode: ["14.2", :build]

  def install
    system "make", "install", "PREFIX=#{prefix}"
    generate_completions_from_executable(bin/"dots", "--generate-completion-script")
  end

  test do
    system "#{bin}/dots" "--version"
  end
end
