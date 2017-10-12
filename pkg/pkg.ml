#!/usr/bin/env ocaml

#directory "pkg";;
#use       "topfind";;
#require   "topkg";;

open Topkg

let opam =
  Pkg.opam_file
    ~lint_deps_excluding:(Some [ "ocamlbuild"; "topkg"; "ocaml"; "ocamlfind"; ])
    "opam"

let () =
  Pkg.describe ~opams:[opam] "onemel" @@ fun c ->

  Ok [ Pkg.doc "README.md"
     ; Pkg.doc "LICENSE.md"
     ; Pkg.mllib ~api:["Onemel"] "src/onemel.mllib"
     ; Pkg.bin "bin/repl" ~dst:"repl" ]
