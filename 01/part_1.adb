with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure part_1 is
	fname : constant String := "input.txt";
	last_value : Integer := 0;
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
		begin
			if last_value > 0 then
				Ada.Text_IO.Put (line);
				if value > last_value then
					Ada.Text_IO.Put_Line (" (increased)");
					increases := increases + 1;
				elsif value < last_value then
					Ada.Text_IO.Put_Line (" (decreased)");
					decreases := decreases + 1;
				else
					Ada.Text_IO.Put_Line (" (no change)");
				end if;
			else
				Ada.Text_IO.Put_Line (line);
			end if;
			last_value := value;
		end;
	end loop;
	Ada.Text_IO.Close (infp);
	Ada.Text_IO.Put_Line ("Increases: " & Integer'Image(increases));
	Ada.Text_IO.Put_Line ("Decreases: " & Integer'Image(decreases));
end part_1;
