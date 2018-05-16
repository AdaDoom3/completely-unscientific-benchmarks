
package body Trees is

  -----------------
  -- Delete_Node --
  -----------------

  procedure Delete_Node (N : in out Node_Ptr) is
    begin
      if n /= null then
        if n.left /= null then delete_node(n.left); end if;
        if n.right /= null then delete_node(n.right); end if;
        free(n);
      end if;
    end;

  -----------
  -- Merge --
  -----------

  function Merge (lower, greater: NodePtr) return NodePtr is
    begin

      if lower = null then return greater; end if;
      if greater = null then return lower; end if;

      if lower.y < greater.y then
        lower.right := merge(lower.right, greater);
        return lower;
      else
        greater.left := merge(lower, greater.left);
        return greater;
      end if;  
    end;

  function Merge (lower, equal, greater: NodePtr) return NodePtr is
    begin
      return merge(merge(lower, equal), greater);
    end;

  -----------
  -- Split --
  -----------

  procedure Split (orig: NodePtr; lower, greaterOrEqual: in out NodePtr; val: Integer) is
    begin
      if orig = null then
        lower := null;
        greaterOrEqual := null;
        return;
      end if;
      
      if orig.x < val then
        lower := orig;
        split(lower.right, lower.right, greaterOrEqual, val);
      else
        greaterOrEqual := orig;
        split(greaterOrEqual.left, lower, greaterOrEqual.left, val);
      end if;
    end;

  procedure Split (orig: Node_Ptr; lower, equal, greater: in out NodePtr; val: Integer) is
    Equal_Or_Greater : Node_Ptr;
    begin
      Split (orig, lower, equalOrGreater, val);
      Split (equalOrGreater, equal, greater, val + 1);
    end;

  ---------------
  -- Has_Value --
  ---------------

  function Has_Value (t: in out Tree; x: Integer) return Boolean is
    lower, equal, greater: NodePtr;
    begin
      split(t.root, lower, equal, greater, x);
      t.root := merge(lower, equal, greater);
      return equal /= null;
    end;

  ------------
  -- Insert --
  ------------

  procedure Insert (t: in out Tree; x: Integer) is
    lower, equal, greater: NodePtr;
    begin
      split(t.root, lower, equal, greater, x);

      if Equal = null then
        N   := new Node_Type;
        N.X := x;
        N.Y := Random (G);
      end if;
      t.root := merge(lower, equal, greater);
    end;

  -----------
  -- Erase --
  -----------

  procedure Erase (T : in out Tree_Type; Item : Integer) is
    lower, equal, greater: NodePtr;
    begin
      split(t.root, lower, equal, greater, x);
      t.root := merge(lower, greater);

      -- Node deletion doesn't seem to affect running time by much
      delete_node(equal);
    end;

--------------------
-- Initialization --
--------------------

begin
  Reset (G);
end;
