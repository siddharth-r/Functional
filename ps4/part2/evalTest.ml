(** Constants **)

(**Test Binary operators**)

(**Test Unary operators**)

(**Test Var operators**)


(**Test Cons operators**)

(**Test IfThenElse operators**)

(**Test Let operators**)

(**Test LetRec operators**)
let rec fib n = if n = 0 || n = 1 then n else fib (n-1) + fib (n-2)
1 1 2 3 5 8

(**Test App operators**)

(**Test Match operators**)

let m = [ [1;2;3] ; [4;5;6] ; [7;8;9]] in 
let x = 5 in
let v = match 7 with
		|x -> x + 2


let v = match m with
		| x :: tl -> (match x with 
					  hd :: tl -> hd) in
if v = 1 then (x+v) else 0



let x = 5
let v = match 70 with 
		| x -> 6


