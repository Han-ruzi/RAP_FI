@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '상태 도메인 값 가져오기'
define root view entity ZI_READ_STATUS
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZD_STATUS_GJ' )
{
  key domain_name,
  key value_position,
      @Semantics.language: true
  key language,
      value_low,
      @Semantics.text: true
      text
}
