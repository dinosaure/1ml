(*
 * (c) 2014 Andreas Rossberg
 *)

(* Materialization *)

val materialize_typ : Onemel_types.typ -> Onemel_fomega.exp


(* Lifting *)

val lift : Onemel_env.env -> Onemel_types.infer ref list -> Onemel_types.infer ref list
val lift_warn :
  Onemel_source.region -> Onemel_types.typ -> Onemel_env.env -> Onemel_types.infer ref list ->
    Onemel_types.infer ref list


(* Subtyping *)

type error
exception Sub of error

val string_of_error : error -> string

val sub_typ :
  Onemel_env.env -> Onemel_types.typ -> Onemel_types.typ -> Onemel_types.typ list ->
    Onemel_types.typ list * Onemel_types.infer ref list * Onemel_fomega.exp (* raise Sub *)
val sub_extyp :
  Onemel_env.env -> Onemel_types.extyp -> Onemel_types.extyp -> Onemel_types.typ list ->
    Onemel_types.typ list * Onemel_types.infer ref list * Onemel_fomega.exp (* raise Sub *)

val equal_typ :
  Onemel_env.env -> Onemel_types.typ -> Onemel_types.typ -> Onemel_types.infer ref list (* raise Sub *)
val equal_extyp :
  Onemel_env.env -> Onemel_types.extyp -> Onemel_types.extyp -> Onemel_types.infer ref list (* raise Sub *)
