
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | WHILE
    | V
    | TRUE
    | STRING
    | SLASH
    | RETURN
    | RAT
    | PV
    | PRINT
    | PO
    | PLUS
    | PF
    | NUM
    | MULT
    | LENGTH
    | INT
    | INF
    | IF
    | ID of (
# 11 "parser.mly"
       (string)
# 29 "parser.ml"
  )
    | FALSE
    | EQUAL
    | EOF
    | ENTIER of (
# 10 "parser.mly"
       (int)
# 37 "parser.ml"
  )
    | ELSE
    | DENOM
    | CONST
    | CONCAT
    | CO
    | CHAINE of (
# 12 "parser.mly"
       (string)
# 47 "parser.ml"
  )
    | CF
    | CALL
    | BOOL
    | AO
    | AF
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState101
  | MenhirState94
  | MenhirState92
  | MenhirState87
  | MenhirState85
  | MenhirState80
  | MenhirState75
  | MenhirState64
  | MenhirState61
  | MenhirState59
  | MenhirState58
  | MenhirState55
  | MenhirState53
  | MenhirState49
  | MenhirState47
  | MenhirState44
  | MenhirState41
  | MenhirState38
  | MenhirState35
  | MenhirState32
  | MenhirState25
  | MenhirState20
  | MenhirState19
  | MenhirState15
  | MenhirState14
  | MenhirState10
  | MenhirState9
  | MenhirState8
  | MenhirState6
  | MenhirState5
  | MenhirState4
  | MenhirState0

# 3 "parser.mly"
  

open Type
open Ast.AstSyntax

# 109 "parser.ml"

let rec _menhir_goto_prog : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 46 "parser.mly"
      (programme)
# 114 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state * (
# 46 "parser.mly"
      (programme)
# 124 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv363 * _menhir_state * (
# 46 "parser.mly"
      (programme)
# 134 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv361 * _menhir_state * (
# 46 "parser.mly"
      (programme)
# 140 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (lfi : (
# 46 "parser.mly"
      (programme)
# 145 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 57 "parser.mly"
       (Ast.AstSyntax.programme)
# 151 "parser.ml"
            ) = 
# 61 "parser.mly"
                          (lfi)
# 155 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv359) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 57 "parser.mly"
       (Ast.AstSyntax.programme)
# 163 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv357) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 57 "parser.mly"
       (Ast.AstSyntax.programme)
# 171 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv355) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 57 "parser.mly"
       (Ast.AstSyntax.programme)
# 179 "parser.ml"
            )) : (
# 57 "parser.mly"
       (Ast.AstSyntax.programme)
# 183 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv356)) : 'freshtv358)) : 'freshtv360)) : 'freshtv362)) : 'freshtv364)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv365 * _menhir_state * (
# 46 "parser.mly"
      (programme)
# 193 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)) : 'freshtv368)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv371 * _menhir_state * (
# 48 "parser.mly"
      (fonction)
# 202 "parser.ml"
        )) * _menhir_state * (
# 46 "parser.mly"
      (programme)
# 206 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv369 * _menhir_state * (
# 48 "parser.mly"
      (fonction)
# 212 "parser.ml"
        )) * _menhir_state * (
# 46 "parser.mly"
      (programme)
# 216 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (lf : (
# 48 "parser.mly"
      (fonction)
# 221 "parser.ml"
        ))), _, (lfi : (
# 46 "parser.mly"
      (programme)
# 225 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 46 "parser.mly"
      (programme)
# 230 "parser.ml"
        ) = 
# 64 "parser.mly"
                          (let (Programme (lf1,li))=lfi in (Programme (lf::lf1,li)))
# 234 "parser.ml"
         in
        _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)) : 'freshtv372)
    | _ ->
        _menhir_fail ()

and _menhir_goto_fonc : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 48 "parser.mly"
      (fonction)
# 243 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv353 * _menhir_state * (
# 48 "parser.mly"
      (fonction)
# 251 "parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | INT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | RAT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | STRING ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101) : 'freshtv354)

and _menhir_goto_cp : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 54 "parser.mly"
      (expression list)
