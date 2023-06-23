CLASS lhc_ZI_MASTER_GJ DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_master_gj RESULT result.


    METHODS check_value_key FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_master_gj~check_value_key.
    METHODS initstatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zi_master_gj~initstatus.

ENDCLASS.

CLASS lhc_ZI_MASTER_GJ IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD Check_value_key.


    READ ENTITIES OF zi_master_Gj IN LOCAL MODE
      ENTITY zi_master_gj
      FIELDS ( ZcGroupId ) WITH CORRESPONDING #( keys )
      RESULT DATA(GroupID).

    LOOP AT groupid ASSIGNING FIELD-SYMBOL(<f_groupid>).
      SELECT COUNT( * )
        FROM zi_fi_group_gj
        WHERE ZcGroupId = @<f_groupid>-ZcGroupId
        INTO @DATA(groupid_count).



      IF groupid_count = 0.

*        APPEND VALUE #(  %tky = <f_groupid>-%tky
*                         %state_area = 'Validate_group' ) TO reported-zi_master_gj.

        APPEND VALUE #( %tky = <f_groupid>-%tky ) TO failed-zi_master_gj.

        APPEND VALUE #( %tky = <f_groupid>-%tky
                        %state_area = 'Validate_Group'
                        %msg = new_message_with_text(
                                  severity = if_abap_behv_message=>severity-error
                                  text = '해당하는 Group이 없습니다.'

                                ) ) TO reported-zi_master_gj.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD initStatus.

    READ ENTITIES OF zi_master_gj IN LOCAL MODE
  ENTITY zi_master_gj
    FIELDS ( ZcStatus ) WITH CORRESPONDING #( keys )
    RESULT DATA(Status).


    DELETE Status WHERE ZcStatus IS NOT INITIAL.
    CHECK status IS NOT INITIAL.


    MODIFY ENTITIES OF zi_master_gj IN LOCAL MODE
      ENTITY zi_master_gj
        UPDATE
        FIELDS ( ZcStatus )
        WITH VALUE #( FOR Statu IN Status
                    ( %tky = statu-%tky
                      ZcStatus = 'N' )
                    )
    REPORTED DATA(Update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).

  ENDMETHOD.

ENDCLASS.
