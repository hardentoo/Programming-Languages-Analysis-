{-# OPTIONS_GHC -w #-}
module Parse where
import Common
import Data.Maybe
import Data.Char

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t6 t7 t11 t12 t13 t14 t15
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 (LamTerm)
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15

action_0 (18) = happyShift action_12
action_0 (20) = happyShift action_13
action_0 (23) = happyShift action_14
action_0 (25) = happyShift action_5
action_0 (26) = happyShift action_15
action_0 (30) = happyShift action_16
action_0 (31) = happyShift action_17
action_0 (32) = happyShift action_18
action_0 (6) = happyGoto action_21
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_22
action_0 (9) = happyGoto action_7
action_0 (10) = happyGoto action_8
action_0 (13) = happyGoto action_9
action_0 (14) = happyGoto action_10
action_0 (15) = happyGoto action_11
action_0 _ = happyFail

action_1 (25) = happyShift action_5
action_1 (7) = happyGoto action_19
action_1 (12) = happyGoto action_20
action_1 _ = happyReduce_22

action_2 (18) = happyShift action_12
action_2 (20) = happyShift action_13
action_2 (23) = happyShift action_14
action_2 (26) = happyShift action_15
action_2 (30) = happyShift action_16
action_2 (31) = happyShift action_17
action_2 (32) = happyShift action_18
action_2 (8) = happyGoto action_6
action_2 (9) = happyGoto action_7
action_2 (10) = happyGoto action_8
action_2 (13) = happyGoto action_9
action_2 (14) = happyGoto action_10
action_2 (15) = happyGoto action_11
action_2 _ = happyFail

action_3 (25) = happyShift action_5
action_3 (7) = happyGoto action_4
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (23) = happyShift action_32
action_5 _ = happyFail

action_6 (28) = happyShift action_23
action_6 (34) = happyAccept
action_6 _ = happyFail

action_7 (20) = happyShift action_31
action_7 (23) = happyShift action_14
action_7 (30) = happyShift action_16
action_7 (10) = happyGoto action_30
action_7 _ = happyReduce_7

action_8 _ = happyReduce_12

action_9 _ = happyReduce_8

action_10 _ = happyReduce_9

action_11 _ = happyReduce_10

action_12 (23) = happyShift action_29
action_12 _ = happyFail

action_13 (18) = happyShift action_12
action_13 (20) = happyShift action_13
action_13 (23) = happyShift action_14
action_13 (26) = happyShift action_15
action_13 (30) = happyShift action_16
action_13 (31) = happyShift action_17
action_13 (32) = happyShift action_18
action_13 (8) = happyGoto action_28
action_13 (9) = happyGoto action_7
action_13 (10) = happyGoto action_8
action_13 (13) = happyGoto action_9
action_13 (14) = happyGoto action_10
action_13 (15) = happyGoto action_11
action_13 _ = happyFail

action_14 _ = happyReduce_13

action_15 (23) = happyShift action_27
action_15 _ = happyFail

action_16 _ = happyReduce_14

action_17 (18) = happyShift action_12
action_17 (20) = happyShift action_13
action_17 (23) = happyShift action_14
action_17 (26) = happyShift action_15
action_17 (30) = happyShift action_16
action_17 (31) = happyShift action_17
action_17 (32) = happyShift action_18
action_17 (8) = happyGoto action_26
action_17 (9) = happyGoto action_7
action_17 (10) = happyGoto action_8
action_17 (13) = happyGoto action_9
action_17 (14) = happyGoto action_10
action_17 (15) = happyGoto action_11
action_17 _ = happyFail

action_18 (18) = happyShift action_12
action_18 (20) = happyShift action_13
action_18 (23) = happyShift action_14
action_18 (26) = happyShift action_15
action_18 (30) = happyShift action_16
action_18 (31) = happyShift action_17
action_18 (32) = happyShift action_18
action_18 (8) = happyGoto action_25
action_18 (9) = happyGoto action_7
action_18 (10) = happyGoto action_8
action_18 (13) = happyGoto action_9
action_18 (14) = happyGoto action_10
action_18 (15) = happyGoto action_11
action_18 _ = happyFail

action_19 (25) = happyShift action_5
action_19 (7) = happyGoto action_19
action_19 (12) = happyGoto action_24
action_19 _ = happyReduce_22

action_20 (34) = happyAccept
action_20 _ = happyFail

action_21 (34) = happyAccept
action_21 _ = happyFail

action_22 (28) = happyShift action_23
action_22 _ = happyReduce_4

action_23 (20) = happyShift action_40
action_23 (24) = happyShift action_41
action_23 (29) = happyShift action_42
action_23 (11) = happyGoto action_39
action_23 _ = happyFail

action_24 _ = happyReduce_21

action_25 (28) = happyShift action_23
action_25 _ = happyReduce_27

action_26 (28) = happyShift action_23
action_26 _ = happyReduce_26

action_27 (16) = happyShift action_38
action_27 _ = happyFail

action_28 (21) = happyShift action_36
action_28 (28) = happyShift action_23
action_28 (33) = happyShift action_37
action_28 _ = happyFail

action_29 (17) = happyShift action_35
action_29 _ = happyFail

action_30 _ = happyReduce_11

action_31 (18) = happyShift action_12
action_31 (20) = happyShift action_13
action_31 (23) = happyShift action_14
action_31 (26) = happyShift action_15
action_31 (30) = happyShift action_16
action_31 (31) = happyShift action_17
action_31 (32) = happyShift action_18
action_31 (8) = happyGoto action_34
action_31 (9) = happyGoto action_7
action_31 (10) = happyGoto action_8
action_31 (13) = happyGoto action_9
action_31 (14) = happyGoto action_10
action_31 (15) = happyGoto action_11
action_31 _ = happyFail

action_32 (16) = happyShift action_33
action_32 _ = happyFail

action_33 (18) = happyShift action_12
action_33 (20) = happyShift action_13
action_33 (23) = happyShift action_14
action_33 (26) = happyShift action_15
action_33 (30) = happyShift action_16
action_33 (31) = happyShift action_17
action_33 (32) = happyShift action_18
action_33 (8) = happyGoto action_48
action_33 (9) = happyGoto action_7
action_33 (10) = happyGoto action_8
action_33 (13) = happyGoto action_9
action_33 (14) = happyGoto action_10
action_33 (15) = happyGoto action_11
action_33 _ = happyFail

action_34 (21) = happyShift action_36
action_34 (28) = happyShift action_23
action_34 _ = happyFail

action_35 (20) = happyShift action_40
action_35 (24) = happyShift action_41
action_35 (29) = happyShift action_42
action_35 (11) = happyGoto action_47
action_35 _ = happyFail

action_36 _ = happyReduce_15

action_37 (18) = happyShift action_12
action_37 (20) = happyShift action_13
action_37 (23) = happyShift action_14
action_37 (26) = happyShift action_15
action_37 (30) = happyShift action_16
action_37 (31) = happyShift action_17
action_37 (32) = happyShift action_18
action_37 (8) = happyGoto action_46
action_37 (9) = happyGoto action_7
action_37 (10) = happyGoto action_8
action_37 (13) = happyGoto action_9
action_37 (14) = happyGoto action_10
action_37 (15) = happyGoto action_11
action_37 _ = happyFail

action_38 (18) = happyShift action_12
action_38 (20) = happyShift action_13
action_38 (23) = happyShift action_14
action_38 (26) = happyShift action_15
action_38 (30) = happyShift action_16
action_38 (31) = happyShift action_17
action_38 (32) = happyShift action_18
action_38 (8) = happyGoto action_45
action_38 (9) = happyGoto action_7
action_38 (10) = happyGoto action_8
action_38 (13) = happyGoto action_9
action_38 (14) = happyGoto action_10
action_38 (15) = happyGoto action_11
action_38 _ = happyFail

action_39 (22) = happyShift action_44
action_39 _ = happyReduce_24

action_40 (20) = happyShift action_40
action_40 (24) = happyShift action_41
action_40 (29) = happyShift action_42
action_40 (11) = happyGoto action_43
action_40 _ = happyFail

action_41 _ = happyReduce_16

action_42 _ = happyReduce_19

action_43 (21) = happyShift action_53
action_43 (22) = happyShift action_44
action_43 (33) = happyShift action_54
action_43 _ = happyFail

action_44 (20) = happyShift action_40
action_44 (24) = happyShift action_41
action_44 (29) = happyShift action_42
action_44 (11) = happyGoto action_52
action_44 _ = happyFail

action_45 (27) = happyShift action_51
action_45 (28) = happyShift action_23
action_45 _ = happyFail

action_46 (21) = happyShift action_50
action_46 (28) = happyShift action_23
action_46 _ = happyFail

action_47 (19) = happyShift action_49
action_47 (22) = happyShift action_44
action_47 _ = happyFail

action_48 (28) = happyShift action_23
action_48 _ = happyReduce_5

action_49 (18) = happyShift action_12
action_49 (20) = happyShift action_13
action_49 (23) = happyShift action_14
action_49 (26) = happyShift action_15
action_49 (30) = happyShift action_16
action_49 (31) = happyShift action_17
action_49 (32) = happyShift action_18
action_49 (8) = happyGoto action_57
action_49 (9) = happyGoto action_7
action_49 (10) = happyGoto action_8
action_49 (13) = happyGoto action_9
action_49 (14) = happyGoto action_10
action_49 (15) = happyGoto action_11
action_49 _ = happyFail

action_50 _ = happyReduce_25

action_51 (18) = happyShift action_12
action_51 (20) = happyShift action_13
action_51 (23) = happyShift action_14
action_51 (26) = happyShift action_15
action_51 (30) = happyShift action_16
action_51 (31) = happyShift action_17
action_51 (32) = happyShift action_18
action_51 (8) = happyGoto action_56
action_51 (9) = happyGoto action_7
action_51 (10) = happyGoto action_8
action_51 (13) = happyGoto action_9
action_51 (14) = happyGoto action_10
action_51 (15) = happyGoto action_11
action_51 _ = happyFail

action_52 (22) = happyShift action_44
action_52 _ = happyReduce_17

action_53 _ = happyReduce_18

action_54 (20) = happyShift action_40
action_54 (24) = happyShift action_41
action_54 (29) = happyShift action_42
action_54 (11) = happyGoto action_55
action_54 _ = happyFail

action_55 (21) = happyShift action_58
action_55 (22) = happyShift action_44
action_55 _ = happyFail

action_56 (28) = happyShift action_23
action_56 _ = happyReduce_23

action_57 (28) = happyShift action_23
action_57 _ = happyReduce_6

action_58 _ = happyReduce_20

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (Eval happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 7 happyReduction_5
happyReduction_5 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Def happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 6 8 happyReduction_6
happyReduction_6 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Abs happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_1  8 happyReduction_7
happyReduction_7 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  8 happyReduction_8
happyReduction_8 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  8 happyReduction_9
happyReduction_9 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  9 happyReduction_11
happyReduction_11 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (App happy_var_1 happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  10 happyReduction_13
happyReduction_13 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn8
		 (LVar happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  10 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn8
		 (U
	)

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  11 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn11
		 (Base
	)

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Fun happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  11 happyReduction_18
happyReduction_18 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn11
		 (Unit
	)

happyReduce_20 = happyReduce 5 11 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Pair happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_2  12 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_0  12 happyReduction_22
happyReduction_22  =  HappyAbsSyn12
		 ([]
	)

happyReduce_23 = happyReduce 6 13 happyReduction_23
happyReduction_23 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_3  14 happyReduction_24
happyReduction_24 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn14
		 (Has happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 5 15 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Pairl happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_2  15 happyReduction_26
happyReduction_26 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Fstl happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  15 happyReduction_27
happyReduction_27 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Sndl happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEOF -> action 34 34 tk (HappyState action) sts stk;
	TEquals -> cont 16;
	TColon -> cont 17;
	TAbs -> cont 18;
	TDot -> cont 19;
	TOpen -> cont 20;
	TClose -> cont 21;
	TArrow -> cont 22;
	TVar happy_dollar_dollar -> cont 23;
	TType -> cont 24;
	TDef -> cont 25;
	TLet -> cont 26;
	TIn -> cont 27;
	TAs -> cont 28;
	TUnit -> cont 29;
	Tunit -> cont 30;
	Tfst -> cont 31;
	Tsnd -> cont 32;
	TComma -> cont 33;
	_ -> happyError' tk
	})

happyError_ 34 tk = happyError' tk
happyError_ _ tk = happyError' tk

happyThen :: () => P a -> (a -> P b) -> P b
happyThen = (thenP)
happyReturn :: () => a -> P a
happyReturn = (returnP)
happyThen1 = happyThen
happyReturn1 :: () => a -> P a
happyReturn1 = happyReturn
happyError' :: () => (Token) -> P a
happyError' tk = (\token -> happyError) tk

parseStmt = happySomeParser where
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn6 z -> happyReturn z; _other -> notHappyAtAll })

parseStmts = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn12 z -> happyReturn z; _other -> notHappyAtAll })

term = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn8 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


data ParseResult a = Ok a | Failed String
                     deriving Show                     
type LineNumber = Int
type P a = String -> LineNumber -> ParseResult a

getLineNo :: P LineNumber
getLineNo = \s l -> Ok l

thenP :: P a -> (a -> P b) -> P b
m `thenP` k = \s l-> case m s l of
                         Ok a     -> k a s l
                         Failed e -> Failed e
                         
returnP :: a -> P a
returnP a = \s l-> Ok a

failP :: String -> P a
failP err = \s l -> Failed err

catchP :: P a -> (String -> P a) -> P a
catchP m k = \s l -> case m s l of
                        Ok a     -> Ok a
                        Failed e -> k e s l

happyError :: P a
happyError = \ s i -> Failed $ "Línea "++(show (i::LineNumber))++": Error de parseo\n"++(s)

data Token = TVar String
               | TType
               | TDef
               | TAbs
               | TDot
               | TOpen
               | TClose 
               | TColon
               | TArrow
               | TEquals
               | TEOF
               | TLet
               | TIn
               | TAs
               | TUnit
               | Tunit
               | Tfst
               | Tsnd
               | TComma
               deriving Show


----------------------------------
lexer cont s = case s of
                    [] -> cont TEOF []
                    ('\n':s)  ->  \line -> lexer cont s (line + 1)
                    (c:cs)
                          | isSpace c -> lexer cont cs
                          | isAlpha c -> lexVar (c:cs)
                    ('-':('-':cs)) -> lexer cont $ dropWhile ((/=) '\n') cs
                    ('{':('-':cs)) -> consumirBK 0 0 cont cs	
	            ('-':('}':cs)) -> \ line -> Failed $ "Línea "++(show line)++": Comentario no abierto"
                    ('-':('>':cs)) -> cont TArrow cs
                    ('\\':cs)-> cont TAbs cs
                    ('.':cs) -> cont TDot cs
                    ('(':cs) -> cont TOpen cs
                    ('-':('>':cs)) -> cont TArrow cs
                    (')':cs) -> cont TClose cs
                    (':':cs) -> cont TColon cs
                    ('=':cs) -> cont TEquals cs
                    (',':cs) -> cont TComma cs
                    unknown -> \line -> Failed $ "Línea "++(show line)++": No se puede reconocer "++(show $ take 10 unknown)++ "..."
                    where lexVar cs = case span isAlpha cs of
                                           ("B",rest)   -> cont TType rest
                                           ("Unit",rest)   -> cont TUnit rest
                                           ("unit",rest)   -> cont Tunit rest
                                           ("def",rest) -> cont TDef rest
                                           ("let",rest) -> cont TLet rest
                                           ("in",rest)  -> cont TIn rest
                                           ("as",rest)  -> cont TAs rest
                                           ("snd",rest) -> cont Tsnd rest
                                           ("fst",rest) -> cont Tfst rest
                                           (var,rest)   -> cont (TVar var) rest
                                           
                          consumirBK anidado cl cont s = case s of
                                                                      ('-':('-':cs)) -> consumirBK anidado cl cont $ dropWhile ((/=) '\n') cs
		                                                      ('{':('-':cs)) -> consumirBK (anidado+1) cl cont cs	
		                                                      ('-':('}':cs)) -> case anidado of
			                                                                     0 -> \line -> lexer cont cs (line+cl)
			                                                                     _ -> consumirBK (anidado-1) cl cont cs
		                                                      ('\n':cs) -> consumirBK anidado (cl+1) cont cs
		                                                      (_:cs) -> consumirBK anidado cl cont cs     
                                           
stmts_parse s = parseStmts s 1
stmt_parse s = parseStmt s 1
term_parse s = term s 1
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<command-line>" #-}





# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














# 1 "/usr/include/x86_64-linux-gnu/bits/predefs.h" 1 3 4

# 18 "/usr/include/x86_64-linux-gnu/bits/predefs.h" 3 4












# 31 "/usr/include/stdc-predef.h" 2 3 4








# 5 "<command-line>" 2
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 45 "templates/GenericTemplate.hs" #-}








{-# LINE 66 "templates/GenericTemplate.hs" #-}

{-# LINE 76 "templates/GenericTemplate.hs" #-}

{-# LINE 85 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	 (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 154 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 255 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 321 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