# 274 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343 * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 284 "parser.ml"
        )) * _menhir_state * (
# 54 "parser.mly"
      (expression list)
# 288 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv341 * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 294 "parser.ml"
        )) * _menhir_state * (
# 54 "parser.mly"
      (expression list)
# 298 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (e1 : (
# 53 "parser.mly"
      (expression)
# 303 "parser.ml"
        ))), _, (le : (
# 54 "parser.mly"
      (expression list)
# 307 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 54 "parser.mly"
      (expression list)
# 312 "parser.ml"
        ) = 
# 115 "parser.mly"
                (e1::le)
# 316 "parser.ml"
         in
        _menhir_goto_cp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)) : 'freshtv344)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv351 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 324 "parser.ml"
        ))) * _menhir_state * (
# 54 "parser.mly"
      (expression list)
# 328 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv347 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 338 "parser.ml"
            ))) * _menhir_state * (
# 54 "parser.mly"
      (expression list)
# 342 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv345 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 349 "parser.ml"
            ))) * _menhir_state * (
# 54 "parser.mly"
      (expression list)
# 353 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (n : (
# 11 "parser.mly"
       (string)
# 358 "parser.ml"
            ))), _, (lp : (
# 54 "parser.mly"
      (expression list)
# 362 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 53 "parser.mly"
      (expression)
# 370 "parser.ml"
            ) = 
# 97 "parser.mly"
                          (AppelFonction (n,lp))
# 374 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)) : 'freshtv348)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv349 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 384 "parser.ml"
            ))) * _menhir_state * (
# 54 "parser.mly"
      (expression list)
# 388 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv350)) : 'freshtv352)
    | _ ->
        _menhir_fail ()

and _menhir_goto_is : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 49 "parser.mly"
      (instruction list)
# 398 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv329 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 408 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv325 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 418 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv323 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 425 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (li : (
# 49 "parser.mly"
      (instruction list)
# 430 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 47 "parser.mly"
      (instruction list)
# 437 "parser.ml"
            ) = 
# 71 "parser.mly"
                          (li)
# 441 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv321) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 47 "parser.mly"
      (instruction list)
# 449 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            match _menhir_s with
            | MenhirState53 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv305 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 458 "parser.ml"
                )) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 462 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv303 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 468 "parser.ml"
                )) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 472 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (exp : (
# 53 "parser.mly"
      (expression)
# 477 "parser.ml"
                ))), _, (li : (
# 47 "parser.mly"
      (instruction list)
# 481 "parser.ml"
                ))) = _menhir_stack in
                let _1 = () in
                let _v : (
# 50 "parser.mly"
      (instruction)
# 487 "parser.ml"
                ) = 
# 83 "parser.mly"
                                    (TantQue (exp,li))
# 491 "parser.ml"
                 in
                _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v) : 'freshtv304)) : 'freshtv306)
            | MenhirState59 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv311 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 499 "parser.ml"
                )) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 503 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ELSE ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv307 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 513 "parser.ml"
                    )) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 517 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | AO ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState61
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61) : 'freshtv308)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv309 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 535 "parser.ml"
                    )) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 539 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)) : 'freshtv312)
            | MenhirState61 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv315 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 548 "parser.ml"
                )) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 552 "parser.ml"
                ))) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 556 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv313 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 562 "parser.ml"
                )) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 566 "parser.ml"
                ))) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 570 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((((_menhir_stack, _menhir_s), _, (exp : (
# 53 "parser.mly"
      (expression)
# 575 "parser.ml"
                ))), _, (li1 : (
# 47 "parser.mly"
      (instruction list)
# 579 "parser.ml"
                ))), _, (li2 : (
# 47 "parser.mly"
      (instruction list)
# 583 "parser.ml"
                ))) = _menhir_stack in
                let _4 = () in
                let _1 = () in
                let _v : (
# 50 "parser.mly"
      (instruction)
# 590 "parser.ml"
                ) = 
# 82 "parser.mly"
                                    (Conditionnelle (exp,li1,li2))
# 594 "parser.ml"
                 in
                _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)) : 'freshtv316)
            | MenhirState4 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv319 * _menhir_state * (
# 11 "parser.mly"
       (string)
# 602 "parser.ml"
                )) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 606 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv317 * _menhir_state * (
# 11 "parser.mly"
       (string)
# 612 "parser.ml"
                )) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 616 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 11 "parser.mly"
       (string)
# 621 "parser.ml"
                ))), _, (li : (
# 47 "parser.mly"
      (instruction list)
# 625 "parser.ml"
                ))) = _menhir_stack in
                let _v : (
# 46 "parser.mly"
      (programme)
# 630 "parser.ml"
                ) = 
