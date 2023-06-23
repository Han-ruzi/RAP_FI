@EndUserText.label: '분류 타입 도메인 가져오기'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_READ_TYPE_GJ 
    as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZD_GROUP_TYPE_GJ')
{
  key domain_name,
  key value_position,
      @Semantics.language: true
  key language,
      value_low,
      @Semantics.text: true
      text

}
