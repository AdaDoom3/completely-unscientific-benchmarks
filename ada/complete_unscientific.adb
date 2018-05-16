with Ada.Text_IO; use Ada.Text_IO;
with Trees;       use Trees;

procedure Complete_Unscientific is
  Tree   : Tree_Type;
  Cursor : Integer := 5;
  Result : Integer := 0;

begin
  for I in 1..999999 loop
    Cursor := (Cursor * 57 + 43) mod 10007;

    case I mod 3 is
      when 0 => Insert (Tree, Cursor);
      when 1 => Erase (Tree, Cursor);
      when others => 
        if Has_Value (Tree, Cursor) then
          Result := Result + 1;
        end if;
    end case;
  end loop;

  Put_Line (Result'Image);
end;