# 65 "parser.mly"
                          (Programme ([],li))
# 634 "parser.ml"
                 in
                _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv318)) : 'freshtv320)
            | _ ->
                _menhir_fail ()) : 'freshtv322)) : 'freshtv324)) : 'freshtv326)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv327 * _menhir_state) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 646 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)) : 'freshtv330)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv333 * _menhir_state * (
# 50 "parser.mly"
      (instruction)
# 655 "parser.ml"
        )) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 659 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv331 * _menhir_state * (
# 50 "parser.mly"
      (instruction)
# 665 "parser.ml"
        )) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 669 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (i1 : (
# 50 "parser.mly"
      (instruction)
# 674 "parser.ml"
        ))), _, (li : (
# 49 "parser.mly"
      (instruction list)
# 678 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 49 "parser.mly"
      (instruction list)
# 683 "parser.ml"
        ) = 
# 75 "parser.mly"
                          (i1::li)
# 687 "parser.ml"
         in
        _menhir_goto_is _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)) : 'freshtv334)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv339 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 695 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 699 "parser.ml"
        ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 703 "parser.ml"
        )))) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 707 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RETURN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv335 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 717 "parser.ml"
            )) * (
# 11 "parser.mly"
       (string)
# 721 "parser.ml"
            ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 725 "parser.ml"
            )))) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 729 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CALL ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | CHAINE _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
            | CO ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | DENOM ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | ENTIER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
            | FALSE ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | ID _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
            | LENGTH ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | NUM ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | PO ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | TRUE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv336)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv337 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 767 "parser.ml"
            )) * (
# 11 "parser.mly"
       (string)
# 771 "parser.ml"
            ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 775 "parser.ml"
            )))) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 779 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)) : 'freshtv340)
    | _ ->
        _menhir_fail ()

and _menhir_goto_i : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 50 "parser.mly"
      (instruction)
# 789 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv301 * _menhir_state * (
# 50 "parser.mly"
      (instruction)
# 797 "parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | CONST ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | ID _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
    | IF ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | INT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | PRINT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | RAT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | STRING ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | WHILE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | AF | RETURN ->
        _menhir_reduce30 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv302)

and _menhir_goto_dp : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 52 "parser.mly"
      ((typ*string) list)
# 830 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv285 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 840 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 844 "parser.ml"
        )) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 848 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv283 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 854 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 858 "parser.ml"
        )) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 862 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (t : (
# 51 "parser.mly"
      (typ)
# 867 "parser.ml"
        ))), (n : (
# 11 "parser.mly"
       (string)
# 871 "parser.ml"
        ))), _, (lp : (
# 52 "parser.mly"
      ((typ*string) list)
# 875 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 52 "parser.mly"
      ((typ*string) list)
# 880 "parser.ml"
        ) = 
# 87 "parser.mly"
                          ((t,n)::lp)
# 884 "parser.ml"
         in
        _menhir_goto_dp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv284)) : 'freshtv286)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv299 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 892 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 896 "parser.ml"
        ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 900 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv295 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 910 "parser.ml"
            )) * (
# 11 "parser.mly"
       (string)
# 914 "parser.ml"
            ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 918 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv287 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 928 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 932 "parser.ml"
                ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 936 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOL ->
                    _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState92
                | CONST ->
                    _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState92
                | ID _v ->
                    _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
                | IF ->
                    _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState92
                | INT ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState92
                | PRINT ->
                    _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState92
                | RAT ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState92
                | STRING ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState92
                | WHILE ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState92
                | RETURN ->
                    _menhir_reduce30 _menhir_env (Obj.magic _menhir_stack) MenhirState92
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92) : 'freshtv288)
            | PV ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv291 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 970 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 974 "parser.ml"
                ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 978 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv289 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 985 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 989 "parser.ml"
                ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 993 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s, (t : (
# 51 "parser.mly"
      (typ)
# 998 "parser.ml"
                ))), (n : (
# 11 "parser.mly"
       (string)
# 1002 "parser.ml"
                ))), _, (p : (
# 52 "parser.mly"
      ((typ*string) list)
# 1006 "parser.ml"
                ))) = _menhir_stack in
                let _6 = () in
                let _5 = () in
                let _3 = () in
                let _v : (
# 48 "parser.mly"
      (fonction)
# 1014 "parser.ml"
                ) = 
# 69 "parser.mly"
                          (Prototype(t,n,p))
