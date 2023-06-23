@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ORGEH'


define view entity ZI_READ_ORGEH_GJ
  as select from ZI_COMPANY1_GJ


{

        @EndUserText.label: '부서 코드'
  key   ZcOrgehCode,
        @EndUserText.label: '부서명'
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
