CLASS lhc_ZI_FI_GROUP_GJ DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS initstatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zi_fi_group_gj~initstatus.
*    METHODS get_instance_features FOR INSTANCE FEATURES
*      IMPORTING keys REQUEST requested_features FOR zi_fi_group_gj RESULT result.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_fi_group_gj RESULT result.

ENDCLASS.

CLASS lhc_ZI_FI_GROUP_GJ IMPLEMENTATION.



  METHOD initStatus.

    READ ENTITIES OF zi_fi_group_gj IN LOCAL MODE
      ENTITY zi_fi_group_gj
        FIELDS ( ZcStatus ) WITH CORRESPONDING #( keys )
        RESULT DATA(Status).

    DELETE Status WHERE ZcStatus IS NOT INITIAL.
    CHECK status IS NOT INITIAL.


    MODIFY ENTITIES OF zi_fi_group_gj IN LOCAL MODE
      ENTITY zi_fi_group_gj
        UPDATE
        FIELDS ( ZcStatus )
        WITH VALUE #( FOR Statu IN Status
                   ( %tky = statu-%tky
                      ZcStatus = 'N' )
                    )
    REPORTED DATA(Update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).


  ENDMETHOD.

*  METHOD get_instance_features.
*  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.
