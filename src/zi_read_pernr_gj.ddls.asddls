@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Pernr ID 가져오기'
define root view entity ZI_READ_PERNR_GJ
  as select from ZI_PERNR_GJ
{
      @EndUserText.label: '담당자 사번'
  key ZcPernrId,
      @EndUserText.label: '담당자'
      ZcEmpName,
      @EndUserText.label: '부서코드'
      ZcOrgehCode,
      @EndUserText.label: '부서명'
      zcorgehname
}