# 1018 "parser.ml"
                 in
                _menhir_goto_fonc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv290)) : 'freshtv292)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv293 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 1028 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 1032 "parser.ml"
                ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 1036 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)) : 'freshtv296)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv297 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 1047 "parser.ml"
            )) * (
# 11 "parser.mly"
       (string)
# 1051 "parser.ml"
            ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 1055 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)) : 'freshtv300)
    | _ ->
        _menhir_fail ()

and _menhir_goto_e : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 53 "parser.mly"
      (expression)
# 1065 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState20 | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1075 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CALL ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | CHAINE _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | CO ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | DENOM ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | ENTIER _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | FALSE ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | ID _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | LENGTH ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | NUM ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | PO ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | TRUE ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | PF ->
            _menhir_reduce2 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv142)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv147 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1113 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLASH ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv143 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1123 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CALL ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | CHAINE _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
            | CO ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | DENOM ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | ENTIER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
            | FALSE ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | ID _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
            | LENGTH ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | NUM ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | PO ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | TRUE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25) : 'freshtv144)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv145 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1161 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)) : 'freshtv148)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv155 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1170 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1174 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv151 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1184 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1188 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv149 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1195 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1199 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 1204 "parser.ml"
            ))), _, (e2 : (
# 53 "parser.mly"
      (expression)
# 1208 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 53 "parser.mly"
      (expression)
# 1216 "parser.ml"
            ) = 
# 98 "parser.mly"
                          (Rationnel(e1,e2))
# 1220 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)) : 'freshtv152)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv153 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1230 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1234 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)) : 'freshtv156)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1243 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv157 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1249 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 1254 "parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 53 "parser.mly"
      (expression)
# 1260 "parser.ml"
        ) = 
# 100 "parser.mly"
                          (Denominateur e1)
# 1264 "parser.ml"
         in
        _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)) : 'freshtv160)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1272 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1278 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (n : (
# 53 "parser.mly"
      (expression)
# 1283 "parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 53 "parser.mly"
      (expression)
# 1289 "parser.ml"
        ) = 
# 101 "parser.mly"
                          (Taille n)
# 1293 "parser.ml"
         in
        _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv162)) : 'freshtv164)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1301 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv165 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1307 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 1312 "parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 53 "parser.mly"
      (expression)
# 1318 "parser.ml"
        ) = 
# 99 "parser.mly"
                          (Numerateur e1)
