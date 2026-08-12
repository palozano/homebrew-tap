class Todolog < Formula
  desc "Track TODO-style code comments in a plain Markdown task log"
  homepage "https://github.com/palozano/todolog"
  url "https://github.com/palozano/todolog/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e3a6090d2f7e46b5d1c91eff230b8103a7ef4ab2b0b1598824b5144c2bab02ce"
  license "MIT"

  bottle do
    root_url "https://raw.githubusercontent.com/palozano/homebrew-tap/main/bottles"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "946124d5a11beaeada502b1c4781f21f51e3651895b722b4408ead3d22304551"
    sha256 cellar: :any,                 x86_64_linux: "d4f6d5cddf0a93cde78928b688203a6f9a9e615e7e6dca83cec69eb597f84925"
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
