with Review_Settings;
use Review_Settings;

package waiting_room is
   protected waiting_room_protected is
      procedure review_Student ( stud_id : out Students_Range );
      entry wait ( stud_id : in Students_Range );
      procedure ta_ready;

   private
      student_is_waiting : Boolean := false ;
      ta_is_ready : Boolean := false;
      actual_student_id: Students_Range := 0;

   end waiting_room_protected;

   protected door_protected is
      entry sleep;
      procedure knock;

   private
      student_knocks : Boolean := false;
   end door_protected;

end waiting_room;
