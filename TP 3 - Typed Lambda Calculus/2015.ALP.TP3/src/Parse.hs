{-# OPTIONS_GHC -w #-}
module Parse where
import Common
import Data.Maybe
import Data.Char

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t6 t7 t11 t12 t13 t14 t15 t16
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
	| HappyAbsSyn16 t16

action_0 (19) = happyShift action_13
action_0 (21) = happyShift action_14
action_0 (24) = happyShift action_15
action_0 (26) = happyShift action_5
action_0 (27) = happyShift action_16
action_0 (31) = happyShift action_17
action_0 (32) = happyShift action_18
action_0 (33) = happyShift action_19
action_0 (35) = happyShift action_20
action_0 (36) = happyShift action_21
action_0 (37) = happyShift action_22
action_0 (6) = happyGoto action_25
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_26
action_0 (9) = happyGoto action_7
action_0 (10) = happyGoto action_8
action_0 (13) = happyGoto action_9
action_0 (14) = happyGoto action_10
action_0 (15) = happyGoto action_11
action_0 (16) = happyGoto action_12
action_0 _ = happyFail

action_1 (26) = happyShift action_5
action_1 (7) = happyGoto action_23
action_1 (12) = happyGoto action_24
action_1 _ = happyReduce_24

action_2 (19) = happyShift action_13
action_2 (21) = happyShift action_14
action_2 (24) = happyShift action_15
action_2 (27) = happyShift action_16
action_2 (31) = happyShift action_17
action_2 (32) = happyShift action_18
action_2 (33) = happyShift action_19
action_2 (35) = happyShift action_20
action_2 (36) = happyShift action_21
action_2 (37) = happyShift action_22
action_2 (8) = happyGoto action_6
action_2 (9) = happyGoto action_7
action_2 (10) = happyGoto action_8
action_2 (13) = happyGoto action_9
action_2 (14) = happyGoto action_10
action_2 (15) = happyGoto action_11
action_2 (16) = happyGoto action_12
action_2 _ = happyFail

action_3 (26) = happyShift action_5
action_3 (7) = happyGoto action_4
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (24) = happyShift action_38
action_5 _ = happyFail

action_6 (29) = happyShift action_27
action_6 (39) = happyAccept
action_6 _ = happyFail

action_7 (19) = happyShift action_13
action_7 (21) = happyShift action_14
action_7 (24) = happyShift action_15
action_7 (27) = happyShift action_16
action_7 (31) = happyShift action_17
action_7 (32) = happyShift action_18
action_7 (33) = happyShift action_19
action_7 (35) = happyShift action_20
action_7 (36) = happyShift action_21
action_7 (37) = happyShift action_22
action_7 (8) = happyGoto action_36
action_7 (9) = happyGoto action_7
action_7 (10) = happyGoto action_37
action_7 (13) = happyGoto action_9
action_7 (14) = happyGoto action_10
action_7 (15) = happyGoto action_11
action_7 (16) = happyGoto action_12
action_7 _ = happyReduce_7

action_8 _ = happyReduce_9

action_9 _ = happyReduce_13

action_10 _ = happyReduce_14

action_11 _ = happyReduce_15

action_12 _ = happyReduce_16

action_13 (24) = happyShift action_35
action_13 _ = happyFail

action_14 (19) = happyShift action_13
action_14 (21) = happyShift action_14
action_14 (24) = happyShift action_15
action_14 (27) = happyShift action_16
action_14 (31) = happyShift action_17
action_14 (32) = happyShift action_18
action_14 (33) = happyShift action_19
action_14 (35) = happyShift action_20
action_14 (36) = happyShift action_21
action_14 (37) = happyShift action_22
action_14 (8) = happyGoto action_34
action_14 (9) = happyGoto action_7
action_14 (10) = happyGoto action_8
action_14 (13) = happyGoto action_9
action_14 (14) = happyGoto action_10
action_14 (15) = happyGoto action_11
action_14 (16) = happyGoto action_12
action_14 _ = happyFail

action_15 _ = happyReduce_10

action_16 (24) = happyShift action_33
action_16 _ = happyFail

action_17 _ = happyReduce_11

action_18 (19) = happyShift action_13
action_18 (21) = happyShift action_14
action_18 (24) = happyShift action_15
action_18 (27) = happyShift action_16
action_18 (31) = happyShift action_17
action_18 (32) = happyShift action_18
action_18 (33) = happyShift action_19
action_18 (35) = happyShift action_20
action_18 (36) = happyShift action_21
action_18 (37) = happyShift action_22
action_18 (8) = happyGoto action_32
action_18 (9) = happyGoto action_7
action_18 (10) = happyGoto action_8
action_18 (13) = happyGoto action_9
action_18 (14) = happyGoto action_10
action_18 (15) = happyGoto action_11
action_18 (16) = happyGoto action_12
action_18 _ = happyFail

action_19 (19) = happyShift action_13
action_19 (21) = happyShift action_14
action_19 (24) = happyShift action_15
action_19 (27) = happyShift action_16
action_19 (31) = happyShift action_17
action_19 (32) = happyShift action_18
action_19 (33) = happyShift action_19
action_19 (35) = happyShift action_20
action_19 (36) = happyShift action_21
action_19 (37) = happyShift action_22
action_19 (8) = happyGoto action_31
action_19 (9) = happyGoto action_7
action_19 (10) = happyGoto action_8
action_19 (13) = happyGoto action_9
action_19 (14) = happyGoto action_10
action_19 (15) = happyGoto action_11
action_19 (16) = happyGoto action_12
action_19 _ = happyFail

action_20 (19) = happyShift action_13
action_20 (21) = happyShift action_14
action_20 (24) = happyShift action_15
action_20 (27) = happyShift action_16
action_20 (31) = happyShift action_17
action_20 (32) = happyShift action_18
action_20 (33) = happyShift action_19
action_20 (35) = happyShift action_20
action_20 (36) = happyShift action_21
action_20 (37) = happyShift action_22
action_20 (8) = happyGoto action_30
action_20 (9) = happyGoto action_7
action_20 (10) = happyGoto action_8
action_20 (13) = happyGoto action_9
action_20 (14) = happyGoto action_10
action_20 (15) = happyGoto action_11
action_20 (16) = happyGoto action_12
action_20 _ = happyFail

action_21 _ = happyReduce_31

action_22 (19) = happyShift action_13
action_22 (21) = happyShift action_14
action_22 (24) = happyShift action_15
action_22 (27) = happyShift action_16
action_22 (31) = happyShift action_17
action_22 (32) = happyShift action_18
action_22 (33) = happyShift action_19
action_22 (35) = happyShift action_20
action_22 (36) = happyShift action_21
action_22 (37) = happyShift action_22
action_22 (8) = happyGoto action_29
action_22 (9) = happyGoto action_7
action_22 (10) = happyGoto action_8
action_22 (13) = happyGoto action_9
action_22 (14) = happyGoto action_10
action_22 (15) = happyGoto action_11
action_22 (16) = happyGoto action_12
action_22 _ = happyFail

action_23 (26) = happyShift action_5
action_23 (7) = happyGoto action_23
action_23 (12) = happyGoto action_28
action_23 _ = happyReduce_24

action_24 (39) = happyAccept
action_24 _ = happyFail

action_25 (39) = happyAccept
action_25 _ = happyFail

action_26 (29) = happyShift action_27
action_26 _ = happyReduce_4

action_27 (21) = happyShift action_46
action_27 (25) = happyShift action_47
action_27 (30) = happyShift action_48
action_27 (38) = happyShift action_49
action_27 (11) = happyGoto action_45
action_27 _ = happyFail

action_28 _ = happyReduce_23

action_29 (29) = happyShift action_27
action_29 (34) = happyShift action_44
action_29 _ = happyFail

action_30 _ = happyReduce_30

action_31 _ = happyReduce_29

action_32 _ = happyReduce_28

action_33 (17) = happyShift action_43
action_33 _ = happyFail

action_34 (22) = happyShift action_41
action_34 (29) = happyShift action_27
action_34 (34) = happyShift action_42
action_34 _ = happyFail

action_35 (18) = happyShift action_40
action_35 _ = happyFail

action_36 (29) = happyShift action_27
action_36 _ = happyFail

action_37 (19) = happyReduce_9
action_37 (21) = happyReduce_9
action_37 (24) = happyReduce_9
action_37 (27) = happyReduce_9
action_37 (29) = happyReduce_9
action_37 (31) = happyReduce_9
action_37 (32) = happyReduce_9
action_37 (33) = happyReduce_9
action_37 (35) = happyReduce_9
action_37 (36) = happyReduce_9
action_37 (37) = happyReduce_9
action_37 _ = happyReduce_8

action_38 (17) = happyShift action_39
action_38 _ = happyFail

action_39 (19) = happyShift action_13
action_39 (21) = happyShift action_14
action_39 (24) = happyShift action_15
action_39 (27) = happyShift action_16
action_39 (31) = happyShift action_17
action_39 (32) = happyShift action_18
action_39 (33) = happyShift action_19
action_39 (35) = happyShift action_20
action_39 (36) = happyShift action_21
action_39 (37) = happyShift action_22
action_39 (8) = happyGoto action_56
action_39 (9) = happyGoto action_7
action_39 (10) = happyGoto action_8
action_39 (13) = happyGoto action_9
action_39 (14) = happyGoto action_10
action_39 (15) = happyGoto action_11
action_39 (16) = happyGoto action_12
action_39 _ = happyFail

action_40 (21) = happyShift action_46
action_40 (25) = happyShift action_47
action_40 (30) = happyShift action_48
action_40 (38) = happyShift action_49
action_40 (11) = happyGoto action_55
action_40 _ = happyFail

action_41 _ = happyReduce_12

action_42 (19) = happyShift action_13
action_42 (21) = happyShift action_14
action_42 (24) = happyShift action_15
action_42 (27) = happyShift action_16
action_42 (31) = happyShift action_17
action_42 (32) = happyShift action_18
action_42 (33) = happyShift action_19
action_42 (35) = happyShift action_20
action_42 (36) = happyShift action_21
action_42 (37) = happyShift action_22
action_42 (8) = happyGoto action_54
action_42 (9) = happyGoto action_7
action_42 (10) = happyGoto action_8
action_42 (13) = happyGoto action_9
action_42 (14) = happyGoto action_10
action_42 (15) = happyGoto action_11
action_42 (16) = happyGoto action_12
action_42 _ = happyFail

action_43 (19) = happyShift action_13
action_43 (21) = happyShift action_14
action_43 (24) = happyShift action_15
action_43 (27) = happyShift action_16
action_43 (31) = happyShift action_17
action_43 (32) = happyShift action_18
action_43 (33) = happyShift action_19
action_43 (35) = happyShift action_20
action_43 (36) = happyShift action_21
action_43 (37) = happyShift action_22
action_43 (8) = happyGoto action_53
action_43 (9) = happyGoto action_7
action_43 (10) = happyGoto action_8
action_43 (13) = happyGoto action_9
action_43 (14) = happyGoto action_10
action_43 (15) = happyGoto action_11
action_43 (16) = happyGoto action_12
action_43 _ = happyFail

action_44 (19) = happyShift action_13
action_44 (21) = happyShift action_14
action_44 (24) = happyShift action_15
action_44 (27) = happyShift action_16
action_44 (31) = happyShift action_17
action_44 (32) = happyShift action_18
action_44 (33) = happyShift action_19
action_44 (35) = happyShift action_20
action_44 (36) = happyShift action_21
action_44 (37) = happyShift action_22
action_44 (8) = happyGoto action_52
action_44 (9) = happyGoto action_7
action_44 (10) = happyGoto action_8
action_44 (13) = happyGoto action_9
action_44 (14) = happyGoto action_10
action_44 (15) = happyGoto action_11
action_44 (16) = happyGoto action_12
action_44 _ = happyFail

action_45 (23) = happyShift action_51
action_45 _ = happyReduce_26

action_46 (21) = happyShift action_46
action_46 (25) = happyShift action_47
action_46 (30) = happyShift action_48
action_46 (38) = happyShift action_49
action_46 (11) = happyGoto action_50
action_46 _ = happyFail

action_47 _ = happyReduce_17

action_48 _ = happyReduce_20

action_49 _ = happyReduce_22

action_50 (22) = happyShift action_62
action_50 (23) = happyShift action_51
action_50 (34) = happyShift action_63
action_50 _ = happyFail

action_51 (21) = happyShift action_46
action_51 (25) = happyShift action_47
action_51 (30) = happyShift action_48
action_51 (38) = happyShift action_49
action_51 (11) = happyGoto action_61
action_51 _ = happyFail

action_52 (29) = happyShift action_27
action_52 (34) = happyShift action_60
action_52 _ = happyFail

action_53 (28) = happyShift action_59
action_53 (29) = happyShift action_27
action_53 _ = happyFail

action_54 (22) = happyShift action_58
action_54 (29) = happyShift action_27
action_54 _ = happyFail

action_55 (20) = happyShift action_57
action_55 (23) = happyShift action_51
action_55 _ = happyFail

action_56 (29) = happyShift action_27
action_56 _ = happyReduce_5

action_57 (19) = happyShift action_13
action_57 (21) = happyShift action_14
action_57 (24) = happyShift action_15
action_57 (27) = happyShift action_16
action_57 (31) = happyShift action_17
action_57 (32) = happyShift action_18
action_57 (33) = happyShift action_19
action_57 (35) = happyShift action_20
action_57 (36) = happyShift action_21
action_57 (37) = happyShift action_22
action_57 (8) = happyGoto action_67
action_57 (9) = happyGoto action_7
action_57 (10) = happyGoto action_8
action_57 (13) = happyGoto action_9
action_57 (14) = happyGoto action_10
action_57 (15) = happyGoto action_11
action_57 (16) = happyGoto action_12
action_57 _ = happyFail

action_58 _ = happyReduce_27

action_59 (19) = happyShift action_13
action_59 (21) = happyShift action_14
action_59 (24) = happyShift action_15
action_59 (27) = happyShift action_16
action_59 (31) = happyShift action_17
action_59 (32) = happyShift action_18
action_59 (33) = happyShift action_19
action_59 (35) = happyShift action_20
action_59 (36) = happyShift action_21
action_59 (37) = happyShift action_22
action_59 (8) = happyGoto action_66
action_59 (9) = happyGoto action_7
action_59 (10) = happyGoto action_8
action_59 (13) = happyGoto action_9
action_59 (14) = happyGoto action_10
action_59 (15) = happyGoto action_11
action_59 (16) = happyGoto action_12
action_59 _ = happyFail

action_60 (19) = happyShift action_13
action_60 (21) = happyShift action_14
action_60 (24) = happyShift action_15
action_60 (27) = happyShift action_16
action_60 (31) = happyShift action_17
action_60 (32) = happyShift action_18
action_60 (33) = happyShift action_19
action_60 (35) = happyShift action_20
action_60 (36) = happyShift action_21
action_60 (37) = happyShift action_22
action_60 (8) = happyGoto action_65
action_60 (9) = happyGoto action_7
action_60 (10) = happyGoto action_8
action_60 (13) = happyGoto action_9
action_60 (14) = happyGoto action_10
action_60 (15) = happyGoto action_11
action_60 (16) = happyGoto action_12
action_60 _ = happyFail

action_61 (23) = happyShift action_51
action_61 _ = happyReduce_18

action_62 _ = happyReduce_19

action_63 (21) = happyShift action_46
action_63 (25) = happyShift action_47
action_63 (30) = happyShift action_48
action_63 (38) = happyShift action_49
action_63 (11) = happyGoto action_64
action_63 _ = happyFail

action_64 (22) = happyShift action_68
action_64 (23) = happyShift action_51
action_64 _ = happyFail

action_65 (29) = happyShift action_27
action_65 _ = happyReduce_32

action_66 (29) = happyShift action_27
action_66 _ = happyReduce_25

action_67 (29) = happyShift action_27
action_67 _ = happyReduce_6

action_68 _ = happyReduce_21

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

happyReduce_8 = happySpecReduce_2  9 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (App happy_var_1 happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  9 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  10 happyReduction_10
happyReduction_10 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn8
		 (LVar happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  10 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn8
		 (U
	)

happyReduce_12 = happySpecReduce_3  10 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  10 happyReduction_13
happyReduction_13 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  10 happyReduction_14
happyReduction_14 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  11 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn11
		 (Base
	)

happyReduce_18 = happySpecReduce_3  11 happyReduction_18
happyReduction_18 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Fun happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  11 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn11
		 (Unit
	)

happyReduce_21 = happyReduce 5 11 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Pair happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn11
		 (Nat
	)

happyReduce_23 = happySpecReduce_2  12 happyReduction_23
happyReduction_23 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_0  12 happyReduction_24
happyReduction_24  =  HappyAbsSyn12
		 ([]
	)

happyReduce_25 = happyReduce 6 13 happyReduction_25
happyReduction_25 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn14
		 (Has happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 5 15 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Pairl happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_2  15 happyReduction_28
happyReduction_28 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Fstl happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  15 happyReduction_29
happyReduction_29 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Sndl happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  16 happyReduction_30
happyReduction_30 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Sucl happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  16 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn16
		 (Zerol
	)

happyReduce_32 = happyReduce 6 16 happyReduction_32
happyReduction_32 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Recl happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEOF -> action 39 39 tk (HappyState action) sts stk;
	TEquals -> cont 17;
	TColon -> cont 18;
	TAbs -> cont 19;
	TDot -> cont 20;
	TOpen -> cont 21;
	TClose -> cont 22;
	TArrow -> cont 23;
	TVar happy_dollar_dollar -> cont 24;
	TType -> cont 25;
	TDef -> cont 26;
	TLet -> cont 27;
	TIn -> cont 28;
	TAs -> cont 29;
	TUnit -> cont 30;
	Tunit -> cont 31;
	Tfst -> cont 32;
	Tsnd -> cont 33;
	TComma -> cont 34;
	TSuc -> cont 35;
	TZero -> cont 36;
	TRec -> cont 37;
	TNat -> cont 38;
	_ -> happyError' tk
	})

happyError_ 39 tk = happyError' tk
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
               | TSuc
               | TZero 
               | TRec
               | TNat
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
                                           ("Nat",rest) -> cont TNat rest  
                                           ("suc",rest) -> cont TSuc rest
                                           ("zero",rest)-> cont TZero rest
                                           ("R", rest)  -> cont TRec rest
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