# 1322 "parser.ml"
         in
        _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv166)) : 'freshtv168)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1330 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv169 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1340 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CALL ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | CHAINE _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
            | CO ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | DENOM ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | ENTIER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
            | FALSE ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | ID _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
            | LENGTH ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | NUM ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | PO ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | TRUE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv170)
        | CONCAT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv171 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1376 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CALL ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | CHAINE _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | CO ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | DENOM ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | ENTIER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | FALSE ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | ID _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | LENGTH ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | NUM ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | PO ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | TRUE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv172)
        | EQUAL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv173 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1412 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CALL ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | CHAINE _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | CO ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | DENOM ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | ENTIER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | FALSE ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | ID _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | LENGTH ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | NUM ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | PO ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | TRUE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv174)
        | INF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv175 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1448 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CALL ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | CHAINE _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
            | CO ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | DENOM ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | ENTIER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
            | FALSE ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | ID _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
            | LENGTH ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | NUM ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | PO ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | TRUE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv176)
        | MULT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv177 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1484 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CALL ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | CHAINE _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | CO ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | DENOM ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | ENTIER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | FALSE ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | ID _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | LENGTH ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | NUM ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | PO ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | TRUE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv178)
        | PLUS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv179 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1520 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CALL ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | CHAINE _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
            | CO ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | DENOM ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | ENTIER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
            | FALSE ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | ID _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
            | LENGTH ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | NUM ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | PO ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | TRUE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv180)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv181 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1558 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)) : 'freshtv184)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv191 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1567 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1571 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv187 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1581 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1585 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv185 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1592 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1596 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 1601 "parser.ml"
            ))), _, (e2 : (
# 53 "parser.mly"
      (expression)
# 1605 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 53 "parser.mly"
      (expression)
# 1613 "parser.ml"
            ) = 
# 108 "parser.mly"
                          (Binaire (Plus,e1,e2))
# 1617 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv186)) : 'freshtv188)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv189 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1627 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1631 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)) : 'freshtv192)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv199 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1640 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1644 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv195 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1654 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1658 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv193 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1665 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1669 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 1674 "parser.ml"
            ))), _, (e2 : (
# 53 "parser.mly"
      (expression)
# 1678 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 53 "parser.mly"
      (expression)
# 1686 "parser.ml"
            ) = 
# 109 "parser.mly"
                          (Binaire (Mult,e1,e2))
# 1690 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv194)) : 'freshtv196)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv197 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1700 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1704 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)) : 'freshtv200)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv207 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1713 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1717 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv203 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1727 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1731 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv201 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1738 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1742 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 1747 "parser.ml"
            ))), _, (e2 : (
# 53 "parser.mly"
      (expression)
# 1751 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 53 "parser.mly"
      (expression)
# 1759 "parser.ml"
            ) = 
# 111 "parser.mly"
                          (Binaire (Inf,e1,e2))
# 1763 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv202)) : 'freshtv204)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv205 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1773 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1777 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)) : 'freshtv208)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv215 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1786 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1790 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv211 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1800 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1804 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv209 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1811 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1815 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 1820 "parser.ml"
            ))), _, (e2 : (
# 53 "parser.mly"
      (expression)
# 1824 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 53 "parser.mly"
      (expression)
# 1832 "parser.ml"
            ) = 
# 110 "parser.mly"
                          (Binaire (Equ,e1,e2))
# 1836 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv210)) : 'freshtv212)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv213 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1846 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1850 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)) : 'freshtv216)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv223 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1859 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1863 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv219 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1873 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1877 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv217 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1884 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1888 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 1893 "parser.ml"
            ))), _, (e2 : (
# 53 "parser.mly"
      (expression)
# 1897 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 53 "parser.mly"
      (expression)
# 1905 "parser.ml"
            ) = 
# 107 "parser.mly"
                          (Binaire (Concat,e1,e2))
# 1909 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv218)) : 'freshtv220)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv221 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1919 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1923 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)) : 'freshtv224)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv229 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1932 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1936 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | V ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv225 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1946 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1950 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CALL ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState49
            | CHAINE _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
            | CO ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState49
            | DENOM ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState49
            | ENTIER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
            | FALSE ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState49
            | ID _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
            | LENGTH ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState49
            | NUM ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState49
            | PO ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState49
            | TRUE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState49
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv226)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv227 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1988 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 1992 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)) : 'freshtv230)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv241 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2001 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2005 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2009 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv237 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2019 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2023 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2027 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | PF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv233 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2037 "parser.ml"
                ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2041 "parser.ml"
                ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2045 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv231 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2052 "parser.ml"
                ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2056 "parser.ml"
                ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2060 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let ((((_menhir_stack, _menhir_s), _, (n : (
# 53 "parser.mly"
      (expression)
# 2065 "parser.ml"
                ))), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 2069 "parser.ml"
                ))), _, (e2 : (
# 53 "parser.mly"
      (expression)
# 2073 "parser.ml"
                ))) = _menhir_stack in
                let _8 = () in
                let _7 = () in
                let _5 = () in
                let _3 = () in
                let _1 = () in
                let _v : (
# 53 "parser.mly"
      (expression)
# 2083 "parser.ml"
                ) = 
# 96 "parser.mly"
                              (SousChaine(n,e1,e2))
# 2087 "parser.ml"
                 in
                _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv232)) : 'freshtv234)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv235 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2097 "parser.ml"
                ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2101 "parser.ml"
                ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2105 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)) : 'freshtv238)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv239 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2116 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2120 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2124 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)) : 'freshtv242)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv243 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2133 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AO ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv244)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv251 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2149 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv247 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2159 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv245 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2166 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 2171 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 50 "parser.mly"
      (instruction)
# 2178 "parser.ml"
            ) = 
# 81 "parser.mly"
                                    (Affichage (e1))
# 2182 "parser.ml"
             in
            _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v) : 'freshtv246)) : 'freshtv248)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv249 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2192 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)) : 'freshtv252)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2201 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AO ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv254)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv261 * _menhir_state * (
# 11 "parser.mly"
       (string)
# 2217 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2221 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv257 * _menhir_state * (
# 11 "parser.mly"
       (string)
# 2231 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2235 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv255 * _menhir_state * (
# 11 "parser.mly"
       (string)
# 2242 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2246 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (n : (
# 11 "parser.mly"
       (string)
# 2251 "parser.ml"
            ))), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 2255 "parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (
