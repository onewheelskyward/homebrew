require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /opt/boxen/homebrew/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

# https://github.com/mxcl/homebrew/issues/7621
class Hugin < Formula
  homepage 'http://hugin.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/hugin/hugin/hugin-2013.0/hugin-2013.0.0.tar.bz2'
  sha1 '0e0689cf2ca0c4a2730cffe06380eda976b6772d'

  depends_on 'cmake' => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'wxwidgets'
  depends_on 'openexr'
  depends_on 'exiftool'
  depends_on 'exiv2'
  depends_on 'lensfun'
  depends_on 'swig'
  depends_on 'boost'
  depends_on 'glew'

  def install
#    ENV.j1  # if your formula's build system can't parallelize
    ENV.append 'CPPFLAGS', "-I/opt/boxen/homebrew/include/OpenEXR"

    # Remove unrecognized options if warned by configure
#    system "./configure", "--disable-debug",
#                          "--disable-dependency-tracking",
#                          "--disable-silent-rules",
#                          "--prefix=#{prefix}"
    system "cmake", "-I/opt/boxen/homebrew/include/OpenEXR", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test hugin`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "--version"`.
    system "false"
  end
end
