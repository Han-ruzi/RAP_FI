@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FI Activity Content Projection View'
@Metadata.allowExtensions: true
@Search.searchable: true


define root view entity ZC_CONTENT_GJ
  provider contract transactional_query
  as projection on ZI_CONTENTS_GJ as Content

{



          @EndUserText.label: 'UUID'
  key     ZcUUID,
          @EndUserText.label: '그룹 ID'
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
          @ObjectModel.text.element: ['ZcGroupName']
          _AcId.ZcGroupId          as GroupID,

          @EndUserText.label: '그룹 명'
          _AcId._group.ZcGroupName as ZcGroupName,

          @EndUserText.label: '결산 Activity ID'
          //          @ObjectModel.text.element: ['ZcAcTitle']
          ZcAcId,

          @EndUserText.label: '결산 Activity 내역'
          _AcId.ZcAcTitle          as ZcAcTitle,

          @EndUserText.label: '컨텐츠 ID'
          ZcContentId,

          @EndUserText.label: '부서코드'
          @ObjectModel.text.element: ['zcorgehname']
          _Pernr.ZcOrgehCode,

          @EndUserText.label: '부서명'
          _Pernr.zcorgehname,

          @EndUserText.label: '담당자 사번'
          ZcPernrId,

          @EndUserText.label: '담당자'
          _Pernr.ZcEmpName,

          @EndUserText.label: '결산주기'
          zccycle,

          @EndUserText.label: '결산기한'
          zcday,

          @EndUserText.label: '연결 Tcode'
          zctcode,

          @EndUserText.label: '상태'
          @Consumption.valueHelpDefinition: [{
            entity : {name: 'ZI_READ_STATUS_GJ',
                      element: 'value_low' } }]
          @ObjectModel.text.element: ['StatusText']

          ZcStatus,
          ZcStatusCriticality,
          _read_status.text        as StatusText,

          @EndUserText.label: '생성자'
          CreatedBy,

          @EndUserText.label: '생성일'
          CreatedAt,

          @EndUserText.label: '수정자'
          LastChangedBy,

          @EndUserText.label: '수정일'
          LastChangedAt,


          /* Associations */
          _AcId,
          _Pernr,
          _read_status,
          _qv_pernr


}