# 50 "parser.mly"
      (instruction)
# 2262 "parser.ml"
            ) = 
# 79 "parser.mly"
                                    (Affectation (n,e1))
# 2266 "parser.ml"
             in
            _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)) : 'freshtv258)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv259 * _menhir_state * (
# 11 "parser.mly"
       (string)
# 2276 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2280 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)) : 'freshtv262)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv269 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 2289 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 2293 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2297 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv265 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 2307 "parser.ml"
            )) * (
# 11 "parser.mly"
       (string)
# 2311 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2315 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv263 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 2322 "parser.ml"
            )) * (
# 11 "parser.mly"
       (string)
# 2326 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2330 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (t : (
# 51 "parser.mly"
      (typ)
# 2335 "parser.ml"
            ))), (n : (
# 11 "parser.mly"
       (string)
# 2339 "parser.ml"
            ))), _, (e1 : (
# 53 "parser.mly"
      (expression)
# 2343 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _v : (
# 50 "parser.mly"
      (instruction)
# 2350 "parser.ml"
            ) = 
# 78 "parser.mly"
                                    (Declaration (t,n,e1))
# 2354 "parser.ml"
             in
            _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v) : 'freshtv264)) : 'freshtv266)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv267 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 2364 "parser.ml"
            )) * (
# 11 "parser.mly"
       (string)
# 2368 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2372 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)) : 'freshtv270)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv281 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 2381 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 2385 "parser.ml"
        ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 2389 "parser.ml"
        )))) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 2393 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2397 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv277 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 2407 "parser.ml"
            )) * (
# 11 "parser.mly"
       (string)
# 2411 "parser.ml"
            ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 2415 "parser.ml"
            )))) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 2419 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2423 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv273 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 2433 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 2437 "parser.ml"
                ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 2441 "parser.ml"
                )))) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 2445 "parser.ml"
                ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2449 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv271 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 2456 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 2460 "parser.ml"
                ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 2464 "parser.ml"
                )))) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 2468 "parser.ml"
                ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2472 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let (((((_menhir_stack, _menhir_s, (t : (
# 51 "parser.mly"
      (typ)
# 2477 "parser.ml"
                ))), (n : (
# 11 "parser.mly"
       (string)
# 2481 "parser.ml"
                ))), _, (p : (
# 52 "parser.mly"
      ((typ*string) list)
# 2485 "parser.ml"
                ))), _, (li : (
# 49 "parser.mly"
      (instruction list)
# 2489 "parser.ml"
                ))), _, (exp : (
# 53 "parser.mly"
      (expression)
# 2493 "parser.ml"
                ))) = _menhir_stack in
                let _11 = () in
                let _10 = () in
                let _8 = () in
                let _6 = () in
                let _5 = () in
                let _3 = () in
                let _v : (
# 48 "parser.mly"
      (fonction)
# 2504 "parser.ml"
                ) = 
# 68 "parser.mly"
                                                   (Fonction(t,n,p,li,exp))
# 2508 "parser.ml"
                 in
                _menhir_goto_fonc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv272)) : 'freshtv274)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv275 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 2518 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 2522 "parser.ml"
                ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 2526 "parser.ml"
                )))) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 2530 "parser.ml"
                ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2534 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)) : 'freshtv278)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv279 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 2545 "parser.ml"
            )) * (
# 11 "parser.mly"
       (string)
# 2549 "parser.ml"
            ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 2553 "parser.ml"
            )))) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 2557 "parser.ml"
            ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 2561 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)) : 'freshtv282)
    | _ ->
        _menhir_fail ()

and _menhir_reduce2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 54 "parser.mly"
      (expression list)
# 2573 "parser.ml"
    ) = 
# 114 "parser.mly"
                ([])
# 2577 "parser.ml"
     in
    _menhir_goto_cp _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce30 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 49 "parser.mly"
      (instruction list)
# 2586 "parser.ml"
    ) = 
# 74 "parser.mly"
                          ([])
