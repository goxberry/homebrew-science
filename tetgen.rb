require "formula"

class Tetgen < Formula
  homepage 'http://wias-berlin.de/software/tetgen/'
  url 'http://www.tetgen.org/1.5/src/tetgen1.5.0.tar.gz'
  sha1 '6fcc557697982c52d274dca611ccc2192cba2bb4'

  def install
    system "make" # build the tetgen binary
    system "make tetlib" # build the library file libtet.a
    bin.install "tetgen"
    lib.install "libtet.a"
    include.install "tetgen.h"
    doc.install %w(README LICENSE example.poly)
  end

  test do
    system "#{bin}/tetgen", "#{doc}/example.poly"
  end

  def caveats; <<-EOS.undent
      Please register as a TetGen user at
      http://wias-berlin.de/software/tetgen/download2.jsp.
    EOS
  end
end
