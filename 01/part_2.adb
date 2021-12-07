with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure part_2 is
	fname : constant String := "input.txt";
	last_value_1 : Integer := 0;
	last_value_2 : Integer := 0;
	last_value_3 : Integer := 0;
	last_sum : Integer := 0;
	infp : Ada.Text_IO.File_Type;
	increases : Integer := 0;
	decreases : Integer := 0;
begin
	Ada.Text_IO.Put_Line ("fname: " & fname);
	Ada.Text_IO.Open (infp, Ada.Text_IO.In_File, fname);
	while not End_Of_File (infp) loop
		declare
			line : String := Get_Line (infp);
			value : Integer := Integer'Value(line);
			sum : Integer;
		begin
			if last_value_3 > 0 then
				sum := last_value_1 + last_value_2 + last_value_3;
				-- Ada.Text_IO.Put (line);
				Ada.Text_IO.Put (Integer'Image(sum));
				if sum > last_sum then
					Ada.Text_IO.Put_Line (" (increased)");
					increases := increases + 1;
				elsif sum < last_sum then
					Ada.Text_IO.Put_Line (" (decreased)");
					decreases := decreases + 1;
				else
					Ada.Text_IO.Put_Line (" (no change)");
				end if;

				last_sum := sum;
			else
				Ada.Text_IO.Put_Line (line);
			end if;
			last_value_3 := last_value_2;
			last_value_2 := last_value_1;
			last_value_1 := value;
		end;
	end loop;
	Ada.Text_IO.Close (infp);
	Ada.Text_IO.Put_Line ("Increases: " & Integer'Image(increases));
	Ada.Text_IO.Put_Line ("Decreases: " & Integer'Image(decreases));
end part_2;
