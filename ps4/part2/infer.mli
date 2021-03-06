(** Core functionality for the semantic analysis phase of the interpreter. *)

(** The [VarSet] module is a {{:
    http://caml.inria.fr/pub/docs/manual-ocaml/libref/Set.S.html}
    {! Set.S}} that is used to represent the set of represent the set of
    type variables that are currently in use. It is used to implement
    the [alpha_vary] function. *)
module VarSet : Set.S with type elt = Ast.id

(** [reset_type_vars] resets the values of the type variables back
    to ['a]. *)
val reset_type_vars : unit -> unit

(** [next_type_var ()] returns a fresh type variable wrapped in the
    [TVar] constructor. *)
val next_type_var : unit -> Ast.typ

(** [alpha_vary] is used to rename a type with fresh type
    variables. *)
val alpha_vary : Ast.typ -> Ast.typ

(** [type_of e] returns the type associated with the annotated
    expression [e]. *)
val type_of : Ast.aexpr -> Ast.typ

(** [type_of_pattern p] returns the type associated with the annotated
    pattern [p]. *)
val type_of_pattern : Ast.apattern -> Ast.typ

(** The [annotate] function is used to {{:
    http://en.wikipedia.org/wiki/Type_signature} type annotate} the
    expressions that are returned by the parser to ensure that they
    are semantically valid in 3110Caml. The annotated are then used to
    generate constraints for unification and type inference. The
    arguments to the in [annotate e fvs] represent {ol {li [e]
    represents the expression to be annotated.} {li [fvs] is a hash
    table containing the known free variables.}} In your
    implementation, you may also find it useful to keep track of the
    bound variables. *)
val annotate : Ast.expr -> (Ast.id, Ast.typ) Hashtbl.t -> Ast.aexpr

(** [collect] collects a list of constraints generated by an annotated
    expressions for unification. Each expression in the input list is
    processed in sequence, maintaining the total list of constraints
    collected thus far. The constraints are generated according to the
    usual semantics of OCaml. *)
val collect : Ast.aexpr list -> Ast.constr list -> Ast.constr list

(** The [infer] function combines the annotation and unification
    phases to accomplish {{:
    http://en.wikipedia.org/wiki/Type_inference} type inference} for
    3110Caml expressions. Set the [debug] variable in the [Printer]
    module to print helpful debugging information. *)
val infer : Ast.expr -> (Ast.id, Ast.typ) Hashtbl.t -> Ast.typ
