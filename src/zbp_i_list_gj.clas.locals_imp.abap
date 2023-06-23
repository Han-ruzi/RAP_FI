CLASS lhc_ZI_LIST_GJ DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_list_gj RESULT result.

    METHODS initStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zi_list_gj~initStatus.
    METHODS Check_value_key FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_list_gj~Check_value_key.

ENDCLASS.

CLASS lhc_ZI_LIST_GJ IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD initStatus.

    READ ENTITIES OF zi_list_gj IN LOCAL MODE
    ENTITY zi_list_gj
      FIELDS ( ZcStatus ) WITH CORRESPONDING #( keys )
      RESULT DATA(Status).

    DELETE Status WHERE ZcStatus IS NOT INITIAL.
    CHECK status IS NOT INITIAL.


    MODIFY ENTITIES OF zi_list_gj IN LOCAL MODE
      ENTITY zi_list_gj
        UPDATE
        FIELDS ( ZcStatus )
        WITH VALUE #( FOR Statu IN Status
                   ( %tky = statu-%tky
                      ZcStatus = 'N' )
                    )
    REPORTED DATA(Update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).


  ENDMETHOD.

  METHOD Check_value_key.

    READ ENTITIES OF zi_list_gj IN LOCAL MODE
       ENTITY zi_list_gj
       FIELDS ( zccontentid ) WITH CORRESPONDING #( keys )
       RESULT DATA(ids).

    LOOP AT ids ASSIGNING FIELD-SYMBOL(<id>).
      SELECT COUNT( * )
        FROM zi_contents_gj
        WHERE ZcContentId = @<id>-zccontentid
        INTO @DATA(lk_value).



      IF lk_value = 0.


        APPEND VALUE #( %tky = <id>-%tky ) TO failed-zi_list_gj.

        APPEND VALUE #( %tky = <id>-%tky
                        %state_area = 'Validate_Content'
                        %msg = new_message_with_text(
                                  severity = if_abap_behv_message=>severity-error
                                  text = '해당하는 컨텐츠 ID가 없습니다.'
                                ) ) TO reported-zi_list_gj.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
