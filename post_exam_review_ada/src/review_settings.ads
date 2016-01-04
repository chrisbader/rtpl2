with Ada.Real_Time;

package Review_Settings is
    -----------------
    -- CONSTANTS
    -----------------
    STUD_PERIOD : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(100); -- student stream: how often a student arrives
    TIME_REVIEW : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(14); -- how long the review takes
    TIME_WALK : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(3); -- how long the TA or student need to change rooms
    TA_MINT : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(30); -- minimum inter-arrival time for TA process
    N_SEATS : constant Integer := 3; -- how many seats in the waiting room

    -----------------
    -- TYPE DEFS
    -----------------
    subtype Students_Range is Integer range 0 .. N_SEATS - 1; -- when students are iterated
    type Seat_Range is mod N_SEATS; -- when seats are iterated
end Review_Settings;
