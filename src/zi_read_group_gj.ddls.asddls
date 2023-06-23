@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '그룹 ID 가져오기'
define root view entity ZI_READ_GROUP_GJ
  as select from ZI_FI_GROUP_GJ
{
  key ZcGroupId,
      @EndUserText.label: '분류명'
      ZcGroupName
}

where
  ZcStatus = 'Y'
