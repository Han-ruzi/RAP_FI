@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Read Contentid'
define root view entity ZI_READ_CONTENTID_GJ
  as select from ZI_CONTENTS_GJ
{
      @UI.hidden: true
  key ZcUUID,

      @EndUserText.label: '컨텐츠 ID'
      ZcContentId,

      @EndUserText.label: '결산 Activity ID'
      ZcAcId,

      @EndUserText.label: '결산내역'
      _AcId.ZcAcTitle,

      @EndUserText.label: '그룹 ID'
      _AcId.ZcGroupId,

      @EndUserText.label: '그룹 이름'
      _AcId._group.ZcGroupName,

      @EndUserText.label: '담당자 사번'
      ZcPernrId,

      @EndUserText.label: '담당자'
      _Pernr.ZcEmpName,

      @EndUserText.label: '부서코드'
      _Pernr.ZcOrgehCode,
      @EndUserText.label: '부서명'
      _Pernr.zcorgehname,

      @EndUserText.label: '결산주기'
      zccycle,

      @EndUserText.label: '결산기한'
      zcday,

      @EndUserText.label: '연결 Tcode'
      zctcode,
      @UI.hidden: true
      ZcStatus,
      /* Associations */
      _AcId,
      _Pernr,
      _read_status
}

where
  ZcStatus = 'Y'
