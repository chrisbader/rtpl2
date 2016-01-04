with Ada.Text_IO;
with Ada.Assertions;
with Ada.Exceptions;
with Review_Settings;
with busy_wait;
with waiting_room;

use Ada.Text_IO;
use Ada.Assertions;
use Ada.Exceptions;
use Review_Settings;
use waiting_room;

package body TA is

    task body task_TA is
        stud_cnt : Natural := 0; -- counts how many students the TA has processed
        id : Students_Range := 0; -- TODO: assign below in the loop
        -- ...

    begin
        Put_Line("TA was born");
        loop

            busy_wait.delay_for(TIME_WALK); -- ta is entering office or walking around a bit

            Put_Line("TA: waiting for student...");
            -- TODO: wait until student wakes me up, take student into review
            -- and also obtain the id of the student task
            waiting_room_protected.ta_ready;
            door_protected.sleep; -- waits for students

            waiting_room_protected.review_Student(id); -- takes student in review

            -- review
            stud_cnt := stud_cnt + 1;
            Put_Line("TA: in review with stud"&id'img&", total="&stud_cnt'img);
            busy_wait.delay_for(TIME_REVIEW);
            Put_Line("TA: finished student"&id'img);
        end loop;
    exception
        when Error: others =>
            Put_Line("TA: terminates due to exception:");
            Put_Line (Exception_Information(Error));
            raise Program_Error;
    end task_TA;

    -- ...

end TA;
