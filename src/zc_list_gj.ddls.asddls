@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FI Activity List Projection View'
@Metadata.allowExtensions: true
@Search.searchable: true
//@ObjectModel.semanticKey: [ 'zcpernrid' ]

define root view entity ZC_LIST_GJ
  as projection on ZI_LIST_GJ as LIST
{

          @EndUserText.label: 'UUID'
  key     ZcUUID,

          @EndUserText.label: '그룹 ID'
          @ObjectModel.text.element: ['ZcGroupName']
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
          _CONTENTS._AcId.ZcGroupId,

          @EndUserText.label: '그룹 명'
          _CONTENTS._AcId._group.ZcGroupName,

          @EndUserText.label: '컨텐츠 ID'
          zccontentid,

          @EndUserText.label: '결산 Activity ID'
          @ObjectModel.text.element: ['ZcAcTitle']
          _CONTENTS.ZcAcId,

          @EndUserText.label: '결산 Activity 내역'
          _CONTENTS._AcId.ZcAcTitle,

          @EndUserText.label: '부서코드'
          @ObjectModel.text.element: ['zcorgehname']
          _CONTENTS.ZcOrgehCode,

          @EndUserText.label: '부서명'
          _CONTENTS._Pernr.zcorgehname,

          @EndUserText.label: '담당자 사번'
          @ObjectModel.text.element: ['ZcEmpName']
          _CONTENTS.ZcPernrId,

          @EndUserText.label: '담당자'
          _CONTENTS._Pernr.ZcEmpName,

          @EndUserText.label: '결산기간'
          zcspmon,

          @EndUserText.label: '결산주기'
          _CONTENTS.zccycle,

          @EndUserText.label: '결산기한'
          _CONTENTS.zcday,

          @EndUserText.label: '연결 Tcode'
          _CONTENTS.zctcode,

          @EndUserText.label: '계획 완료일'
          zcplandate,

          @EndUserText.label: '계획 완료시간'
          zcplantime,

          @EndUserText.label: '실제 완료일'
          zcactuallydate,

          @EndUserText.label: '실제 완료시간'
          zcactuallytime,

          @EndUserText.label: '상태'
          @Consumption.valueHelpDefinition: [{
            entity : {name: 'ZI_READ_STATUS_GJ',
                      element: 'value_low' } }]
          @ObjectModel.text.element: ['StatusText']

          ZcStatus,
          ZcStatusCriticality,
          _read_status.text as StatusText,

          @EndUserText.label: '생성자'
          CreatedBy,

          @EndUserText.label: '생성일'
          CreatedAt,

          @EndUserText.label: '수정자'
          LastChangedBy,

          @EndUserText.label: '수정일'
          LastChangedAt

}
