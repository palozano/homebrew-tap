class Todolog < Formula
  desc "Track TODO-style code comments in a plain Markdown task log"
  homepage "https://github.com/palozano/todolog"
  url "https://github.com/palozano/todolog/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e3a6090d2f7e46b5d1c91eff230b8103a7ef4ab2b0b1598824b5144c2bab02ce"
  license "MIT"

  bottle do
    root_url "https://raw.githubusercontent.com/palozano/homebrew-tap/main/bottles"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e8191c0b4d68d2d55382a82a37898fc1b6717cd701feaffb78a465032c692583"
    sha256 cellar: :any,                 arm64_linux:  "97742951fc22fff0ea2d4916045024904f2879af5627dd18cf90037f6f65d59e"
    sha256 cellar: :any,                 x86_64_linux: "1726c1d35b7fbe360bb7e1f2542f454d8fed032974fb742c7b0a402a3d0b34c9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"sample.rs").write("// TODO: check homebrew install\n")
    system bin/"todolog", "scan", testpath.to_s
    assert_match "check homebrew install", shell_output("#{bin}/todolog list --open")
  end
end
