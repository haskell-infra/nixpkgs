{ stdenv, fetchurl, bash }:

stdenv.mkDerivation rec {
  name    = "afl-${version}";
  version = "0.85b";

  src = fetchurl {
    url    = "http://lcamtuf.coredump.cx/afl/releases/${name}.tgz";
    sha256 = "010sgsjxb76bsqaw7sa5mm9r4avpf4c0bw9q2898bymfqisji033";
  };

  buildPhase   = "make PREFIX=$out";
  installPhase = "make install PREFIX=$out";

  meta = {
    description = "Powerful fuzzer via genetic algorithms and instrumentation";
    longDescription = ''
      American fuzzy lop is a fuzzer that employs a novel type of
      compile-time instrumentation and genetic algorithms to
      automatically discover clean, interesting test cases that
      trigger new internal states in the targeted binary. This
      substantially improves the functional coverage for the fuzzed
      code. The compact synthesized corpora produced by the tool are
      also useful for seeding other, more labor or resource-intensive
      testing regimes down the road.
    '';
    homepage    = "http://lcamtuf.coredump.cx/afl/";
    license     = stdenv.lib.licenses.asl20;
    platforms   = stdenv.lib.platforms.linux;
    maintainers = [ stdenv.lib.maintainers.thoughtpolice ];
  };
}
