with Review_Settings;
use Review_Settings;

package body waiting_room is
   -- this protected object queues the students (entry wait). TA can review a Student when a "student_is_waiting"
   -- TODO: not sure if synchronization works (between students and TA.. that student stays in queue until TA is ready again.
   protected body waiting_room_protected is
      procedure review_Student ( stud_id : out Students_Range ) is
      begin
         ta_is_ready := false;
         student_is_waiting := false;
         stiud_id := actual_student_id;

      end review_Student;

      procedure ta_ready is
      begin

         ta_is_ready := true;

      end ta_ready;

      entry wait ( stud_id : in Students_Range ) when ta_is_ready is
      begin

         student_is_waiting := true;
         actual_student_id := stud_id;

      end wait;
   end waiting_room_protected;

   -- this protected body wakes the TA when a "student_knocks" on the door of the TA's office
   protected body door_protected is
      entry sleep when student_knocks is
      begin
         -- woke up
         student_knocks := false;
      end sleep;

      procedure knock is
      begin
         student_knocks := true;
      end knock;
   end door_protected;

end waiting_room;
