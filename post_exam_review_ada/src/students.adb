with Ada.Text_IO;
with Ada.Exceptions;
with Review_Settings;
with busy_wait;
with Ada.Real_Time;
with waiting_room;

use Ada.Text_IO;
use Ada.Exceptions;
use Review_Settings;
use Ada.Real_Time;
use waiting_room;


package body students is
    task body task_stud is
        serial : Natural := 0;
        id : constant Students_Range := 0;
        Next_Time : Ada.Real_Time.Time;
      -- ...
    begin
      -- ...

      -- TODO: make this task periodic
         Next_Time := Ada.Real_Time.Clock + STUD_PERIOD;
      -- TODO

        loop
         -- TODO: make this task periodic
         delay until Next_Time;
         -- TODO
            -- ...

            Put_Line("S:"&id'img &" waiting..");
            -- TODO: student takes a seat here and waits for TA to call him
            waiting_room_protected.wait(id); -- student takes a seat
             door_protected.knock; -- wakes the TA up
            -- TODO

            serial := serial + 1;
            Put_Line("S:"&id'img &"(#" & serial'img &") in review");
            busy_wait.delay_for(TIME_REVIEW);
            Put_Line("S:"&id'img &" leaves");

         -- TODO: make this task periodic
         Next_Time := Next_Time + STUD_PERIOD;
         -- TODO
        end loop;
    exception
        when Error: others =>
            Put_Line("S:"&id'img &" terminates due to exception:");
            Put_Line (Exception_Information(Error));
            raise Program_Error;
    end task_stud;
end students;
