------------------------SDT2      ����   D      SSF_CCF                                             --------------------------------------------------------------------------------------------------------------------------------------------------------ObjectName ----------------------------------------ObjectType ----------------------------------------!%&()LinkEndpoints --------------------------------!%()HeadingText -----------------------------------         	   	         3   ��������������������   ����SSF_CCF --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   ����13 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   ���� !
   
 ,  �   !       )[         (!
   6 K   �  !$    redefined
CallSegment_
Association)][ �      (!    ^  �  �  �  !"            �  �          ^  �  )[ ~      (!
   6 �  �  !        )[8         (!I   The CallSegmentAssociatio      6()[8        (!7    Redefined Block Type <<System Type CS2_INAP>> SSF_CCF)]}-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   M����()[         (!
    l  �  !
    2   2   !   ( I   )[ h       (!
   
 l  �  )[ k       (!
   6       )[ n       (!
   6    d   !
   
         )]][  q       (!
   6      )][9 u      (!
   6 �  d   !
   
         )[8         (!�    /**** PR      !%()PageOrder t -----------------------------------1  )PageOrder -------------------------------------2  ------------------------------------------------3 -------------------------------------------------   	   
   
   
            -��������������������   ����!%()HeadingText -----------------------------------2  )PageOrder -------------------------------------------------------------------------------------------------------------------------------------------   	   
--------      --------          --------   ����OCESS TYPE DEFINITIONS ****/

/* Note: All process type definitions are inherited from
IN CS-1 and redefined to incorporate the new functionality
required for IN CS-2.)]][? j      (!
   6 2   �  !
   
 ,  �   !       )[         (!
   6 K   �  !         	 redefined
Interface_
Handler)][ {      (!    ^  �  �  �  !"            �  �          ^  �  )[ x      (!
   6 �  �  !        )[8         (!>   The InterFaceHandler (IH) process type is extended to manage:
  - Processing of the IN CS-2      
 operations MoveCallSegments and CreateCSA.
  - The passing of new primitives between the Signalling Control
    Interface and the CSAs.
  - The passing of new primitives between the IN CS-2 SSF-SCF
    Interface and the CSA.)]]]][? U      (!
   6 2   �       (!   4 �  !   5    !   7     )[!        (!    1!       !   3    )[!        (!    2!       !   3    )[!        (!    3!       !   3    )[!        (!    4!       !   3    )]]]]}      (!    5!       !   3    )]]]]]}   �����()[         (!
    l  �  !
    2   2   !   ( l   )[ �       (!
   6 �   �   !
   
 @  �  )[         (!
   6 �   �   )[ �      (!
   6 �   �   !
   
         )]][          (!
   6 �  �   )][A 	      (!    -  �   -      !        !             )[         (!
   6 �  2   !    SCF)][`         (!    )][. 
      (!
   
         )[8         (!
   6 F     !    (CS2_INAP_To_SCF))]][         (!
   6 -      !    ����)][.       (!
   
         )[8         (!
   6 F  d   !    (CS2_INAP      _From_SCF))]][         (!
   6 -  �   !    Z   )][0       (!"    -  �   -  E  e  E  e  �  !"            e  �          -  �   )[         (!
   6 ~  �  !    SCF2_Interface)][.       (!
   
         )[8         (!
   6 �  �  !          (CS2_INAP_From_SCF))]][         (!
   6 e  �  !    Z   )][.       (!
   
         )[8         (!
   6    ^  !    (CS2_INAP_To_SCF))]][         (!
   6 -  �   !    ����)][; Q      (!
   6 e  �  )[         (!
   6 L    !    SCF)]][( �            (!
   6 �  �  !
   
 �  �   !       )[         (!
   6 L  ?  !    IH)][0       (!    �  X  �   X  !"            �   X          �  X  )[         (!
   6 w  &  !    SigCon2_Interface)][.       (!
   
         )[8         (      !
   6 �   q  !    (SigCon2_Out))]][         (!
   6 �   X  !    �   )][.       (!
   
         )[8         (!
   6 X  q  !    (SigCon2_In))]][         (!
   6 �  X  !        )][:       (!
   6 �  X  )[         (!
   6 �  ?  !          SigCon)]][A       (!    �   X      X  !        !       )[         (!
   6      !    SigCon)][`         (!    )][.       (!
   
         )[8         (!
   6    q  !    (Sig_
Con2_
_Out))]][         (!
   6     X  !    �   )][.             (!
   
         )[8         (!
   6 2   �  !    (Sig_
Con2_
_In))]][         (!
   6 �   X  !        )]]][0       (!      X  �  X  !"            �  X            X  )[         (!
   6 �  &  !    IBI2)][.       (!
   
               )[8         (!
   6 @  q  !    (IBI2))]][         (!
   6 �  X  !        )][.       (!
   
         )[8         (!
   6 F  q  !    (IBI2))]][         (!
   6   X  !    �   )][:       (!
   6   X  )[         (!
   6 �  ?        !    IBI)]][A !      (!    �  X  l  X  !        !       )[         (!
   6   &  !    IBI)][`         (!    )][. "      (!
   
         )[8         (!
   6 �  �  !    (IBI2))]][         (!
   6 l  X  !        )][. #      (!
         
         )[8         (!
   6 �  q  !    (IBI2))]][         (!
   6 �  X  !    �   )]]][0 $      (!    �  �     �     �  !"               �          �  �  )[         (!
   6 R  n  !    CSA2_Interface)][. %      (!
   
               )[8         (!
   6 R  �  !    (CSA2_In))]][         (!
   6    �  !    Z   )][. &      (!
   
         )[8         (!
   6 R     !    (CSA2_Out))]][         (!
   6 �  �  !    ����)][: �      (!
   6 �  �  )[         (!
   6 �        �  !    CSA)]][; ]      (!
   6    �  )[         (!
   6     !    IH)]][( �      (!
   6 X  �  !
   
 �  �   !       )[         (!
   6 �  3  !    CSA)][0 -      (!       �     x  !"               x             �  )[               (!
   6 8    !    CS2_Interface)][. .      (!
   
         )[8         (!
   6 9  F  !
    (CS2_In))]][         (!
   6    x  !    Z   )][. /      (!
   
         )[8         (!
   6 9  �  !    (CS2_Out))]][         (!
   6    �        !    ����)][: `      (!
   6    �  )[         (!
   6   ~  !    CS)]][; f      (!
   6    x  )[         (!
   6   �  !    CSA)]][( �      (!
   6 X  x  !
   
 �  �   !       )[         (!
   6   �  !    CS)][0 6      (!      'ST CS2_INAP_CS_IN =
  ContinueWithArgument,
  DisconnectForwardConnectionWithArgument,
  DisconnectLeg,
  RequestReportFacilityEvent,
  RequestReportUTSI,
  SendFacilityInformation,
  SendSTUI,
  SplitLeg;

SIGNALLIST CS2_INAP_CS_OUT =
  DisconnectLegResul      3 [         (!
    l  �  !
    2   2   !   ( 4   )[ �      (!
   6 �   �   !
   
 @  �  )[ �      (!
   6 �   �   )[ �      (!
   6 �   �   !
   
         )]][  �      (!
   6 �  �   )][9    
   
(!
   6    -    !
   
  ������������       (   ����NDSYNTYPE;)]][9 �      (!
   6 ,  L  !
   
         )[8         (!|   SIGNAL
  /* Signals for importing and exporting legs between CS and SSF-FSM. */
  ExportLegReq(LegType),
  ExportLegResp(EventRecordType),
  ImportLegReq(LegType,EventRecordType),
       !t,
  EntityReleased,
  ReportUTSI,
  SplitLegResult;)]][9 �      (!
   6 ^  �   !
   
         )[8         (!�   SIGNALLIST CS2_INAP_CSA_IN =
  ContinueWithArgument,
  CreateCallSegmentAssociation,
  DisconnectForwardConnectionWithArgument,
  Disconnec      tLeg,
  MergeCallSegments,
  MoveLeg,
  RequestReportFacilityEvent,
  RequestReportUTSI,
  SendFacilityInformation,
  SendSTUI,
  SplitLeg;

SIGNALLIST CS2_INAP_CSA_OUT =
  CreateCallSegmentAssociationResult,
  DisconnectLegResult,
  EntityReleased,
  Merg      %()[         (!
    l  �  !
    2   2   !   ( �   )[ �      (!
   
 l  �  )[ �      (!
   6       )[ �      (!
   6    d   !
   
         )]][  �      (!
   6      )][9 �      (!
   6   d   !
   
         )[8         (!>   SIGNALLI       ImportLegResp,

  /* Signals for importing and exporting legs between CSA and  CS. */
  CSExportLegReq(LegType),
  CSExportLegResp(ExportLegType),
  CSImportLegReq(LegType,ExportLegType),
  CSImportLegResp,

  /* Signal to change the value of the CS point      "er in the BCSMs when the leg
     has been moved into another call segment. */
  SetCS,

  /* Signals for importing and exporting call segments between IH and CSA. */
  ExportCSReq(CallSegmentID, ExportLegsType),
  ExportCSResp(ExportCSType),
  ImportCSReq      &SIGNALLIST CS2_INAP_SSF_OUT =
  DisconnectLegResult,
  ReportUTSI;)]][9 �      (!
   6   R  !
   
         )[8         (!   SIGNALLIST SSME2_In =
  (CS2_INAP_SSME_IN);

SIGNALLIST SSME2_Out =
  (CS2_INAP_SSME_OUT);

SIGNALLIST O_BCSM2_In =
  Network      @ !	    O_BCSM2)][. I      (!
   
         )[8         (!
   6 �   �  !    (O_BCSM2_Out))]][         (!
   6 �  @  !    ����)][. J      (!
   
         )[8         (!
   6 �   :  !    (O_BCSM2_In))]][         (!
   6 �  l  !    Z   )][: K      1eCallSegmentsResult,
  MoveLegResult,
  ReportUTSI,
  SplitLegResult;)]][9 �      (!
   6   &  !
   
         )[8         (!o    SIGNALLIST CS2_INAP_SSME_IN =
  ManageTriggerData;

SIGNALLIST CS2_INAP_SSME_OUT =
  ManageTriggerDataResult;)]][9 �           0(CallSegmentID,ExportCSType),
  ImportCSResp,
  SetLegID(LegType,LegType),

  /* Signal to report to the SSF-FSM that an UTSI event has occured. */
  DPUTSI(DPUTSIArg),
  DPFacility(DPFacilityArg);)]]]]}red. */
  DPUTSI(DPUTSIType);)]]]]}pe);)]]]]}dType),
   �����    �  @  L  �  L  l  !"            L  l          �  @  )[         (!
   6 �    !	    T_BCSM2)][. 7      (!
   
         )[8         (!
   6 e  :  !    (T_BCSM2_In))]][         (!
   6 L  l  !    Z   )][. 8      (!
   
              ( )[8         (!
   6 e  �  !    (T_BCSM2_Out))]][         (!
   6 �  @  !    ~���)][: i      (!
   6 �  @  )[         (!
   6 �    !    T)]][; <      (!
   6 L  l  )[         (!
   6 3  �  !    CS)]][(        (!
   6 R  l  !
        ) 
 ,  �   !       )[         (!
   6 �  �  !    T_BCSM)]]]]]]][0 �      (!    �  �    �    �  !"              �  �  �  �  �  )[         (!
   6   k  !    SSME2_Interface)][. �      (!
   
         )[8         (!
   6 F        *�  !    (SSME2_In))]][         (!
   6   �  !    Z   )][. �      (!
   
         )[8         (!
   6 -     !    (SSME2_Out))]][         (!
   6 �  �  !    Y���)][: �      (!
   6 �  �  )[         (!
   6 �  �  !    SSME)]][; �        +    (!
   6   �  )[         (!
   6 �    !    IH)]][( �      (!
   6 x  �  !
   
 ,  �   !       )[         (!
   6 �  3  !    SSME)]]]]]][9 r      (!
   6 �   R  !
   
         )[8         (!�    /* Notes:
    - Dashed symbols refe      ,r to
      entities defined in the
      IN CS-1 SDL specifica-
      tions.
    - The functionality and
      interfacesof all entities
      are extended to incorpo-
      rate the IN CS-2
      functionality. */)]][(       (!
   6 x  x  !
   
 ,  �      2()[         (!
    l  �  !
    2   2   !   ( h   )[ �      (!
   
 l  �  )[ �      (!
   6       )[ �      (!
   6    d   !
   
         )]][  �      (!
   6      )][9 �      (!
   6 �   �   !
   
         )[8         (!W    /**** DA      .TA TYPE DEFINITIONS COMMON TO THE IH, CSA, CS, BCSM AND SSF-FSM PROCESSES. */)]][9 �      (!
   6 ,  �  !
   
         )[8         (!~   /* A Leg can be exported/imported between call segments. */

NEWTYPE ExportLegType STRUCT
  sigConId CallRef; /* U      /sed when exporting the controlling leg. */
  csLegData LegInfo;
  ssfLegData EventRecordType;
  controllingLegStatus LegStatusType;
ENDNEWTYPE;


/* A call segment can be exported/imported between call segment associations. */

SYNTYPE ExportCSType = PId
E       (!
   6 ^  �  !
   
         )[8         (!   SIGNALLIST CS2_INAP_SSF_IN =
  ContinueWithArgument,
  DisconnectForwardConnectionWithArgument,
  DisconnectLeg,
  RequestReportFacilityEvent,
  RequestReportUTSI,
  SendFacilityInformation,
  SendSTUI;

      #      (!
   6 �  l  )[         (!
   6 �  �  !    CS)]][; l      (!
   6 �  @  )[         (!
   6 �    !    O)]][) �      ()]]]]]}------------------------------------------------------------------------------------------------------------   �����   !       )[         (!
   6 �  �  !    SSF)][0 ?      (!    x  �  �  �  !"            �  �          x  �  )[         (!
   6 q  �  !    SSF2_Interface)][. @      (!
   
         )[8         (!
   6   �  !    (SSF2_
_Out))]]      4()[w         (!   G SDL)]}veCallSegments,
  MoveLeg,
  OriginateCall,
  Reconnect,
  RequestEventReportUTSI,
  SendSTUI,
  SplitLeg;

SIGNALLIST CS2_INAP_To_SCF =
  ReportUTSI;)]]]]}-------------------------------------------------------------------------   ����[         (!
   6 �  �  !    �   )][. A      (!
   
         )[8         (!
   6 �  �  !    (SSF2_
_In))]][         (!
   6 x  �  !        )][: B      (!
   6 x  �  )[         (!
   6 �  �  !    CS)]][; �      (!
   6 �  �  )[         5      (!
   6 �  �  !    SSF)]][) �      ()]]][(       (!
   6 �  l  !
   
 ,  �   !       )[         (!
   6   �  !    O_BCSM)][0 H      (!    �  l  �  �  �  @  !"            �  @          �  l  )[         (!
   6 	         $n (CSA) process type is extended to manage:
  - Processing of IN CS-2 call segment related operations. 
  - The passing of new Signalling Control primitives between the
    InterfaceHandler and the CallSegment.
  - The passing of IN CS-2 primitives between      7 the
    InterfaceHandler and the CallSegment.)]]]][? X      (!
   6 2   �  !
   
 ,  �   !       )[         (!
   6 K   3  !    redefined
CallSegment)][ �      (!    ^    �    !"            �            ^    )[ �      (!
   6       8�  �  !        )[8         (!�   The CallSegment (CS) process type is extended to manage:
  - The extended connection view (in terms of legs) of the call segment.
  - Processing of IN CS-2 leg related operations.
  - Filtering of detection points
  -      9 The passing of new Signalling Control primitives between the
    CallSegmentAssociation and the BCSMs.
  - The passing of IN CS-2 primitives between the
    CallSegmentAssociation and the SSF-FSM.)]]]][? t       (!
   6 2   F  !
   
 ,  �   !       )      :[         (!
   6 K   �  !    redefined
SSF_FSM)][ �      (!    ^  x  �  x  !"            �  x          ^  x  )[ �      (!
   6 �  F  !        )[8         (![    The SSF-FSM process type is extended to manage:
  - The processing of       ;IN CS-2 operations.)]]]][? �      (!
   6   F  !
   
 ,  �   !       )[         (!
   6 3  �  !    redefined
SSME_FSM)][ �      (!    F  x  x  x  !"            x  x          F  x  )[ �      (!
   6 x  F  !        )[8              < (!M    The SSME_FSM is extended to manage:
  - The processing of ManageTriggerData)]]]][? w       (!
   6 2   r  !
   
 ,  �   !       )[         (!
   6 K   �  !    redefined
Originating_
BCSM)][ �      (!    ^  �  �  �  !"                  =�  �          ^  �  )[ �      (!
   6 �  r  !        )[8         (!�    The OriginatingBCSM (O-BCSM) process type is extended to manage:
  - The extensions to the call processing of originating half calls.)]]]][? z       (!
   6 2   �  !
   
 ,      >  �   !       )[         (!
   6 K   �  !    redefined
Terminating_
BCSM)][ �      (!    ^  �  �  �  !"            �  �          ^  �  )[ �      (!
   6 �  �  !        )[8         (!�    The TerminatingBCSM (T-BCSM) process type      ? is extended to manage:
  - The extensions to the call processing of terminating half calls.)]]]]]]}report to the SSF-FSM that an UTSI or Facility event has occured. */
  DPUTSI(DPUTSIType),
  DPFacility(DPFacilityType);)]]]]}]]]}--------------------------   d����SuspendReqInd,
  NetworkResumeReqInd,
  DataReqInd,
  DataInd,
  SetCS,
  SetLegID;

