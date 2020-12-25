-- SYNTAX TEST "Packages/Haskell/Haskell.sublime-syntax"

-- [ COMMENTS ] ---------------------------------------------------------------

23*36  -- single line comment
--     ^^ punctuation.definition.comment.haskell
--     ^^^^^^^^^^^^^^^^^^^^^^^ comment.line.double-dash.haskell
23*36
-- <- - comment.line.double-dash.haskell

    {- block comment -} 23*36
--  ^^ punctuation.definition.comment.begin.haskell
--  ^^^^^^^^^^^^^^^^^^^ comment.block.haskell
--                   ^^ punctuation.definition.comment.end.haskell
--                     ^ - comment.block.haskell

    {- {-# #-} -} 23*36
--  ^^ punctuation.definition.comment.begin.haskell
--  ^^^^^^^^^^^^^ comment.block.haskell - meta.preprocessor.haskell
--             ^^ punctuation.definition.comment.end.haskell
--               ^ - comment.block.haskell

    {- {- #-} -} 23*36
--  ^^ punctuation.definition.comment.begin.haskell
--  ^^^^^^^^^^^^ comment.block.haskell
--            ^^ punctuation.definition.comment.end.haskell
--              ^ - comment.block.haskell

    {- {- -} -} 23*36
--  ^^ punctuation.definition.comment.begin.haskell
--  ^^^^^^^^^^^ comment.block.haskell
--           ^^ punctuation.definition.comment.end.haskell
--             ^ - comment.block.haskell

    {- {-# -} -} 23*36
--  ^^ punctuation.definition.comment.begin.haskell
--  ^^^^^^^^^^^^ comment.block.haskell - meta.preprocessor.haskell
--            ^^ punctuation.definition.comment.end.haskell
--              ^ - comment.block.haskell

    {- {-# {- test -} -} -} 23*36
--  ^^ punctuation.definition.comment.begin.haskell
--  ^^^^^^^^^^^^^^^^^^^^^^^ comment.block.haskell - meta.preprocessor.haskell
--                       ^^ punctuation.definition.comment.end.haskell
--                         ^ - comment.block.haskell


-- [ COMMENTS STARTING WITH SPECIAL SYMBOL CHARS ] ----------------------------

    --
--  ^^^ comment
    --_
--  ^^^ comment
    --"
--  ^^^ comment
    --'
--  ^^^ comment
    --(
--  ^^^ comment
    --)
--  ^^^ comment
    --,
--  ^^^ comment
    ---
--  ^^^ comment
    --;
--  ^^^ comment
    --[
--  ^^^ comment
    --]
--  ^^^ comment
    --`
--  ^^^ comment
    --{
--  ^^^ comment
    --}
--  ^^^ comment


-- [ NO COMMENTS ] ------------------------------------------------------------

    --!
--  ^^^ - comment
    --#
--  ^^^ - comment
    --$
--  ^^^ - comment
    --%
--  ^^^ - comment
    --&
--  ^^^ - comment
    --*
--  ^^^ - comment
    --+
--  ^^^ - comment
    --.
--  ^^^ - comment
    --.
--  ^^^ - comment
    --/
--  ^^^ - comment
    --:
--  ^^^ - comment
    --<
--  ^^^ - comment
    --=
--  ^^^ - comment
    -->
--  ^^^ - comment
    --?
--  ^^^ - comment
    --\
--  ^^^ - comment
    --\
--  ^^^ - comment
    --^
--  ^^^ - comment
    --|
--  ^^^ - comment
    --~
--  ^^^ - comment
    --~
--  ^^^ - comment


-- [ PREPROCESSOR ] -----------------------------------------------------------

    {-# MINIMAL traverse | sequenceA LANGUAGE #-}
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.preprocessor.haskell
--                                               ^ - meta.preprocessor.haskell
--  ^^^ punctuation.section.preprocessor.begin.haskell
--      ^^^^^^^ keyword.directive.other.haskell
--                                    ^^^^^^^ keyword.directive.other.haskell
--                                            ^^^ punctuation.section.preprocessor.end.haskell

    {-# OPTIONS_HADDOCK not-home #-}
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.preprocessor.haskell
--                                  ^ - meta.preprocessor.haskell
--  ^^^ punctuation.section.preprocessor.begin.haskell
--      ^^^^^^^^^^^^^^^ keyword.directive.other.haskell
--                               ^^^ punctuation.section.preprocessor.end.haskell

    #if 0
--  ^^^ meta.preprocessor.c
--  ^ punctuation.definition.preprocessor.c
--  ^^^ keyword.directive.other.c

    #endif
--  ^^^^^^ meta.preprocessor.c
--  ^ punctuation.definition.preprocessor.c
--  ^^^^^^ keyword.directive.other.c


-- [ MODULE DECLARATIONS ] ----------------------------------------------------

    'module
--  ^ keyword.operator.haskell
--   ^^^^^^ keyword.declaration.namespace.haskell

    module'
--  ^^^^^^^ - keyword

    module
--  ^^^^^^^ meta.declaration.module.haskell
--  ^^^^^^ keyword.declaration.namespace.haskell

    module Name
--  ^^^^^^^^^^^^ meta.declaration.module.haskell
--  ^^^^^^ keyword.declaration.namespace.haskell
--         ^^^^ entity.name.namespace.haskell

    module Name where
--  ^^^^^^^^^^^^^^^^^ meta.declaration.module.haskell
--  ^^^^^^ keyword.declaration.namespace.haskell
--         ^^^^ entity.name.namespace.haskell
--              ^^^^^ keyword.control.context.haskell

    module ()
--  ^^^^^^^ meta.declaration.module.haskell - meta.sequence
--         ^^ meta.declaration.module.haskell meta.sequence.tuple.haskell
--  ^^^^^^ keyword.declaration.namespace.haskell
--         ^ punctuation.section.sequence.begin.haskell
--          ^ punctuation.section.sequence.end.haskell

    module Name ()
--  ^^^^^^^^^^^^ meta.declaration.module.haskell - meta.sequence
--              ^^ meta.declaration.module.haskell meta.sequence.tuple.haskell
--  ^^^^^^ keyword.declaration.namespace.haskell
--         ^^^^ entity.name.namespace.haskell
--              ^ punctuation.section.sequence.begin.haskell
--               ^ punctuation.section.sequence.end.haskell

    module Name () where
--  ^^^^^^^^^^^^ meta.declaration.module.haskell - meta.sequence
--              ^^ meta.declaration.module.haskell meta.sequence.tuple.haskell
--                 ^^^^^ meta.declaration.module.haskell - meta.sequence
--  ^^^^^^ keyword.declaration.namespace.haskell
--         ^^^^ entity.name.namespace.haskell
--              ^ punctuation.section.sequence.begin.haskell
--               ^ punctuation.section.sequence.end.haskell
--                 ^^^^^ keyword.control.context.haskell

    module Ns.Name (sym1, sym2) where { import Ns.Other; import Ns.Other2 }
--  ^^^^^^^^^^^^^^^ meta.declaration.module.haskell - meta.sequence
--                 ^^^^^^^^^^^^ meta.declaration.module.haskell meta.sequence.tuple.haskell
--                             ^^^^^^ meta.declaration.module.haskell - meta.sequence
--                                   ^ - meta.declaration.module - meta.block
--                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.haskell - meta.declaration.module
--                                                                         ^ - meta.block
--  ^^^^^^ keyword.declaration.namespace.haskell
--         ^^ variable.namespace.haskell
--           ^ punctuation.accessor.dot.haskell
--            ^^^^ entity.name.namespace.haskell
--                 ^ punctuation.section.sequence.begin.haskell
--                  ^^^^ variable.function.haskell
--                      ^ punctuation.separator.sequence.haskell
--                        ^^^^ variable.function.haskell
--                            ^ punctuation.section.sequence.end.haskell
--                              ^^^^^ keyword.control.context.haskell
--                                    ^ punctuation.section.block.begin.haskell
--                                      ^^^^^^ keyword.declaration.import.haskell
--                                             ^^ variable.namespace.haskell
--                                               ^ punctuation.accessor.dot.haskell
--                                                ^^^^^ entity.name.namespace.haskell
--                                                     ^ punctuation.terminator.statement.haskell
--                                                       ^^^^^^ keyword.declaration.import.haskell
--                                                              ^^ variable.namespace.haskell
--                                                                ^ punctuation.accessor.dot.haskell
--                                                                 ^^^^^^ entity.name.namespace.haskell
--                                                                        ^ punctuation.section.block.end.haskell

    module Name (module Other.Module) where { import Other.Module }
--  ^^^^^^^^^^^^ meta.declaration.module.haskell - meta.sequence
--              ^^^^^^^^^^^^^^^^^^^^^ meta.declaration.module.haskell meta.sequence.tuple.haskell
--                                   ^^^^^^ meta.declaration.module.haskell - meta.sequence
--                                         ^ - meta.declaration - meta.block
--                                          ^^ meta.block.haskell - meta.import
--                                            ^^^^^^^^^^^^^^^^^^^^ meta.block.haskell meta.import.haskell
--                                                                ^ meta.block.haskell - meta.import
--                                                                 ^ - meta.declaration - meta.block
--  ^^^^^^ keyword.declaration.namespace.haskell
--         ^^^^ entity.name.namespace.haskell
--              ^ punctuation.section.sequence.begin.haskell
--               ^^^^^^ keyword.declaration.namespace.haskell
--                      ^^^^^ variable.namespace.haskell
--                           ^ punctuation.accessor.dot.haskell
--                            ^^^^^^ storage.type.haskell
--                                  ^ punctuation.section.sequence.end.haskell
--                                    ^^^^^ keyword.control.context.haskell
--                                          ^ punctuation.section.block.begin.haskell
--                                            ^^^^^^ keyword.declaration.import.haskell
--                                                   ^^^^^ variable.namespace.haskell
--                                                        ^ punctuation.accessor.dot.haskell
--                                                         ^^^^^^ entity.name.namespace.haskell
--                                                                ^ punctuation.section.block.end.haskell

-- [ IMPORT DECLARATIONS ] ----------------------------------------------------

    'import
--  ^ keyword.operator.haskell
--   ^^^^^^ keyword.declaration.import.haskell

    import'
--  ^^^^^^^ - keyword

    import import
-- ^ - meta.import
--  ^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^^^  keyword.declaration.import.haskell
--         ^^^^^^ keyword.declaration.import.haskell

    import ; import
--  ^^^^^^^ meta.import.haskell
--         ^^ - meta.import
--           ^^^^^^^ meta.import.haskell
--  ^^^^^^ keyword.declaration.import.haskell
--         ^ punctuation.terminator.statement.haskell
--           ^^^^^^ meta.import.haskell keyword.declaration.import.haskell

    import qualified Data.Vector.Mutable as MutableVector
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^^^ keyword.declaration.import.haskell
--         ^^^^^^^^^ keyword.declaration.import.haskell
--                   ^^^^ variable.namespace.haskell - punctuation
--                       ^ punctuation.accessor.dot.haskell - variable
--                        ^^^^^^ variable.namespace.haskell - punctuation
--                              ^ punctuation.accessor.dot.haskell - variable
--                               ^^^^^^^ variable.namespace.haskell - punctuation
--                                       ^^ keyword.declaration.import.haskell
--                                          ^^^^^^^^^^^^^ entity.name.namespace.haskell

    import
--  ^^^^^^^ meta.import.haskell
--  ^^^^^^ keyword.declaration.import.haskell
    qualified
--  ^^^^^^^^^^ meta.import.haskell
--  ^^^^^^^^^ keyword.declaration.import.haskell
    Data.Vector.Mutable
--  ^^^^^^^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^ variable.namespace.haskell - punctuation
--      ^ punctuation.accessor.dot.haskell - variable
--       ^^^^^^ variable.namespace.haskell - punctuation
--             ^ punctuation.accessor.dot.haskell - variable
--              ^^^^^^^ entity.name.namespace.haskell - punctuation
    as
--  ^^^ meta.import.haskell
--  ^^ keyword.declaration.import.haskell
    MutableVector
--  ^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^^^^^^^^^^ entity.name.namespace.haskell

    import Data.List.Split (splitOn)
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^^^ keyword.declaration.import.haskell
--         ^^^^ variable.namespace.haskell - punctuation
--             ^ punctuation.accessor.dot.haskell - variable
--              ^^^^ variable.namespace.haskell - punctuation
--                  ^ punctuation.accessor.dot.haskell - variable
--                   ^^^^^ variable.namespace.haskell - punctuation
--                         ^^^^^^^^^ meta.sequence.tuple.haskell
--                         ^ punctuation.section.sequence.begin.haskell
--                          ^^^^^^^ variable.function.haskell
--                                 ^ punctuation.section.sequence.end.haskell

    import Data.List.Split (())
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^^^ keyword.declaration.import.haskell
--         ^^^^ variable.namespace.haskell - punctuation
--             ^ punctuation.accessor.dot.haskell - variable
--              ^^^^ variable.namespace.haskell - punctuation
--                  ^ punctuation.accessor.dot.haskell - variable
--                   ^^^^^ variable.namespace.haskell - punctuation
--                         ^^^^ meta.sequence.tuple.haskell
--                         ^ punctuation.section.sequence.begin.haskell
--                          ^^ meta.other.unknown.haskell
--                            ^ punctuation.section.sequence.end.haskell

    import Data.List.Split (--
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^^^ keyword.declaration.import.haskell
--         ^^^^ variable.namespace.haskell - punctuation
--             ^ punctuation.accessor.dot.haskell - variable
--              ^^^^ variable.namespace.haskell - punctuation
--                  ^ punctuation.accessor.dot.haskell - variable
--                   ^^^^^ variable.namespace.haskell - punctuation
--                         ^^^^^ meta.sequence.tuple.haskell
--                         ^ punctuation.section.sequence.begin.haskell
--                          ^^^ comment.line.double-dash.haskell
--                          ^^ punctuation.definition.comment.haskell
                            )
--                          ^ punctuation.section.sequence.end.haskell

    import Data.List.Split (--)
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^^^ keyword.declaration.import.haskell
--         ^^^^ variable.namespace.haskell - punctuation
--             ^ punctuation.accessor.dot.haskell - variable
--              ^^^^ variable.namespace.haskell - punctuation
--                  ^ punctuation.accessor.dot.haskell - variable
--                   ^^^^^ variable.namespace.haskell - punctuation
--                         ^^^^^ meta.sequence.tuple.haskell
--                         ^ punctuation.section.sequence.begin.haskell
--                          ^^^^ comment.line.double-dash.haskell
--                          ^^ punctuation.definition.comment.haskell
                            )
--                          ^ punctuation.section.sequence.end.haskell

    import Data.List.Split ((--))
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^^^ keyword.declaration.import.haskell
--         ^^^^ variable.namespace.haskell - punctuation
--             ^ punctuation.accessor.dot.haskell - variable
--              ^^^^ variable.namespace.haskell - punctuation
--                  ^ punctuation.accessor.dot.haskell - variable
--                   ^^^^^ variable.namespace.haskell - punctuation
--                         ^^^^^^^ meta.sequence.tuple.haskell
--                         ^ punctuation.section.sequence.begin.haskell
--                           ^^^^^ comment.line.double-dash.haskell
--                           ^^ punctuation.definition.comment.haskell
                            )
--                          ^ punctuation.section.sequence.end.haskell

    import Data.List.Split ((--])
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^^^ keyword.declaration.import.haskell
--         ^^^^ variable.namespace.haskell - punctuation
--             ^ punctuation.accessor.dot.haskell - variable
--              ^^^^ variable.namespace.haskell - punctuation
--                  ^ punctuation.accessor.dot.haskell - variable
--                   ^^^^^ variable.namespace.haskell - punctuation
--                         ^^^^^^^ meta.sequence.tuple.haskell
--                         ^ punctuation.section.sequence.begin.haskell
--                           ^^^^^ comment.line.double-dash.haskell
--                           ^^ punctuation.definition.comment.haskell
                            )
--                          ^ punctuation.section.sequence.end.haskell

    import Data.List.Split ((--")
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.import.haskell
--  ^^^^^^ keyword.declaration.import.haskell
--         ^^^^ variable.namespace.haskell - punctuation
--             ^ punctuation.accessor.dot.haskell - variable
--              ^^^^ variable.namespace.haskell - punctuation
--                  ^ punctuation.accessor.dot.haskell - variable
--                   ^^^^^ variable.namespace.haskell - punctuation
--                         ^^^^^^^ meta.sequence.tuple.haskell
--                         ^ punctuation.section.sequence.begin.haskell
--                           ^^^^^ comment.line.double-dash.haskell
--                           ^^ punctuation.definition.comment.haskell
                            )
--                          ^ punctuation.section.sequence.end.haskell


-- [ CLASS DECLARATIONS ] -----------------------------------------------------

    class
--  ^^^^^^ meta.declaration.class.haskell
--  ^^^^^ keyword.declaration.class.haskell

    class =>
--  ^^^^^^^^^ meta.declaration.class.haskell
--  ^^^^^ keyword.declaration.class.haskell
--        ^^ keyword.operator.big-arrow.haskell

    class QTyCls tyVar
--  ^^^^^^^^^^^^^^^^^^^ meta.declaration.class.haskell
--  ^^^^^ keyword.declaration.class.haskell
--        ^^^^^^ storage.type.haskell
--               ^^^^^ variable.other.generic-type.haskell

    class ModId.QTyCls tyVar1, tyVar2
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.class.haskell
--  ^^^^^ keyword.declaration.class.haskell
--        ^^^^^ variable.namespace.haskell
--             ^ punctuation.accessor.dot.haskell
--              ^^^^^^ storage.type.haskell
--                     ^^^^^^ variable.other.generic-type.haskell
--                           ^ punctuation.separator.sequence.haskell
--                             ^^^^^^ variable.other.generic-type.haskell

    class ModId.QTyCls tyVar1, tyVar2 =>
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.class.haskell
--  ^^^^^ keyword.declaration.class.haskell
--        ^^^^^ variable.namespace.haskell
--             ^ punctuation.accessor.dot.haskell
--              ^^^^^^ storage.type.haskell
--                     ^^^^^^ variable.other.generic-type.haskell
--                           ^ punctuation.separator.sequence.haskell
--                             ^^^^^^ variable.other.generic-type.haskell
--                                    ^^ keyword.operator.big-arrow.haskell

    class ModId.QTyCls tyVar1, tyVar2 => Traversable t
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.class.haskell
--  ^^^^^ keyword.declaration.class.haskell
--        ^^^^^ variable.namespace.haskell
--             ^ punctuation.accessor.dot.haskell
--              ^^^^^^ storage.type.haskell
--                     ^^^^^^ variable.other.generic-type.haskell
--                           ^ punctuation.separator.sequence.haskell
--                             ^^^^^^ variable.other.generic-type.haskell
--                                    ^^ keyword.operator.big-arrow.haskell
--                                       ^^^^^^^^^^^ support.class.prelude.haskell
--                                                   ^ variable.other.generic-type.haskell

    class () =>
--  ^^^^^^^^^^^^ meta.declaration.class.haskell
--  ^^^^^ keyword.declaration.class.haskell
--        ^^ meta.sequence.tuple.haskell
--        ^ punctuation.section.sequence.begin.haskell
--         ^ punctuation.section.sequence.end.haskell
--           ^^ keyword.operator.big-arrow.haskell

    class (Functor t, Foldable t) => Traversable t where
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.class.haskell
--  ^^^^^ keyword.declaration.class.haskell
--        ^ punctuation.section.sequence.begin.haskell
--         ^^^^^^^ support.class.prelude.haskell
--                 ^ variable.other.generic-type.haskell
--                  ^ punctuation.separator.sequence.haskell
--                    ^^^^^^^^ storage.type.haskell
--                             ^ variable.other.generic-type.haskell
--                              ^ punctuation.section.sequence.end.haskell
--                                ^^ keyword.operator.big-arrow.haskell
--                                   ^^^^^^^^^^^ support.class.prelude.haskell
--                                               ^ variable.other.generic-type.haskell
--                                                 ^^^^^ keyword.control.context.haskell

   'class
-- ^ keyword.operator.haskell
--  ^^^^^ keyword.declaration.class.haskell

    class'
--  ^^^^^^ - keyword


-- [ DEFAULT DECLARATIONS ] ---------------------------------------------------

    default
--  ^^^^^^^^ meta.declaration.default.haskell
--  ^^^^^^^ storage.modifier.haskell

   'default
-- ^ keyword.operator.haskell
--  ^^^^^^^ storage.modifier.haskell

    default'
--  ^^^^^^^^ - keyword

    default ()
--  ^^^^^^^^ meta.declaration.default.haskell - meta.sequence
--          ^^ meta.declaration.default.haskell meta.sequence.tuple.haskell
--  ^^^^^^^ storage.modifier.haskell
--          ^ punctuation.section.sequence.begin.haskell
--           ^ punctuation.section.sequence.end.haskell

    default (TyCls, ModId.QTyCls)
--  ^^^^^^^^ meta.declaration.default.haskell - meta.sequence
--          ^^^^^^^^^^^^^^^^^^^^^ meta.declaration.default.haskell meta.sequence.tuple.haskell
--  ^^^^^^^ storage.modifier.haskell
--          ^ punctuation.section.sequence.begin.haskell
--           ^^^^^ storage.type.haskell
--                ^ punctuation.separator.sequence.haskell
--                  ^^^^^ variable.namespace.haskell
--                       ^ punctuation.accessor.dot.haskell
--                        ^^^^^^ storage.type.haskell
--                              ^ punctuation.section.sequence.end.haskell


-- [ DERIVING DECLARATIONS ] --------------------------------------------------

    deriving
--  ^^^^^^^^^ meta.declaration.deriving.haskell
--  ^^^^^^^^ storage.modifier.haskell

   'deriving
-- ^ keyword.operator.haskell
--  ^^^^^^^^ storage.modifier.haskell

    deriving'
--  ^^^^^^^^^ - keyword

    deriving TyCls Const
--  ^^^^^^^^^^^^^^ meta.declaration.deriving.haskell
--                ^^^^^^ - meta.declaration
--  ^^^^^^^^ storage.modifier.haskell
--           ^^^^^ entity.other.inherited-class.haskell
--                 ^^^^^ constant.other.haskell

    deriving ModId.QTyCls ModId.Const
--  ^^^^^^^^^^^^^^^^^^^^^ meta.declaration.deriving.haskell
--                       ^^^^^^^^^^^^ - meta.declaration
--  ^^^^^^^^ storage.modifier.haskell
--           ^^^^^ variable.namespace.haskell
--                ^ punctuation.accessor.dot.haskell
--                 ^^^^^^ entity.other.inherited-class.haskell
--                        ^^^^^ variable.namespace.haskell
--                             ^ punctuation.accessor.dot.haskell
--                              ^^^^^ constant.other.haskell

    deriving ()
--  ^^^^^^^^^ meta.declaration.deriving.haskell - meta.sequence
--           ^^ meta.declaration.deriving.haskell meta.sequence.tuple.haskell
--             ^ - meta.declaration
--  ^^^^^^^^ storage.modifier.haskell
--           ^ punctuation.section.sequence.begin.haskell
--            ^ punctuation.section.sequence.end.haskell

    deriving (TyCls, ModId.QTyCls)
--  ^^^^^^^^^ meta.declaration.deriving.haskell - meta.sequence
--           ^^^^^^^^^^^^^^^^^^^^^ meta.declaration.deriving.haskell meta.sequence.tuple.haskell
--                                ^ - meta.declaration
--  ^^^^^^^^ storage.modifier.haskell
--           ^ punctuation.section.sequence.begin.haskell
--            ^^^^^ entity.other.inherited-class.haskell
--                 ^ punctuation.separator.sequence.haskell
--                   ^^^^^ variable.namespace.haskell
--                        ^ punctuation.accessor.dot.haskell
--                         ^^^^^^ entity.other.inherited-class.haskell
--                               ^ punctuation.section.sequence.end.haskell


-- [ TYPE DECLARATIONS ] ------------------------------------------------------

    type
--  ^^^^^ meta.declaration.type.haskell
--  ^^^^ keyword.declaration.type.haskell

   'type
-- ^ keyword.operator.haskell
--  ^^^^ keyword.declaration.type.haskell

    type'
--  ^^^^^ - keyword

    type QTyCls tyVar
--  ^^^^^^^^^^^^^^^^^^ meta.declaration.type.haskell
--  ^^^^ keyword.declaration.type.haskell
--       ^^^^^^ storage.type.haskell
--              ^^^^^ variable.other.generic-type.haskell

    type ModId.QTyCls tyVar1, tyVar2
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.type.haskell
--  ^^^^ keyword.declaration.type.haskell
--       ^^^^^ variable.namespace.haskell
--            ^ punctuation.accessor.dot.haskell
--             ^^^^^^ storage.type.haskell
--                    ^^^^^^ variable.other.generic-type.haskell
--                          ^ punctuation.separator.sequence.haskell
--                            ^^^^^^ variable.other.generic-type.haskell

    type ModId.QTyCls tyVar1, tyVar2 =
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.type.haskell
--  ^^^^ keyword.declaration.type.haskell
--       ^^^^^ variable.namespace.haskell
--            ^ punctuation.accessor.dot.haskell
--             ^^^^^^ storage.type.haskell
--                    ^^^^^^ variable.other.generic-type.haskell
--                          ^ punctuation.separator.sequence.haskell
--                            ^^^^^^ variable.other.generic-type.haskell

    type ModId.QTyCls tyVar1, tyVar2 deriving (Class1, QTyCls2)
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.type.haskell
--                                   ^^^^^^^^^ meta.declaration.deriving.haskell - meta.sequence
--                                            ^^^^^^^^^^^^^^^^^ meta.declaration.deriving.haskell meta.sequence.tuple.haskell
--                                                             ^ - meta.declaration
--  ^^^^ keyword.declaration.type.haskell
--       ^^^^^ variable.namespace.haskell
--            ^ punctuation.accessor.dot.haskell
--             ^^^^^^ storage.type.haskell
--                    ^^^^^^ variable.other.generic-type.haskell
--                          ^ punctuation.separator.sequence.haskell
--                            ^^^^^^ variable.other.generic-type.haskell
--                                   ^^^^^^^^ storage.modifier.haskell
--                                            ^ punctuation.section.sequence.begin.haskell
--                                             ^^^^^^ entity.other.inherited-class.haskell
--                                                   ^ punctuation.separator.sequence.haskell
--                                                     ^^^^^^^ entity.other.inherited-class.haskell
--                                                            ^ punctuation.section.sequence.end.haskell


-- [ NEWTYPE DECLARATIONS ] ---------------------------------------------------

    newtype
--  ^^^^^^^^ meta.declaration.type.haskell
--  ^^^^^^^ keyword.declaration.type.haskell

   'newtype
-- ^ keyword.operator.haskell
--  ^^^^^^^ keyword.declaration.type.haskell

    newtype'
--  ^^^^^^^^ - keyword

    newtype =
--  ^^^^^^^^ meta.declaration.type.haskell
--  ^^^^^^^ keyword.declaration.type.haskell
--          ^ keyword.operator.haskell

    newtype =>
--  ^^^^^^^^^^^ meta.declaration.type.haskell
--  ^^^^^^^ keyword.declaration.type.haskell
--          ^^ keyword.operator.big-arrow.haskell

    newtype TypCls tyVar =>
--  ^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.type.haskell
--  ^^^^^^^ keyword.declaration.type.haskell
--          ^^^^^^ storage.type.haskell
--                 ^^^^^ variable.other.generic-type.haskell
--                       ^^ keyword.operator.big-arrow.haskell

    newtype () => ModId.QTyCls tyVar1, tyVar2 deriving (Class1, QTyCls2)
--  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.type.haskell
--                                            ^^^^^^^^^ meta.declaration.deriving.haskell - meta.sequence
--                                                     ^^^^^^^^^^^^^^^^^ meta.declaration.deriving.haskell meta.sequence.tuple.haskell
--                                                                      ^ - meta.declaration
--  ^^^^ keyword.declaration.type.haskell
--          ^^ meta.sequence.tuple.haskell
--          ^ punctuation.section.sequence.begin.haskell
--           ^ punctuation.section.sequence.end.haskell
--             ^^ keyword.operator.big-arrow.haskell
--                ^^^^^ variable.namespace.haskell
--                     ^ punctuation.accessor.dot.haskell
--                      ^^^^^^ storage.type.haskell
--                             ^^^^^^ variable.other.generic-type.haskell
--                                   ^ punctuation.separator.sequence.haskell
--                                     ^^^^^^ variable.other.generic-type.haskell
--                                            ^^^^^^^^ storage.modifier.haskell
--                                                     ^ punctuation.section.sequence.begin.haskell
--                                                      ^^^^^^ entity.other.inherited-class.haskell
--                                                            ^ punctuation.separator.sequence.haskell
--                                                              ^^^^^^^ entity.other.inherited-class.haskell
--                                                                     ^ punctuation.section.sequence.end.haskell


-- [ DECLARATIONS ] -----------------------------------------------------------

-- | Map each element of a structure to an action,
-- evaluate these actions from left to right, and
-- collect the results. For a version that ignores
-- the results see 'Data.Foldable.traverse_'.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.double-dash.haskell

  data Record =
    Record {
        recordInt :: Int
      , recordString :: String
      , recordDouble :: Double
      , recordRational :: Rational
      } deriving (Eq, Ord, Generic)
--      ^^^^^^^^^ meta.declaration.deriving.haskell - meta.sequence
--               ^^^^^^^^^^^^^^^^^^ meta.declaration.deriving.haskell meta.sequence.tuple.haskell
--                                 ^ - meta.declaration.deriving - meta.sequence
--      ^^^^^^^^ storage.modifier.haskell
--               ^ punctuation.section.sequence.begin.haskell
--                ^^ support.class.prelude.haskell
--                  ^ punctuation.separator.sequence.haskell
--                    ^^^ support.class.prelude.haskell
--                       ^ punctuation.separator.sequence.haskell
--                         ^^^^^^^ entity.other.inherited-class.haskell
--                                ^ punctuation.section.sequence.end.haskell
        deriving (Read, Show) via (Quiet Record)
--      ^^^^^^^^^ meta.declaration.deriving.haskell - meta.sequence
--               ^^^^^^^^^^^^ meta.declaration.deriving.haskell meta.sequence.tuple.haskell
--                           ^ - meta.declaration.deriving - meta.sequence
--                            ^^^^ meta.declaration.deriving.haskell - meta.sequence
--                                ^^^^^^^^^^^^^^ meta.declaration.deriving.haskell meta.sequence.tuple.haskell
--                                              ^ - meta.declaration.deriving - meta.sequence
--      ^^^^^^^^ storage.modifier.haskell
--               ^ punctuation.section.sequence.begin.haskell
--                ^^^^ support.class.prelude.haskell
--                    ^ punctuation.separator.sequence.haskell
--                      ^^^^ support.class.prelude.haskell
--                          ^ punctuation.section.sequence.end.haskell
--                            ^^^ storage.modifier.haskell
--                                ^ punctuation.section.sequence.begin.haskell
--                                 ^^^^^ entity.other.inherited-class.haskell
--                                      ^ - entity
--                                       ^^^^^^ entity.other.inherited-class.haskell
--                                             ^ punctuation.section.sequence.end.haskell

   traverse :: Applicative f =>
-- ^^^^^^^^ entity.name.function.haskell
--          ^^ keyword.operator.double-colon.haskell
--             ^^^^^^^^^^^ support.class.prelude.haskell
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.type-declaration.haskell
--                           ^^ keyword.operator.big-arrow.haskell
    (a -> f b)
-- ^^^^^^^^^^^^ meta.function.type-declaration.haskell
--     ^^ keyword.operator.arrow.haskell
    -> t a
-- ^^^^^^^^ meta.function.type-declaration.haskell
--  ^^ keyword.operator.arrow.haskell
    -> f (t b)
-- ^^^^^^^^^^^^ meta.function.type-declaration.haskell
--  ^^ keyword.operator.arrow.haskell
   traverse f = sequenceA . fmap f
--            ^ keyword.operator.haskell
--                        ^ keyword.operator.haskell

-- | Evaluate each action in the structure from
-- left to right, and collect the results.
-- For a version that ignores the results see
-- 'Data.Foldable.sequenceA_'.
   sequenceA ∷ Applicative f ⇒ t (f a) → f (t a)
-- ^^^^^^^^^ entity.name.function.haskell
--           ^ keyword.operator.double-colon.haskell
--             ^^^^^^^^^^^ support.class.prelude.haskell
--                           ^ keyword.operator.big-arrow.haskell
--                                     ^ keyword.operator.arrow.haskell
   sequenceA = traverse id
--           ^ keyword.operator.haskell

   if'
-- ^^^ - keyword

-- Tests for #1320, #1880.

   class TooMany a where
     tooMany :: a -> Bool
-- ^^^^^^^^^^^^^^^^^^^^^^ meta.function.type-declaration.haskell
     tooManyToo ::
-- ^^^^^^^^^^^^^^^ meta.function.type-declaration.haskell
       a -> Bool
-- ^^^^^^^^^^^^^ meta.function.type-declaration.haskell

   instance TooMany Int where
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.instance.haskell
-- ^^^^^^^^ keyword.declaration..haskell
--                      ^^^^^ keyword.control.context.haskell
     tooMany n = n > 42

   foldBoolGuard :: a -> a -> Bool -> a
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.type-declaration.haskell
   foldBoolGuard x y z
-- ^^^^^^^^^^^^^^^^^^^ source.haskell
     | z         = y
--   ^ keyword.operator.haskell
     | otherwise = x

   countTheBeforeVowel :: String
   -- This comment should not interrupt the type signature.

   -- The blank line above should not interrupt the type signature.

   {-
      This multiline comment should
      not interrupt the type signature.
   -}

     -> Integer
-- ^^^^^^^^^^^^ meta.function.type-declaration.haskell
   countTheBeforeVowel = undefined


-- [ IDENTS ] -----------------------------------------------------------------

    _
--  ^ variable.language.anonymous.haskell

    a
--  ^ meta.name.haskell

    _a
--  ^^ meta.name.haskell

    _'
--  ^^ meta.name.haskell

    a'
--  ^^ meta.name.haskell

    _a'b'c_D'0123456789'
--  ^^^^^^^^^^^^^^^^^^^^ meta.name.haskell

    genericIdent
--  ^^^^^^^^^^^^ meta.name.haskell

    ý ĳ ǚ ǣ
--  ^ meta.name.haskell
--   ^ - meta.name
--    ^ meta.name.haskell
--     ^ - meta.name
--      ^ meta.name.haskell
--       ^ - meta.name
--        ^ meta.name.haskell
--         ^ - meta.name

    T.a
--  ^ variable.namespace.haskell
--   ^ punctuation.accessor.dot.haskell
--    ^ meta.name.haskell

    T . a
--  ^ constant.other.haskell
--    ^ keyword.operator.haskell
--      ^ meta.name.haskell

    map (flip (/)) [1..]
--  ^^^ support.function.prelude.haskell
--       ^^^^ meta.group.haskell support.function.prelude.haskell


-- [ KEYWORDS ] ---------------------------------------------------------------

   deriving instance FromJSON Amount
-- ^^^^^^^^ storage.modifier.haskell
   deriving instance FromJSON Ask
--          ^^^^^^^^ meta.declaration.instance.haskell keyword.declaration.haskell

test =
--   ^ keyword.operator.haskell
    let x = 2 in x * y
--  ^^^ keyword.declaration.variable.haskell
--            ^^ keyword.control.context.haskell
    where
--  ^^^^^ keyword.declaration.variable.haskell
        y = 1
--        ^ keyword.operator.haskell

test a = case a of
--       ^^^^ keyword.control.conditional.select.haskell
--              ^^ keyword.control.conditional.select.haskell
    Nothing -> 0
    Just n -> if n > 0
--            ^^ keyword.control.conditional.if.haskell
        then n
--      ^^^^ keyword.control.conditional.then.haskell
        else 0
--      ^^^^ keyword.control.conditional.else.haskell

main = do
--     ^^ keyword.control.context.haskell
    return ()
--  ^^^^^^ keyword.control.flow.return.haskell


-- [ BLOCKS / GROUPS / LISTS / TUPLES ] ---------------------------------------

    {}
-- ^ - meta.block
--  ^^ meta.block.haskell
--    ^ - meta.block
--  ^ punctuation.section.block.begin.haskell
--   ^ punctuation.section.block.end.haskell

    {;}
-- ^ - meta.block
--  ^^^ meta.block.haskell
--     ^ - meta.block
--  ^ punctuation.section.block.begin.haskell
--   ^ punctuation.terminator.statement.haskell
--    ^ punctuation.section.block.end.haskell

    []
-- ^ - meta.sequence
--  ^^ meta.sequence.list.haskell
--    ^ - meta.sequence
--  ^ punctuation.section.sequence.begin.haskell
--   ^ punctuation.section.sequence.end.haskell

    [,]
-- ^ - meta.sequence
--  ^^^ meta.sequence.list.haskell
--     ^ - meta.sequence
--  ^ punctuation.section.sequence.begin.haskell
--   ^ punctuation.separator.sequence.haskell
--    ^ punctuation.section.sequence.end.haskell

    [,,]
-- ^ - meta.sequence
--  ^^^^ meta.sequence.list.haskell
--      ^ - meta.sequence
--  ^ punctuation.section.sequence.begin.haskell
--   ^^ punctuation.separator.sequence.haskell
--     ^ punctuation.section.sequence.end.haskell

    [1,2,a,b','c',..]
-- ^ - meta.sequence
--  ^^^^^^^^^^^^^^^^^ meta.sequence.list.haskell
--                   ^ - meta.sequence
--  ^ punctuation.section.sequence.begin.haskell
--   ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--    ^ punctuation.separator.sequence.haskell
--     ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--      ^ punctuation.separator.sequence.haskell
--       ^ meta.name.haskell
--        ^ punctuation.separator.sequence.haskell
--         ^^ meta.name.haskell
--           ^ punctuation.separator.sequence.haskell
--            ^^^ meta.string.haskell string.quoted.single.haskell
--               ^ punctuation.separator.sequence.haskell
--                ^^ keyword.operator.haskell
--                  ^ punctuation.section.sequence.end.haskell

--  List comprehension

    [ x | xs <- [ [(1,2),(3,4)], [(5,4),(3,2)] ], (3,x) <- xs ]
-- ^ - meta.sequence
--  ^^^^^^^^^^^^ meta.sequence.list.haskell - meta.sequence meta.sequence
--              ^^ meta.sequence.list.haskell meta.sequence.list.haskell - meta.sequence meta.sequence meta.sequence
--                ^ meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.list.haskell - meta.sequence meta.sequence meta.sequence meta.sequence
--                 ^^^^^ meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.tuple.haskell
--                      ^ meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.list.haskell - meta.sequence meta.sequence meta.sequence meta.sequence
--                       ^^^^^ meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.tuple.haskell
--                            ^ meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.list.haskell - meta.sequence meta.sequence meta.sequence meta.sequence
--                             ^^ meta.sequence.list.haskell meta.sequence.list.haskell - meta.sequence meta.sequence meta.sequence
--                               ^ meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.list.haskell - meta.sequence meta.sequence meta.sequence meta.sequence
--                                ^^^^^ meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.tuple.haskell
--                                     ^ meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.list.haskell - meta.sequence meta.sequence meta.sequence meta.sequence
--                                      ^^^^^ meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.tuple.haskell
--                                           ^ meta.sequence.list.haskell meta.sequence.list.haskell meta.sequence.list.haskell - meta.sequence meta.sequence meta.sequence meta.sequence
--                                            ^^ meta.sequence.list.haskell meta.sequence.list.haskell - meta.sequence meta.sequence meta.sequence
--                                              ^^ meta.sequence.list.haskell - meta.sequence meta.sequence
--                                                ^^^^^ meta.sequence.list.haskell meta.sequence.tuple.haskell
--                                                     ^^^^^^^^ meta.sequence.list.haskell - meta.sequence meta.sequence
--                                                             ^ - meta.sequence
--  ^ punctuation.section.sequence.begin.haskell
--    ^ meta.name.haskell
--      ^ keyword.operator.haskell
--        ^^ meta.name.haskell
--           ^^ keyword.operator.haskell
--              ^ punctuation.section.sequence.begin.haskell
--                ^ punctuation.section.sequence.begin.haskell
--                 ^ punctuation.section.sequence.begin.haskell
--                  ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--                   ^ punctuation.separator.sequence.haskell
--                    ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--                     ^ punctuation.section.sequence.end.haskell
--                      ^ punctuation.separator.sequence.haskell
--                       ^ punctuation.section.sequence.begin.haskell
--                        ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--                         ^ punctuation.separator.sequence.haskell
--                          ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--                           ^^ punctuation.section.sequence.end.haskell
--                             ^ punctuation.separator.sequence.haskell
--                               ^ punctuation.section.sequence.begin.haskell
--                                ^ punctuation.section.sequence.begin.haskell
--                                 ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--                                  ^ punctuation.separator.sequence.haskell
--                                   ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--                                    ^ punctuation.section.sequence.end.haskell
--                                     ^ punctuation.separator.sequence.haskell
--                                      ^ punctuation.section.sequence.begin.haskell
--                                       ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--                                        ^ punctuation.separator.sequence.haskell
--                                         ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--                                          ^^ punctuation.section.sequence.end.haskell
--                                             ^ punctuation.section.sequence.end.haskell
--                                              ^ punctuation.separator.sequence.haskell
--                                                ^ punctuation.section.sequence.begin.haskell
--                                                 ^ constant.numeric.value.haskell
--                                                  ^ punctuation.separator.sequence.haskell
--                                                   ^ meta.name.haskell
--                                                    ^ punctuation.section.sequence.end.haskell
--                                                      ^^ keyword.operator.haskell
--                                                         ^^ meta.name.haskell
--                                                            ^ punctuation.section.sequence.end.haskell
--

    ()
-- ^ - meta.sequence
--  ^^ meta.sequence.tuple.haskell
--    ^ - meta.sequence
--  ^ punctuation.section.sequence.begin.haskell
--   ^ punctuation.section.sequence.end.haskell

    (,)
-- ^ - meta.sequence
--  ^^^ meta.sequence.tuple.haskell
--     ^ - meta.sequence
--  ^ punctuation.section.sequence.begin.haskell
--    ^ punctuation.section.sequence.end.haskell

    (#,#)
-- ^ - meta.sequence
--  ^^^^^ meta.sequence.tuple.haskell
--       ^ - meta.sequence
--  ^ punctuation.section.sequence.begin.haskell
--   ^ keyword.operator.haskell
--     ^ keyword.operator.haskell
--      ^ punctuation.section.sequence.end.haskell

    ( , , )
-- ^ - meta.sequence
--  ^^^^^^^ meta.sequence.tuple.haskell
--         ^ - meta.sequence
--  ^ punctuation.section.sequence.begin.haskell
--        ^ punctuation.section.sequence.end.haskell

    (# , , #)
-- ^ - meta.sequence
--  ^^^^^^^^^ meta.sequence.tuple.haskell
--           ^ - meta.sequence
--  ^ punctuation.section.sequence.begin.haskell
--   ^ keyword.operator.haskell
--         ^ keyword.operator.haskell
--          ^ punctuation.section.sequence.end.haskell

    (group,)
--  ^^^^^^^^ meta.sequence.tuple.haskell
--  ^ punctuation.section.sequence.begin.haskell
--        ^ punctuation.separator.sequence.haskell
--         ^ punctuation.section.sequence.end.haskell

    (#group,#)
--  ^^^^^^^^^^ meta.sequence.tuple.haskell
--  ^ punctuation.section.sequence.begin.haskell
--   ^ keyword.operator.haskell
--         ^ punctuation.separator.sequence.haskell
--          ^ keyword.operator.haskell
--           ^ punctuation.section.sequence.end.haskell

    (group)
--  ^^^^^^^ meta.group.haskell
--  ^ punctuation.section.group.begin.haskell
--        ^ punctuation.section.group.end.haskell


-- [ LITERAL NUMBERS ] --------------------------------------------------------

    0
--  ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell

    1234567890
--  ^^^^^^^^^^ meta.number.integer.decimal.haskell constant.numeric.value.haskell

    0o1234567
--  ^^^^^^^^^ meta.number.integer.octal.haskell
--  ^^ constant.numeric.base.haskell
--    ^^^^^^^ constant.numeric.value.haskell

    1.
--  ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
--   ^ keyword.operator.haskell

    .2
--  ^ keyword.operator.haskell
--   ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell

    12.345
--  ^^^^^^ meta.number.float.decimal.haskell constant.numeric.value.haskell
--    ^ punctuation.separator.decimal

    1e10
--  ^^^^ meta.number.float.decimal.haskell constant.numeric.value.haskell

    0.5e+0
--  ^^^^^^ meta.number.float.decimal.haskell constant.numeric.value.haskell
--   ^ punctuation.separator.decimal.haskell

    9e-1
--  ^^^^ meta.number.float.decimal.haskell constant.numeric.value.haskell

    0x0
--  ^^^ meta.number.integer.hexadecimal.haskell
--  ^^ constant.numeric.base.haskell

    0XdeafBEEF42
--  ^^^^^^^^^^^^ meta.number.integer.hexadecimal.haskell
--  ^^ constant.numeric.base.haskell
--    ^^^^^^^^^^ constant.numeric.value.haskell


-- [ LITERAL CHARACTERS ] -----------------------------------------------------

    'a--'
--  ^^ meta.string.haskell string.quoted.single.haskell - comment
--  ^ punctuation.definition.string.begin.haskell
--   ^ constant.character.literal.haskell
--    ^^^^ comment.line.double-dash.haskell - string
--    ^^ punctuation.definition.comment.haskell

    'a'   -- literal character
--  ^^^ meta.string.haskell string.quoted.single.haskell
--  ^ punctuation.definition.string.begin.haskell
--   ^ constant.character.literal.haskell
--    ^ punctuation.definition.string.end.haskell

    '5'   -- literal digit character
--  ^^^ meta.string.haskell string.quoted.single.haskell
--  ^ punctuation.definition.string.begin.haskell
--   ^ constant.character.literal.haskell
--    ^ punctuation.definition.string.end.haskell

    '?'   -- literal symbol character
--  ^^^ meta.string.haskell string.quoted.single.haskell
--  ^ punctuation.definition.string.begin.haskell
--   ^ constant.character.literal.haskell
--    ^ punctuation.definition.string.end.haskell

    '\'' . '\"' . '\&' . '\\'  -- escape characters
--  ^^^^ meta.string.haskell string.quoted.single.haskell
--  ^ punctuation.definition.string.begin.haskell
--   ^^ constant.character.escape.haskell
--     ^ punctuation.definition.string.end.haskell
--         ^^^^ meta.string.haskell string.quoted.single.haskell
--         ^ punctuation.definition.string.begin.haskell
--          ^^ constant.character.escape.haskell
--            ^ punctuation.definition.string.end.haskell
--                ^^^^ meta.string.haskell string.quoted.single.haskell
--                ^ punctuation.definition.string.begin.haskell
--                 ^^ constant.character.escape.haskell
--                   ^ punctuation.definition.string.end.haskell
--                       ^^^^ meta.string.haskell string.quoted.single.haskell
--                       ^ punctuation.definition.string.begin.haskell
--                        ^^ constant.character.escape.haskell
--                          ^ punctuation.definition.string.end.haskell

    '\a' . '\b' . '\n' . '\f' . '\t' . '\v'  -- escape characters
--  ^^^^ meta.string.haskell string.quoted.single.haskell
--  ^ punctuation.definition.string.begin.haskell
--   ^^ constant.character.escape.haskell
--     ^ punctuation.definition.string.end.haskell
--      ^^^ - meta.string - string
--         ^^^^ meta.string.haskell string.quoted.single.haskell
--         ^ punctuation.definition.string.begin.haskell
--          ^^ constant.character.escape.haskell
--            ^ punctuation.definition.string.end.haskell
--             ^^^ - meta.string - string
--                ^^^^ meta.string.haskell string.quoted.single.haskell
--                ^ punctuation.definition.string.begin.haskell
--                 ^^ constant.character.escape.haskell
--                   ^ punctuation.definition.string.end.haskell
--                    ^^^ - meta.string - string
--                       ^^^^ meta.string.haskell string.quoted.single.haskell
--                       ^ punctuation.definition.string.begin.haskell
--                        ^^ constant.character.escape.haskell
--                          ^ punctuation.definition.string.end.haskell
--                           ^^^ - meta.string - string
--                              ^^^^ meta.string.haskell string.quoted.single.haskell
--                              ^ punctuation.definition.string.begin.haskell
--                               ^^ constant.character.escape.haskell
--                                 ^ punctuation.definition.string.end.haskell
--                                  ^^^ - meta.string - string
--                                     ^^^^ meta.string.haskell string.quoted.single.haskell
--                                     ^ punctuation.definition.string.begin.haskell
--                                      ^^ constant.character.escape.haskell
--                                        ^ punctuation.definition.string.end.haskell

    '\NUL' . '\SOH' . '\STX' . '\ETX' . '\EOT' . '\ENQ' . '\ACK'
--  ^^^^^^ meta.string.haskell string.quoted.single.haskell
--  ^ punctuation.definition.string.begin.haskell
--   ^^^^ constant.character.escape.haskell
--       ^ punctuation.definition.string.end.haskell
--        ^^^ - meta.string - string
--           ^^^^^^ meta.string.haskell string.quoted.single.haskell
--           ^ punctuation.definition.string.begin.haskell
--            ^^^^ constant.character.escape.haskell
--                ^ punctuation.definition.string.end.haskell
--                 ^^^ - meta.string - string
--                    ^^^^^^ meta.string.haskell string.quoted.single.haskell
--                    ^ punctuation.definition.string.begin.haskell
--                     ^^^^ constant.character.escape.haskell
--                         ^ punctuation.definition.string.end.haskell
--                          ^^^ - meta.string - string
--                             ^^^^^^ meta.string.haskell string.quoted.single.haskell
--                             ^ punctuation.definition.string.begin.haskell
--                              ^^^^ constant.character.escape.haskell
--                                  ^ punctuation.definition.string.end.haskell
--                                   ^^^ - meta.string - string
--                                      ^^^^^^ meta.string.haskell string.quoted.single.haskell
--                                      ^ punctuation.definition.string.begin.haskell
--                                       ^^^^ constant.character.escape.haskell
--                                           ^ punctuation.definition.string.end.haskell
--                                            ^^^ - meta.string - string
--                                               ^^^^^^ meta.string.haskell string.quoted.single.haskell
--                                               ^ punctuation.definition.string.begin.haskell
--                                                ^^^^ constant.character.escape.haskell
--                                                    ^ punctuation.definition.string.end.haskell
--                                                     ^^^ - meta.string - string
--                                                        ^^^^^^ meta.string.haskell string.quoted.single.haskell
--                                                        ^ punctuation.definition.string.begin.haskell
--                                                         ^^^^ constant.character.escape.haskell
--                                                             ^ punctuation.definition.string.end.haskell
--                                                              ^ - meta.string - string

    '\0' '\1' '\2' '\3' '\4' '\5' '\6' '\7' '\8' '\9'
--  ^^^^ meta.string.haskell string.quoted.single.haskell
--  ^ punctuation.definition.string.begin.haskell
--   ^^ constant.character.escape.decimal.haskell
--     ^ punctuation.definition.string.end.haskell
--      ^ - meta.string - string
--       ^^^^ meta.string.haskell string.quoted.single.haskell
--       ^ punctuation.definition.string.begin.haskell
--        ^^ constant.character.escape.decimal.haskell
--          ^ punctuation.definition.string.end.haskell
--           ^ - meta.string - string
--            ^^^^ meta.string.haskell string.quoted.single.haskell
--            ^ punctuation.definition.string.begin.haskell
--             ^^ constant.character.escape.decimal.haskell
--               ^ punctuation.definition.string.end.haskell
--                ^ - meta.string - string
--                 ^^^^ meta.string.haskell string.quoted.single.haskell
--                 ^ punctuation.definition.string.begin.haskell
--                  ^^ constant.character.escape.decimal.haskell
--                    ^ punctuation.definition.string.end.haskell
--                     ^ - meta.string - string
--                      ^^^^ meta.string.haskell string.quoted.single.haskell
--                      ^ punctuation.definition.string.begin.haskell
--                       ^^ constant.character.escape.decimal.haskell
--                         ^ punctuation.definition.string.end.haskell
--                          ^ - meta.string - string
--                           ^^^^ meta.string.haskell string.quoted.single.haskell
--                           ^ punctuation.definition.string.begin.haskell
--                            ^^ constant.character.escape.decimal.haskell
--                              ^ punctuation.definition.string.end.haskell
--                               ^ - meta.string - string
--                                ^^^^ meta.string.haskell string.quoted.single.haskell
--                                ^ punctuation.definition.string.begin.haskell
--                                 ^^ constant.character.escape.decimal.haskell
--                                   ^ punctuation.definition.string.end.haskell
--                                    ^ - meta.string - string
--                                     ^^^^ meta.string.haskell string.quoted.single.haskell
--                                     ^ punctuation.definition.string.begin.haskell
--                                      ^^ constant.character.escape.decimal.haskell
--                                        ^ punctuation.definition.string.end.haskell
--                                         ^ - meta.string - string
--                                          ^^^^ meta.string.haskell string.quoted.single.haskell
--                                          ^ punctuation.definition.string.begin.haskell
--                                           ^^ constant.character.escape.decimal.haskell
--                                             ^ punctuation.definition.string.end.haskell
--                                              ^ - meta.string - string
--                                               ^^^^ meta.string.haskell string.quoted.single.haskell
--                                               ^ punctuation.definition.string.begin.haskell
--                                                ^^ constant.character.escape.decimal.haskell
--                                                  ^ punctuation.definition.string.end.haskell
--                                                   ^ - meta.string - string

    '\o0' '\o1' '\o2' '\o3' '\o4' '\o5' '\o6' '\o7'
--  ^^^^^ meta.string.haskell string.quoted.single.haskell
--  ^ punctuation.definition.string.begin.haskell
--   ^^^ constant.character.escape.octal.haskell
--      ^ punctuation.definition.string.end.haskell
--       ^ - meta.string - string
--        ^^^^^ meta.string.haskell string.quoted.single.haskell
--        ^ punctuation.definition.string.begin.haskell
--         ^^^ constant.character.escape.octal.haskell
--            ^ punctuation.definition.string.end.haskell
--             ^ - meta.string - string
--              ^^^^^ meta.string.haskell string.quoted.single.haskell
--              ^ punctuation.definition.string.begin.haskell
--               ^^^ constant.character.escape.octal.haskell
--                  ^ punctuation.definition.string.end.haskell
--                   ^ - meta.string - string
--                    ^^^^^ meta.string.haskell string.quoted.single.haskell
--                    ^ punctuation.definition.string.begin.haskell
--                     ^^^ constant.character.escape.octal.haskell
--                        ^ punctuation.definition.string.end.haskell
--                         ^ - meta.string - string
--                          ^^^^^ meta.string.haskell string.quoted.single.haskell
--                          ^ punctuation.definition.string.begin.haskell
--                           ^^^ constant.character.escape.octal.haskell
--                              ^ punctuation.definition.string.end.haskell
--                               ^ - meta.string - string
--                                ^^^^^ meta.string.haskell string.quoted.single.haskell
--                                ^ punctuation.definition.string.begin.haskell
--                                 ^^^ constant.character.escape.octal.haskell
--                                    ^ punctuation.definition.string.end.haskell
--                                     ^ - meta.string - string
--                                      ^^^^^ meta.string.haskell string.quoted.single.haskell
--                                      ^ punctuation.definition.string.begin.haskell
--                                       ^^^ constant.character.escape.octal.haskell
--                                          ^ punctuation.definition.string.end.haskell
--                                           ^ - meta.string - string
--                                            ^^^^^ meta.string.haskell string.quoted.single.haskell
--                                            ^ punctuation.definition.string.begin.haskell
--                                             ^^^ constant.character.escape.octal.haskell
--                                                ^ punctuation.definition.string.end.haskell
--                                                 ^ - meta.string - string

    '\x0' '\x1' '\x2' '\x3' '\x8' '\xA' '\xC' '\xF'
--  ^^^^^ meta.string.haskell string.quoted.single.haskell
--  ^ punctuation.definition.string.begin.haskell
--   ^^^ constant.character.escape.hexadecimal.haskell
--      ^ punctuation.definition.string.end.haskell
--       ^ - meta.string - string
--        ^^^^^ meta.string.haskell string.quoted.single.haskell
--        ^ punctuation.definition.string.begin.haskell
--         ^^^ constant.character.escape.hexadecimal.haskell
--            ^ punctuation.definition.string.end.haskell
--             ^ - meta.string - string
--              ^^^^^ meta.string.haskell string.quoted.single.haskell
--              ^ punctuation.definition.string.begin.haskell
--               ^^^ constant.character.escape.hexadecimal.haskell
--                  ^ punctuation.definition.string.end.haskell
--                   ^ - meta.string - string
--                    ^^^^^ meta.string.haskell string.quoted.single.haskell
--                    ^ punctuation.definition.string.begin.haskell
--                     ^^^ constant.character.escape.hexadecimal.haskell
--                        ^ punctuation.definition.string.end.haskell
--                         ^ - meta.string - string
--                          ^^^^^ meta.string.haskell string.quoted.single.haskell
--                          ^ punctuation.definition.string.begin.haskell
--                           ^^^ constant.character.escape.hexadecimal.haskell
--                              ^ punctuation.definition.string.end.haskell
--                               ^ - meta.string - string
--                                ^^^^^ meta.string.haskell string.quoted.single.haskell
--                                ^ punctuation.definition.string.begin.haskell
--                                 ^^^ constant.character.escape.hexadecimal.haskell
--                                    ^ punctuation.definition.string.end.haskell
--                                     ^ - meta.string - string
--                                      ^^^^^ meta.string.haskell string.quoted.single.haskell
--                                      ^ punctuation.definition.string.begin.haskell
--                                       ^^^ constant.character.escape.hexadecimal.haskell
--                                          ^ punctuation.definition.string.end.haskell
--                                           ^ - meta.string - string
--                                            ^^^^^ meta.string.haskell string.quoted.single.haskell
--                                            ^ punctuation.definition.string.begin.haskell
--                                             ^^^ constant.character.escape.hexadecimal.haskell
--                                                ^ punctuation.definition.string.end.haskell
--                                                 ^ - meta.string - string

    '^A' . '^Z' . '^@' . '^[' . '^]' . '^\' . '^^' . '^_'
--  ^^^^ meta.string.haskell string.quoted.single.haskell
--  ^ punctuation.definition.string.begin.haskell
--   ^^ constant.character.escape.control.haskell
--     ^ punctuation.definition.string.end.haskell
--      ^^^ - meta.string - string
--         ^^^^ meta.string.haskell string.quoted.single.haskell
--         ^ punctuation.definition.string.begin.haskell
--          ^^ constant.character.escape.control.haskell
--            ^ punctuation.definition.string.end.haskell
--             ^^^ - meta.string - string
--                ^^^^ meta.string.haskell string.quoted.single.haskell
--                ^ punctuation.definition.string.begin.haskell
--                 ^^ constant.character.escape.control.haskell
--                   ^ punctuation.definition.string.end.haskell
--                    ^^^ - meta.string - string
--                       ^^^^ meta.string.haskell string.quoted.single.haskell
--                       ^ punctuation.definition.string.begin.haskell
--                        ^^ constant.character.escape.control.haskell
--                          ^ punctuation.definition.string.end.haskell
--                           ^^^ - meta.string - string
--                              ^^^^ meta.string.haskell string.quoted.single.haskell
--                              ^ punctuation.definition.string.begin.haskell
--                               ^^ constant.character.escape.control.haskell
--                                 ^ punctuation.definition.string.end.haskell
--                                  ^^^ - meta.string - string
--                                     ^^^^ meta.string.haskell string.quoted.single.haskell
--                                     ^ punctuation.definition.string.begin.haskell
--                                      ^^ constant.character.escape.control.haskell
--                                        ^ punctuation.definition.string.end.haskell
--                                         ^^^ - meta.string - string
--                                            ^^^^ meta.string.haskell string.quoted.single.haskell
--                                            ^ punctuation.definition.string.begin.haskell
--                                             ^^ constant.character.escape.control.haskell
--                                               ^ punctuation.definition.string.end.haskell
--                                                ^^^ - meta.string - string
--                                                   ^^^^ meta.string.haskell string.quoted.single.haskell
--                                                   ^ punctuation.definition.string.begin.haskell
--                                                    ^^ constant.character.escape.control.haskell
--                                                      ^ punctuation.definition.string.end.haskell


-- [ NO LITEARL CHARACTERS ]---------------------------------------------------

    '
--  ^ - meta.string - string
--  ^ keyword.operator.haskell

    'a
--  ^^ - meta.string - string
--  ^ keyword.operator.haskell
--   ^ meta.name.haskell

    'ab'
--  ^^^^ - meta.string - string
--  ^ keyword.operator.haskell
--   ^^^ meta.name.haskell

    A' = A'
--  ^^^^^^^ - meta.string - string
--  ^^ constant.other.haskell - string
--     ^ keyword.operator.haskell
--       ^^ constant.other.haskell - string

    a' = b'
--  ^^^^^^^ - meta.string - string
--  ^^ meta.name.haskell - string
--     ^ keyword.operator.haskell
--       ^^ meta.name.haskell - string

    '\c' . '\z'
--  ^^^^^^^^^^^ - meta.string - string
--  ^^ keyword.operator.haskell
--    ^^ meta.name.haskell
--       ^ keyword.operator.haskell
--         ^^ keyword.operator.haskell
--           ^^ meta.name.haskell

    '\?'
--  ^^^^ keyword.operator.haskell - string

    '\129x'
--  ^^^^^^^ - meta.string - string
--  ^^ keyword.operator.haskell

    '\o8' '\o9'
--  ^^^^^^^^^^^ - meta.string - string - constant.character
--  ^^ keyword.operator.haskell
--    ^^^ meta.name.haskell
--        ^^ keyword.operator.haskell
--          ^^^ meta.name.haskell

    '\xG' '\xh'
--  ^^^^^^^^^^^ - meta.string - string - constant.character
--  ^^ keyword.operator.haskell
--    ^^^ meta.name.haskell
--        ^^ keyword.operator.haskell
--          ^^^ meta.name.haskell

    '^a' '^)'
--  ^^^^^^^^^ - meta.string - string - constant.character
--  ^^ keyword.operator.haskell
--    ^^ meta.name.haskell
--       ^^ keyword.operator.haskell
--          ^ keyword.operator.haskell


-- [ LITERAL STRINGS ]---------------------------------------------------------

    "\o129x\NUL"
--  ^^^^^^^^^^^^ meta.string.haskell string.quoted.double.haskell
--   ^^^^ constant.character.escape.octal.haskell
--       ^ - constant
--             ^ punctuation.definition.string.end.haskell
--         ^^^^ constant.character.escape.haskell

    "ok\"()--"'ab'
--  ^^^^^^^ meta.string.haskell string.quoted.double.haskell - comment
--         ^^^^^^^^ comment.line.double-dash.haskell - string
--  ^ punctuation.definition.string.begin.haskell
--     ^^ constant.character.escape.haskell
--         ^^ punctuation.definition.comment.haskell


-- [ INFIX OPERATORS ] --------------------------------------------------------

    .. : :: = \ <- | -> @ ~ =>

    a a = (+) a 2
--      ^ keyword.operator.haskell
--        ^^^ variable.function.infix.haskell
--         ^ keyword.operator.haskell
--              ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
    a a = (-) a 2
--      ^ keyword.operator.haskell
--        ^^^ variable.function.infix.haskell
--              ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
    a a = (*) a 2
--      ^ keyword.operator.haskell
--        ^^^ variable.function.infix.haskell
--              ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell
    a a = (/) a 2
--      ^ keyword.operator.haskell
--        ^^^ variable.function.infix.haskell
--              ^ meta.number.integer.decimal.haskell constant.numeric.value.haskell

    a a = (--) a 2
--      ^ keyword.operator.haskell
--        ^^^^ - variable.function.infix
--        ^ punctuation.section.group.begin.haskell
--         ^^^^^^^^ comment.line.double-dash.haskell
          )
--        ^ punctuation.section.group.end.haskell

    a a = (---) a 2
--      ^ keyword.operator.haskell
--        ^^^^^ - variable.function.infix
--        ^ punctuation.section.group.begin.haskell
--         ^^^^^^^^^ comment.line.double-dash.haskell
          )
--        ^ punctuation.section.group.end.haskell

    a `member` x
--    ^^^^^^^^ keyword.operator.function.infix.haskell
--    ^ punctuation.definition.function.begin.haskell
--           ^ punctuation.definition.function.end.haskell
    a `P.atan2` x
--    ^^^^^^^^^ keyword.operator.function.infix.haskell
--    ^ punctuation.definition.function.begin.haskell
--            ^ punctuation.definition.function.end.haskell

    5 `f `7`f`"3 'ab'"
--  ^ constant.numeric.value.haskell
--    ^^^^ keyword.operator.function.infix.haskell
--    ^ punctuation.definition.function.begin.haskell
--       ^ punctuation.definition.function.end.haskell
--        ^ constant.numeric.value.haskell
--         ^^^ keyword.operator.function.infix.haskell
--         ^ punctuation.definition.function.begin.haskell
--           ^ punctuation.definition.function.end.haskell
--            ^^^^^^^^ meta.string.haskell string.quoted.double.haskell
--            ^ punctuation.definition.string.begin.haskell
--             ^^^^^^ - constant - punctuation
--                   ^ punctuation.definition.string.end.haskell

    a ` f` b
--    ^^^^ keyword.operator.function.infix.haskell
--    ^ punctuation.definition.function.begin.haskell
--       ^ punctuation.definition.function.end.haskell

    a `--` b
--    ^ invalid.illegal.operator.haskell
--     ^^^^^^ comment.line.double-dash.haskell

    a `
--    ^ - keyword - operator - punctuation


-- [ INFIX OPERATORS IN CONTEXT ]----------------------------------------------

  data Outrageous =
      Flipper Record
    | Int :! Int
    | Double :@ Double
--            ^ keyword.operator.haskell
    | Int `Quux` Double
    | String :# Record
--            ^ keyword.operator.haskell
    | Simple :$ Outrageous
    | DontDoThis { outrageousInt :: Int, outrageousString :: String }
      deriving (Eq, Ord, Generic)
      deriving (Read, Show) via (Quiet Outrageous)

  genOutrageous :: Gen Outrageous
  genOutrageous =
    Gen.recursive Gen.choice [
        Flipper <$> genRecord
      , (:!) <$> genInt <*> genInt
      , (:@) <$> genDouble <*> genDouble
--       ^^ variable.function.infix.haskell keyword.operator.haskell
      , Quux <$> genInt <*> genDouble
      , (:#) <$> genString <*> genRecord
--       ^^ variable.function.infix.haskell keyword.operator.haskell
      , DontDoThis <$> genInt <*> genString
      ] [
        Gen.subtermM genOutrageous (\x -> (:$) <$> genSimple <*> pure x)
      ]

myManageHook = composeAll
  [ isDialog                   --> doFullFloat
--                             ^^^ keyword.operator
  , return True                --> doShift "1"
--                             ^^^ keyword.operator
  ]
