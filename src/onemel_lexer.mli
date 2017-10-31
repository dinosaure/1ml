(*
 * (c) 2014 Andreas Rossberg
 *)

val convert_pos : Lexing.position -> Onemel_source.pos

val token : Lexing.lexbuf -> Onemel_parser.token  (* raises Source.Error *)
