CLASS zdelete DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZDELETE IMPLEMENTATION.


 METHOD if_oo_adt_classrun~main.

*    DATA itab TYPE TABLE OF ytravel_gj.
**   delete existing entries in the database table
    DELETE FROM Yfi_ac_group_gj.

**   output the result as a console message
out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).

  ENDMETHOD.
ENDCLASS.
