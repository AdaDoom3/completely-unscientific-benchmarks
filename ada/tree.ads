with Ada.Numerics.Discrete_Random;
with Ada.Unchecked_Deallocation;

package Trees is

  type Node_Type is private;
  type Node_Ptr is access Node_Type;
  type Node_Type is record
      Left, Right : Node_Ptr;
      X, Y        : Integer;
    end record;

  type Tree_Type is record
      Root : Node_Ptr;
    end record;

  function Has_Value (T : in out Tree_Type; Item : Integer) return Boolean;
  procedure Insert   (T : in out Tree_Type; Item : Integer);
  procedure Erase    (T : in out Tree_Type; Item : Integer);

private

  function Merge (Lower, Greater        : Node_Ptr) return Node_Ptr;
  function Merge (Lower, Equal, Greater : Node_Ptr) return Node_Ptr;

  procedure Split (Orig : Node_Ptr; Lower, Greater_Or_Equal : in out Node_Ptr; Val : Integer);
  procedure Split (Orig : Node_Ptr; Lower, Equal, Greater   : in out Node_Ptr; Val : Integer);

  package Integer_Random is new Ada.Numerics.Discrete_Random (Integer);
  use Integer_Random;
  procedure Free is new Ada.Unchecked_Deallocation (Node, Node_Ptr);

  G : Integer_Random.Generator;
end;
