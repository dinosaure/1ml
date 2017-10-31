(*
 * (c) 2014 Andreas Rossberg
 *)

val erase_kind : Onemel_types.kind -> Onemel_fomega.kind
val erase_typ : Onemel_types.typ -> Onemel_fomega.typ
val erase_extyp : Onemel_types.extyp -> Onemel_fomega.typ
val erase_bind :
  (Onemel_types.var * Onemel_types.kind) list -> (Onemel_fomega.var * Onemel_fomega.kind) list
val erase_env : Onemel_env.env -> Onemel_fomega.env
