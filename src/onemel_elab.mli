(*
 * (c) 2014 Andreas Rossberg
 *)

(* Elaboration *)

exception Error of string

val elab : Onemel_env.env -> Onemel_syntax.exp -> Onemel_types.extyp * Onemel_types.eff * Onemel_fomega.exp


(* Flags *)

val verify_flag : bool ref
val verify_fomega_flag : bool ref