# 2590 "parser.ml"
     in
    _menhir_goto_is _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | CHAINE _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | CO ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | DENOM ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | ENTIER _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | FALSE ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | ID _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | LENGTH ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | NUM ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | PO ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | TRUE ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | CHAINE _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | CO ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | DENOM ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | ENTIER _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | FALSE ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | ID _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | LENGTH ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | NUM ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | PO ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | TRUE ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | CHAINE _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | CO ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | DENOM ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | ENTIER _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | FALSE ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | ID _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | LENGTH ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | NUM ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | PO ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | TRUE ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 2696 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQUAL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * (
# 11 "parser.mly"
       (string)
# 2708 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CALL ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | CHAINE _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | CO ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | DENOM ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | ENTIER _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | FALSE ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | ID _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | LENGTH ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | NUM ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | PO ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | TRUE ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64) : 'freshtv138)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state * (
# 11 "parser.mly"
       (string)
# 2746 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 11 "parser.mly"
       (string)
# 2763 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv129 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 2774 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ENTIER _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv125 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 2784 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                let (_v : (
# 10 "parser.mly"
       (int)
# 2789 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PV ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv121 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 2800 "parser.ml"
                    ))) * (
# 10 "parser.mly"
       (int)
# 2804 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv119 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 2811 "parser.ml"
                    ))) * (
# 10 "parser.mly"
       (int)
# 2815 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), (n : (
# 11 "parser.mly"
       (string)
# 2820 "parser.ml"
                    ))), (e : (
# 10 "parser.mly"
       (int)
# 2824 "parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : (
# 50 "parser.mly"
      (instruction)
# 2832 "parser.ml"
                    ) = 
# 80 "parser.mly"
                                    (Constante (n,e))
# 2836 "parser.ml"
                     in
                    _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v) : 'freshtv120)) : 'freshtv122)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv123 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 2846 "parser.ml"
                    ))) * (
# 10 "parser.mly"
       (int)
# 2850 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)) : 'freshtv126)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv127 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 2861 "parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)) : 'freshtv130)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv131 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 2872 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)) : 'freshtv134)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_reduce4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 52 "parser.mly"
      ((typ*string) list)
# 2894 "parser.ml"
    ) = 
# 86 "parser.mly"
                          ([])
# 2898 "parser.ml"
     in
    _menhir_goto_dp _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv117) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 53 "parser.mly"
      (expression)
# 2912 "parser.ml"
    ) = 
# 103 "parser.mly"
                          (True)
# 2916 "parser.ml"
     in
    _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv118)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | CHAINE _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | CO ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | DENOM ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | ENTIER _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | FALSE ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | ID _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | LENGTH ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | NUM ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | PO ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | TRUE ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | CHAINE _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | CO ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | DENOM ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | ENTIER _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | FALSE ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | ID _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | LENGTH ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | NUM ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | PO ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | TRUE ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | CHAINE _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | CO ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | DENOM ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | ENTIER _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | FALSE ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | ID _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | LENGTH ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | NUM ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | PO ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | TRUE ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 3022 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv115) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 11 "parser.mly"
       (string)
# 3032 "parser.ml"
    )) : (
# 11 "parser.mly"
       (string)
# 3036 "parser.ml"
    )) = _v in
    ((let _v : (
# 53 "parser.mly"
      (expression)
# 3041 "parser.ml"
    ) = 
# 102 "parser.mly"
                          (Ident n)
# 3045 "parser.ml"
     in
    _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv116)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv113) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 53 "parser.mly"
      (expression)
# 3059 "parser.ml"
    ) = 
# 104 "parser.mly"
                          (False)
# 3063 "parser.ml"
     in
    _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv114)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 10 "parser.mly"
       (int)
# 3070 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv111) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((e : (
# 10 "parser.mly"
       (int)
# 3080 "parser.ml"
    )) : (
# 10 "parser.mly"
       (int)
# 3084 "parser.ml"
    )) = _v in
    ((let _v : (
# 53 "parser.mly"
      (expression)
# 3089 "parser.ml"
    ) = 
# 105 "parser.mly"
                          (Entier e)
# 3093 "parser.ml"
     in
    _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | CHAINE _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | CO ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | DENOM ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | ENTIER _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | FALSE ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | ID _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | LENGTH ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | NUM ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | PO ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | TRUE ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | CHAINE _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | CO ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | DENOM ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | ENTIER _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | FALSE ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | ID _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | LENGTH ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NUM ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | PO ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | TRUE ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (string)
# 3166 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((e : (
# 12 "parser.mly"
       (string)
# 3176 "parser.ml"
    )) : (
# 12 "parser.mly"
       (string)
# 3180 "parser.ml"
    )) = _v in
    ((let _v : (
# 53 "parser.mly"
      (expression)
# 3185 "parser.ml"
    ) = 
# 106 "parser.mly"
                          (Chaine e)
# 3189 "parser.ml"
     in
    _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 11 "parser.mly"
       (string)
# 3205 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv101 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 3216 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CALL ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | CHAINE _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | CO ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | DENOM ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | ENTIER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | FALSE ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | ID _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | LENGTH ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | NUM ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | PO ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | TRUE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | PF ->
                _menhir_reduce2 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19) : 'freshtv102)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv103 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 3256 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)) : 'freshtv106)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | CONST ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | ID _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | IF ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | INT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | PRINT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | RAT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | STRING ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | WHILE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | AF ->
        _menhir_reduce30 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 51 "parser.mly"
      (typ)