SIGNALLIST O_BCSM2_Out =
  NetworkSuspendReq,
  NetworkResumeReq,
  DataReqInd,
  DataReq,
  DPUTSI;

SIGNALLIST T_BCSM2_In =
  NetworkSuspendInd,
  NetworkResumeInd,
  Da      AtaInd,
  DataReqInd,
  SetCS,
  SetLegID;

SIGNALLIST T_BCSM2_Out =
  NetworkSuspendReqInd,
  NetworkResumeReqInd,
  DataReq,
  DataReqInd,
  DPUTSI;)]][9 �      (!
   6 ^  L  !
   
         )[8         (!�   /* Definition of signal lists. */

SIGNALL      BIST CSA2_In =
  (CS2_INAP_CSA_IN),
  (IBI2),
  (SigCon2_In),
  ExportCSReq,
  ImportCSReq;

SIGNALLIST CSA2_Out =
  (CS2_INAP_CSA_OUT),
  (IBI2),
  (SigCon2_Out),
  ExportCSResp,
  ImportCSResp;

SIGNALLIST CS2_In =
  (CS2_INAP_CS_IN),
  (IBI2),
  (SigCon2      C_In),
  CSExportLegReq,
  CSImportLegReq,
  SetLegID;

SIGNALLIST CS2_Out =
  (CS2_INAP_CS_OUT),
  (IBI2),
  (SigCon2_Out),
  CSExportLegResp,
  CSImportLegResp;

SIGNALLIST SSF2_In =
  (CS2_INAP_SSF_IN),
  ExportLegReq,
  ImportLegReq,
  SetLegID,
  DPUTS      DI,
  DPFacility;

SIGNALLIST SSF2_Out =
  (CS2_INAP_SSF_OUT),
  ExportLegResp,
  ImportLegResp;)]]]]}-----------------------------------------------------------------------------------------------------------------------------------------------------------   e����