with Ada.Real_Time;
use Ada.Real_Time;

package body busy_wait is
    procedure delay_for(dt : Time_Span) is
        end_time : constant Time := Clock + dt;
        -- all ada programs are re-entrant, therefore this can be multi-threaded without any problems
    begin
        while Clock < end_time loop
          null;
        end loop;
    end delay_for;
end busy_wait;
