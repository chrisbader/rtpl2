with Ada.Real_Time;
use Ada.Real_Time;

package busy_wait is
    -- this function does nothing apart from consuming the specified
    -- amount of time and then return. The calling process will not
    -- be suspended, but stay in a busy wait/spinlock.
    procedure delay_for(dt : Time_Span);
end busy_wait;
