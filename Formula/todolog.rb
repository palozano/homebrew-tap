class Todolog < Formula
  desc "Track TODO-style code comments in a plain Markdown task log"
  homepage "https://github.com/palozano/todolog"
  url "https://github.com/palozano/todolog/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e3a6090d2f7e46b5d1c91eff230b8103a7ef4ab2b0b1598824b5144c2bab02ce"
  license "MIT"

  bottle do
    root_url "https://raw.githubusercontent.com/palozano/homebrew-tap/9f5ba83/bottles"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f705064d709535dde9896c7f7765f31c0109fd2bac4af7b4cc6874b014749b79"
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
