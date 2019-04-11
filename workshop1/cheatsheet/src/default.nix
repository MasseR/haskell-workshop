{ stdenv
, fantasque-sans-mono
, fira-code
, fontconfig
, latinmodern-math
, lmodern
, makeFontsConf
, montserrat
, norwester-font
, pandoc
, texlive
, writeTextFile
, ncurses
, inotify-tools
}:

stdenv.mkDerivation {
  name = "cs-maker";

  buildInputs = [
    pandoc
    fontconfig
    ncurses
    (texlive.combine {
      inherit (texlive)
      scheme-small
      framed
      lm-math
      lualatex-math
      amsfonts
      amsmath
      babel
      booktabs
      ctablestack
      fancyvrb
      geometry
      hyperref
      ifluatex
      ifxetex
      latex-graphics-companion
      listings
      lm
      oberdiek
      setspace
      tools
      ulem
      xcolor
      ;
      })
  ];

  src = ./.;

  buildPhase = ''
    export HOME=$(pwd) # WTF luatex, you need a *writable* cache in HOME?
    pandoc \
      --pdf-engine=lualatex \
      --highlight-style=solarized.theme \
      --include-in-header=fonts/local.tex \
      -o cheatsheet.pdf \
      cheatsheet.md

  '';

  installPhase = ''
    mkdir -p $out
    cp cheatsheet.pdf $out
  '';

  shellHook = ''
    while true
    do
      pushd src
      pandoc \
        --pdf-engine=lualatex \
        --highlight-style=solarized.theme \
        --include-in-header=fonts/local.tex \
        -o cheatsheet.pdf \
        cheatsheet.md
      popd
      ${inotify-tools}/bin/inotifywait -e MODIFY src/cheatsheet.md
    done
  '';
}