# 3302 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState92 | MenhirState80 | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3312 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ID _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv79 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3322 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_v : (
# 11 "parser.mly"
       (string)
# 3327 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EQUAL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv75 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3338 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 3342 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | CALL ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | CHAINE _v ->
                    _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
                | CO ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | DENOM ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | ENTIER _v ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
                | FALSE ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | ID _v ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
                | LENGTH ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | NUM ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | PO ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | TRUE ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv76)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv77 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3380 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 3384 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)) : 'freshtv80)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv81 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3395 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)) : 'freshtv84)
    | MenhirState101 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3404 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ID _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv89 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3414 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_v : (
# 11 "parser.mly"
       (string)
# 3419 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | PO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv85 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3430 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 3434 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOL ->
                    _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | INT ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | RAT ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | STRING ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | PF ->
                    _menhir_reduce4 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv86)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv87 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3460 "parser.ml"
                )) * (
# 11 "parser.mly"
       (string)
# 3464 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)) : 'freshtv90)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv91 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3475 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)) : 'freshtv94)
    | MenhirState87 | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3484 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ID _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv95 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3494 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_v : (
# 11 "parser.mly"
       (string)
# 3499 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | INT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | RAT ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | STRING ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | PF ->
                _menhir_reduce4 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87) : 'freshtv96)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv97 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3526 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)) : 'freshtv100)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state * (
# 48 "parser.mly"
      (fonction)
# 3541 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv13 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3550 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 3554 "parser.ml"
        ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 3558 "parser.ml"
        )))) * _menhir_state * (
# 49 "parser.mly"
      (instruction list)
# 3562 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv15 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3571 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 3575 "parser.ml"
        ))) * _menhir_state * (
# 52 "parser.mly"
      ((typ*string) list)
# 3579 "parser.ml"
        )))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv17 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3588 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 3592 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv19 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3601 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 3605 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * (
# 50 "parser.mly"
      (instruction)
# 3614 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv23 * _menhir_state * (
# 51 "parser.mly"
      (typ)
# 3623 "parser.ml"
        )) * (
# 11 "parser.mly"
       (string)
# 3627 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv25 * _menhir_state * (
# 11 "parser.mly"
       (string)
# 3636 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv27 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3645 "parser.ml"
        )) * _menhir_state * (
# 47 "parser.mly"
      (instruction list)
# 3649 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3658 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv35 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3677 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv37 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3686 "parser.ml"
        ))) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3690 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3699 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3708 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv43 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3717 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3726 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv47 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3735 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv49 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3744 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state) * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3753 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state * (
# 53 "parser.mly"
      (expression)
# 3762 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv55 * _menhir_state) * (
# 11 "parser.mly"
       (string)
# 3771 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * (
# 11 "parser.mly"
       (string)
# 3815 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv74)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 51 "parser.mly"
      (typ)
# 3834 "parser.ml"
    ) = 
# 93 "parser.mly"
          (Str)
# 3838 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv10)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 51 "parser.mly"
      (typ)
# 3852 "parser.ml"
    ) = 
# 92 "parser.mly"
          (Rat)
# 3856 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 51 "parser.mly"
      (typ)
# 3870 "parser.ml"
    ) = 
# 91 "parser.mly"
          (Int)
# 3874 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 3881 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AO ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4

and _menhir_run72 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 51 "parser.mly"
      (typ)
# 3905 "parser.ml"
    ) = 
# 90 "parser.mly"
          (Bool)
# 3909 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 57 "parser.mly"
       (Ast.AstSyntax.programme)
# 3928 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | INT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | RAT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRING ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 233 "/home/phosphore/.opam/system/lib/menhir/standard.mly"
  

# 3965 "parser.ml"
