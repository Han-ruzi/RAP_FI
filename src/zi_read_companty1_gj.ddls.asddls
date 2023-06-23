@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '담당자 사번'

define view entity ZI_READ_COMPANTY1_GJ
  as select from ZI_COMPANY1_GJ
{
  key   ZcOrgehCode,
        zcorgehname,
        @UI.hidden: true
        CreatedBy,
        @UI.hidden: true
        CreatedAt,
        @UI.hidden: true
        LastChangedBy,
        @UI.hidden: true
        LastChangedAt

        
}
