open Onemel_lambda

let rec map = function
  | VarE var ->
    let ident = Ident.create var in
    Malfunction.Mvar ident
  | PrimE (Prim.BoolV true) ->
    Malfunction.Mint (`Int 1)
  | PrimE (Prim.BoolV false) ->
    Malfunction.Mint (`Int 0)
  | PrimE (Prim.IntV n) ->
    Malfunction.Mint (`Int n)
  | PrimE (Prim.CharV chr) ->
    Malfunction.Mint (`Int (Char.code chr))
  | PrimE (Prim.TextV str) ->
    Malfunction.Mstring str
  | PrimE (Prim.FunV { Prim.name
                            ; typ
                            ; fn }) ->
    let ident = Longident.parse name in
    Malfunction.Mglobal ident
  | IfE (test, a, b) ->
    let test' = map test in
    let a' = map a in
    let b' = map b in

    Malfunction.if_ test' a' b'
  | LamE (var, exp) ->
    let ident = Ident.create var in
    let exp' = map exp in
    Mlambda ([ ident ], exp')
  | _ -> assert false
