require 'formula'

class Libflame < Formula
  homepage "http://www.cs.utexas.edu/~flame/web/"
  url "https://github.com/flame/libflame/archive/5.1.0.tar.gz"
  sha1 "d3879abcac934c51a11b348fcb2fa6a1259e538a"

  depends_on :fortran
  option "without-check", "Skip build-time tests (not recommended)"

  def install
    config_args = ["--prefix=#{prefix}"]

    system "./configure", *config_args
    system "make"

    # Even though these are options in the Makefile, they don't do much
    # right now.
    if build.with? "check"
      system "make", "check"
      system "make", "test"
    end

    system "make", "install"

  end
end
