------------------------SDT2         H   g   	   SSF_CCF                                             --------------------------------------------------------------------------------------------------------------------------------------------------------ObjectName ----------------------------------------ObjectType ----------------------------------------!%&()LinkEndpoints --------------------------------1 -------------------------------------------------         	   
         9   ��������������������   ����SSF_CCF witchingFunction ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   ����13 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   ����()[8        (!5    Virtual Block Type <<System Type CS1_INAP>> SSF_CCF)]}witchingFunction)]}------------------------------------------------------------------------------------------------------------------------------------------------------------------   K����OCESS TYPE DEFINITIONS ****/

/* Note: All process type definitions are virtual so they
can be redefined in the IN CS-2 specification. */)]][? �      (!
   6 �   &  !
   
 �   �   !        )[         (!
   6 �   ?  !    virtual
Interface_
Handler)]      [ }      (!    �  X  �  X  !"            �  X          �  X  )[ z      (!
   6 �  &  !        )[8         (!8   The InterFaceHandler (IH) process type manages:
   - The creation of CallSegmentAssociations (CSAs).
   - The dialouge with       the SCF.
   - The passing of primitives between the Signalling Control
     Interface and the CSAs.
   - The passing of primitives between the IN CS-1 SSF-SCF
     Interface and the CSA.)]]]][? �      (!
   6 �   R  !
   
 �   �   !        )[              1()[         (!
    l  �  !
    2   2   !   ( i   )[ t       (!
   6 �   �   !
   
 @    )[         (!
   6 �   �   )[ �      (!
   6 �   �   !
   
         )]][          (!
   6 �  �   )][A       (!    �  �   �      !        )[            
!%()PageOrder -------------------------------------1   -----------------------------------------------1   -----------------------------------------------1  ------------------------------------------------   	   
   
   
            ��������������������   ����!%()HeadingText -----------------------------------2   -----------------------------------------------4  ------------------------------------------------7 -------------------------------------------------   	   
   
   
      '   M   6          .   .   S   ����   (!
   6 F  2   !    SCF)][`         (!    )][.       (!
   
         )[8         (!
   6 �      !    (CS1_INAP_To_SCF))]][         (!
   6 �      !    ����)][.       (!
   
         )[8         (!
   6 �  d   !    (CS1_INAP_From_SCF))      ]][         (!
   6 �  �   !    Z   )]][A       (!    �   �      �  !        )[         (!
   6    �  !    SigCon)][`         (!    )][.       (!
   
         )[8         (!
   6    �  !    (Sig_
Con_
_Out))]][         (!
   6           �  !    �   )][.       (!
   
         )[8         (!
   6 d   �  !    (Sig_
Con_
_In))]][         (!
   6 �   �  !        )][0       (!    �   �  R  �  !"            R  �          �   �  )[         (!
   6 �  �  !    SigCon_In      terface)][.       (!
   
         )[8         (!
   6 q  �  !    (SigCon_In))]][         (!
   6 R  �  !        )][.       (!
   
         )[8         (!
   6   �  !    (SigCon_Out))]][         (!
   6 �   �  !    �   )][; �      (!
         6 R  �  )[         (!
   6 k  �  !
    Sig_
Con)]][( �      (!
   6 R  �  !
   
 �  �   )[         (!
   6 �  �  !    IH(1,1):
Interface_
Handler)][0       (!"      �    �   �  �   �  �   !"            �  �             �  )      [         (!
   6 R  ,  !    SCF_Interface)][.       (!
   
         )[8         (!
   6 �  �   !    (CS1_INAP_To_SCF))]][         (!
   6 �  �   !    ����)][.       (!
   
         )[8         (!
   6 �  ^  !    (CS1_INAP_From_SCF))]][               (!
   6   �  !    Z   )][:       (!
   6   �  )[         (!
   6   �  !    SCF)]][)       ()]][	 )      (!    R  X  &  X  &  �  !"            &  �          R  X  )[         (!
   6 &  �  !    Z   )][( �            (!
   6 �  �  !
   
 �  �   )[         (!
   6 �  �  !#    CSA(0,):
CallSegment_
Association)][	 5      (!      ~    x  !"              x            ~  )[         (!
   6   x  !    Z   )][(       (!
   6 �  x  !
   
 �  �         )[         (!
   6 ?  �  !    CS(0,):
CallSegment)][	 >      (!    R  �    �  !"              �          R  �  )[         (!
   6   �  !        )][(       (!
   6   x  !
   
 �  �   )[         (!
   6 �  �  !    SSF(0,      ):
SSF_FSM)][0 G      (!      '  R  '  !"            R  '            '  )[         (!
   6 �  �  !    SSF_Interface)][. H      (!
   
         )[8         (!
   6 k  @  !    (CS1_SSF_Out))]][         (!
   6 R  '  !    �   )][.       I      (!
   
         )[8         (!
   6 L  @  !    (CS1_SSF_In))]][         (!
   6   '  !        )][: �      (!
   6   '  )[         (!
   6 -    !    CS)]][; �      (!
   6 R  '  )[         (!
   6     !    SSF)]][)             ()]]]][	 P      (!    &  r  &  �  !"            &  �          &  r  )[         (!
   6 &  �  !    Z   )][(       (!
   6 ,  �  !
   
 ,  �   )[         (!
   6 E  �  !    O_BCSM(0,):
Originating_
BCSM)][0 \      (!    ^        �  ^  �  �  r  !"            �  r          ^  �  )[         (!
   6 w  !  !    O_BCSM)][. ]      (!
   
         )[8         (!
   6 �   �  !    (O_BCSM_
_Out))]][         (!
   6 �  r  !    ����)][. ^      (!
   
         )[8               (!
   6 �   S  !    (O_BCSM_In))]][         (!
   6 ^  �  !    Z   )][: _      (!
   6 ^  �  )[         (!
   6 E  �  !    CS)]][; M      (!
   6 �  r  )[         (!
   6 �  @  !    O)]][)       ()]]]][	 S      (!    �  r        �  �  !"            �  �          �  r  )[         (!
   6 �  �  !    Z   )][(       (!
   6 �  �  !
   
 ,  �   )[         (!
   6 �  �  !    T_BCSM(0,):
Terminating_
BCSM)]]][0 Y      (!       r  �  �  �  �  !"                  �  �             r  )[         (!
   6    !  !    T_BCSM)][. Z      (!
   
         )[8         (!
   6 �  l  !    (T_BCSM_In))]][         (!
   6 �  �  !    Z   )][. [      (!
   
         )[8         (!
   6 �  �  !    (T_BCSM_      Out))]][         (!
   6    r  !    g���)][: V      (!
   6    r  )[         (!
   6   @  !    T)]][; b      (!
   6 �  �  )[         (!
   6 �  �  !    CS)]][)       ()]]]][0 ;      (!    �  ~  �  x  !"            �  x                �  ~  )[         (!
   6 �  �  !    CS_Interface)][. <      (!
   
         )[8         (!
   6 �  F  !	    (CS_In))]][         (!
   6 �  x  !    Z   )][. =      (!
   
         )[8         (!
   6 �  �  !
    (CS_Out))]][           (!   4   !   5    !   7     )[!        (!    1!       !   3    )[!        (!    2!       !   3    )[!        (!    3!       !   3    )[!        (!    4!       !   3    )[!        (!    5!       !   3    )[!         7    (!
   6 �  ~  !    ����)][: 8      (!
   6 �  ~  )[         (!
   6 �  L  !    CS)]][; A      (!
   6 �  x  )[         (!
   6 �  �  !    CSA)]][)       ()]]]][0 /      (!    �  �  �    R    !"            R                  �  �  )[         (!
   6      !    CSA_Interface)][. 0      (!
   
         )[8         (!
   6 9  R  !
    (CSA_In))]][         (!
   6 R    !    �   )][. 1      (!
   
         )[8         (!
   6    �  !    (CSA_Out))]][               (!
   6 �  �  !    ����)][: �      (!
   6 �  �  )[         (!
   6 �  X  !    CSA)]][; �      (!
   6 R    )[         (!
   6   �  !    IH)]][) �      ()]][0 �      (!    ~  �  ~        !"                              < r  !
   
         )[8         (!*   
SIGNAL
  PIC(PICArg),
  PICResume(LegType, Boolean); /* The second parameter is used in connection with ContinueWithArgument (IN CS-2 operation). */

/* from SSF to BCSM */
SIGNALLIST oPICs =
  PIC,
  PICResume;

SI      GGNAL LIST DEFINITIONS ****/)]][9 �      (!
   6 2   �  !
   
         )[8         (!   SIGNALLIST CS1_INAP_CSA_In =
  AnalyseInformation,
  ApplyCharging,
  CallInformationRequest,
  Cancel,
  CollectInformation,
  Connnect,
  ConnectToResource,
  Con      c (oDPs),
  (tDPs);)]][9       (!
   6 &  x  !
   
         )[8         (!�    /**** SIGNAL DEFINITIONS FOR POINTS IN CALL ****/

/* Note: - Points in call are sent from the SSF-FSM to a BCSM
           via the CallSegment. */ )]][9 
      (!
   6 �         s,
  CallInformationReport,
  EventNotificationCharging,
  EventReportBCSM,
  InitialDP,

  Errror,
  ApplicationBegin,
  ApplicationContinue,
  ApplicationAbort,
  ApplicationEnd;
)]][9 �      (!
   6   �  !
   
         )[8         (!   SIGNALLIST      aq,
  MSFCReq,
  CACGReq,
  CFReq;

SIGNALLIST SSME_Resps =
  ArmTDPsResp,
  MSFCResp,
  CACGResp,
  CFResp;)]]]]}
SIGNALLIST PICs = 
  (oPICs), 
  (tPICs);)]]]]}s);)]]]]}horiseTerminationAttempt,
  PresentCall,
  SelectFacility,
  TActive,
  TAlerting,
  T   q����uestReportBCSMEvent,
  ResetTimer,
  SelectFacility,
  SelectRoute,
  SendChargingInformation,

  ApplicationBegin,
  ApplicationContinue,
  ApplicationAbort,
  ApplicationEnd;

SIGNALLIST CS1_INAP_CS_Out =
  ApplyChargingReport,
  AssistRequestInstruction      #rgingInformation,

  ApplicationBegin,
  ApplicationContinue,
  ApplicationAbort,
  ApplicationEnd;

SIGNALLIST CS1_INAP_CSA_Out =
  ApplyChargingReport,
  AssistRequestInstructions,
  CallInformationReport,
  EventNotificationCharging,
  EventReportBCSM,
      A()[         (!
    l  �  !
    2   2   !   ( ?   )[ h       (!
   
 l  �  )[ k       (!
   6       )[ n       (!
   6    d   !
   
         )]][  q       (!
   6      )][9 w      (!
   6 �  �   !
   
         )[8         (!�    /**** PR      5 [         (!
    l  �  !
    2   2   !   ( 6   )[ �      (!
   6 2   2   !
   
   �  )[ 7       (!
   6 K   K   )[ �      (!
   6 K   �  8 
   
         )]][  �      (!
   6 �  K   )][9    
   
   
   
   /   9   6    ��������������������      Rt/CSA can exist.)]]]][?       (!
   6 �   ~  !
   
 �   �   !        )[         (!
   6 �   �  !    virtual
CallSegment)][ �      (!    �  �  �  �  !"            �  �          �  �  )[ �      (!
   6 �  ~  !        )[8         (      2M can start from either the Idle state (initial SSF-FSM)
or from the WFI state (additional SSF-FSMs). */

NEWTYPE SSFStateType
  LITERALS
    Idle,
    WaitingForInstruction;
ENDNEWTYPE;


/* The SSF FSM maintains an Event List for 
each LegId. The event l      ;     !    (IBI))]][         (!
   6 �  �  !    �   )][. %      (!
   
         )[8         (!
   6 Y    !    (IBI))]][         (!
   6 �  �  !        )][;        (!
   6 �  �  )[         (!
   6 �  �  !    IBI)]][) �      ()]      ,]][9 e      (!
   6 �  �   !
   
         )[8         (!�    /* Note: The functional architecture of the
         SSF/CCF is in line with Q.1228 (IN
         CS-2) and not Q.1218 (IN CS-1). */)]]]]}FurnishChargingInformation,
  HoldCallInNetwork,
  Init   �����d;
)]][9 �      (!
   6   �  !
   
         )[8         (!�    SIGNALLIST SSME_In =
  ActivateServiceFiltering,
  ActivityTest,
  CallGap,

  (SSME_Reqs),

  Mgt_SetTriggerTable;

SIGNALLIST SSME_Out =
  ActivityTestResult,
  ServiceFilteringResponse,      K3  TYPE DEFINITIONS COMMON TO THE IH, CSA, CS, BCSM4 ND SSF-FSM PROCESSES. */)]][9 �      (!
   6 �  5    !
   
         )[8         (!�   /* Definiti6  of Leg */

NEWTYPE LegStatusType
  LITERALS join   
   
   
   
   b   M   :   S��������������������   ����d SSF-FSM. */

SIGNAL
  BCSMStop(LegType,PartyType),  /* BCSM -> CS: indication that the BCSM has stopped.*/
  CSStop(CallSegmentID,Cause),  /* CS -> CSA: indication that the CS has stopped. */
  SSFStop;                      /* CS -> SSF-FSM: instruction       Eeation of CallSegments
  - The passing of Signalling Control primitives between the
    InterfaceHandler and the CallSegment.
  - The passing of IN CS-1 primitives between the
    InterfaceHandler and the CallSegment.

Note: In IN CS-1 only one call segmen      ) (!
   6 �   k  !"    virtual
CallSegment_
Association)][ �      (!    �  �  �  �  !"            �  �          �  �  )[ �      (!
   6 �  R  !        )[8         (!S   The CallSegmentAssociation (CSA) process type manages:
  - The cr      0!'   The CallSegment (CS) process type manages:
  - The connection view (in terms of legs) of the call segment.
  - The creation of O-BCSMs and T-BCSMs.
  - The creation of the SSF-FSM.
  - Processing of connection view oriented IN CS-1 operations.
  - T      3he passing of Signalling Control primitives between the
    CallSegmentAssociation and the BCSMs.
  - The passing of IN CS-1 primitives between the
    CallSegmentAssociation and the SSF-FSM.
  - The passing of DPs and PICs between the BCSMs and the
    SS      C   (!
   6 ~  �  !    ����)][: �      (!
   6 ~  �  )[         (!
   6 e  X  !    SSME)]][; �      (!
   6     )[         (!
   6 -  �  !    IH)]][( �      (!
   6   �  !
   
 �  �   )[         (!
   6 x  �  !    SSME(1,1):
      5SSME_FSM)]]]]]][A &      (!    �  �  l  �  !        )[         (!
   6   �  !    IBI)][`         (!    )][. '      (!
   
         )[8         (!
   6 :    !    (IBI))]][         (!
   6 l  �  !        )][. (      (!
   
            @connect(DPArg),
  DPMidCall(DPArg);

/* Signals from O-BCSM to SSF */
SIGNALLIST oDPs =
  DP,
  DPAbandon,
  DPDisconnect,
  DPMidCall;

/* Signals from T-BCSM to SSF */
SIGNALLIST tDPs =
  DP,
  DPAbandon,
  DPDisconnect,
  DPMidCall;

SIGNALLIST DPs = 
       "     (!    6!       !   3    )]]]]]]}    (!    7!       !   3    )]]]]]]]}   (!    8!       !   3    )]]]]]]]]}  (!    9!       !   3    )]]]]]]]]]} (!    10!       !   3    )]]]]]]]]]]}(!    11!       !   3    )]]   ,����pe;             /* Type (O or T) of BCSM connected to the (passive) leg. */
  LegStatus LegStatusType;   /* Status of the leg. */
ENDNEWTYPE;

NEWTYPE LegArray  /* Array of legs. The LegID of a leg is the index in the array. */
  ARRAY (LegType,LegInfo)
EN      >()[w         (!   G SDL)]}s from SCF. */

SIGNALLIST CS1_INAP_To_SCF = 
  AnalysedInformation,
  ApplyChargingReport,
  AssistRequestInstructions,
  CallInformationReport,
  CollectedInformation,
  EventNotificationCharging,
  EventReportBCSM,
  InitialDP   ����()[         (!
    l  �  !
    2   2   !   ( ^   )[ �      (!
   
 l  �  )[ �      (!
   6       )[ �      (!
   6    d   !
   
         )]][  �      (!
   6      )][9 �      (!
   6 �  d   !
   
         )[8         (!M    /**** DE      Oist contains the 
BCSM event type and the monitor mode. */

SYNTYPE NumberOfBCSMEvents = NATURAL
  CONSTANTS 1:27
ENDSYNTYPE;

SYNONYM numOfBCSMEvents NATURAL = 27;

NEWTYPE EventListType
  ARRAY(NumberOfBCSMEvents,BCSMEvent)
ENDNEWTYPE;

SYNTYPE MaxNumOfL      ^~  �  )[         (!
   6 �    !    SSME_Interface)][. �      (!
   
         )[8         (!
   6 �  R  !    (SSME_In))]][         (!
   6     !        )][. �      (!
   
         )[8         (!
   6 �  �  !    (SSME_Out))]][            4g);)]]]]}    (!
   6    x  !
   
 ,  �   !        )[         (!
   6 R  �  !    virtual
TerminatingBCSM)]]]]}argingReport,
  AssistRequestInstructions,
  CallInformationReport,
  CollectedInformation,
  EventNotificationCharging,
  EventReportBCS   	����DNEWTYPE;)]][9       (!
   6 ~  ,  !
   
         )[8         (!k   /* The SSF-FSM and the SSME maintains an Event List for 
each LegId. The event list contains the  BCSM event type
and the monitor mode. */


NEWTYPE EventTableType
  ARRAY(LegType,Ev      QGNAL DEFINITIONS FOR DETECTION POINTS ****/

/* Note:   Detection points are sent from a BCSM to the SSF-FSM
           via the CallSegment. */ )]][9 �      (!
   6 �  &  !
   
         )[8         (!C   SIGNAL
  DP(DPArg),
  DPAbandon(DPArg),
  DPDis      6   )[8         (!
   6 �    !    (IBI))]][         (!
   6 �  �  !    �   )][0 #      (!    �  �  �  �  !"            �  �          �  �  )[         (!
   6 _  �  !    IBI_Interface)][. $      (!
   
         )[8         (!
   6      +  InitialDP,

  Errror,
  ApplicationBegin,
  ApplicationContinue,
  ApplicationAbort,
  ApplicationEnd;
)]][9 �      (!
   6 &  �  !
   
         )[8         (!   SIGNALLIST CS1_INAP_CS_In =
  AnalyseInformation,
  ApplyCharging,
  CallInformationRe      D  LITERALS Originating, Terminating;
ENDNEWTYPE;

NEWTYPE LegInfo STRUCT
  Used Boolean;              /* Flag indicating whether the leg is in use or not. */
  LegPtr PId;                /* Pointer/Address to the BCSM connected to the leg. */
  BCSM BCSMTy      8F-FSM.

Note: Only one SSF-FSM/CS can exist.)]]]][? �      (!
   6 �     !
   
 �   �   !        )[         (!
   6 �   @  !    virtual
SSF_FSM)][ �      (!    �  @  �  @  !"            �  @          �  @  )[ �      (!
   6 �          equest,
  Cancel,
  CollectInformation,
  Connnect,
  ConnectToResource,
  Continue,
  DisconnectForwardConnection,
  EstablishTemporaryConnection,
  FurnishChargingInformation,
  InitiateCallAttempt,
  ReleaseCall,
  RequestNotificationChargingEvent,
  Req      %to stop the SSF-FSM. */)]][9       (!
   6 �  �  !
   
         )[8         (!   /* Signals used for passing information between the SSF-FSM and the SSME-FSM. */
SIGNAL
  ArmTDPsReq(CSAID,CallSegmentID),
  ArmTDPsResp(CSAID,CallSegmentID,EventTableT      Fype),
  MSFCReq(CSAID,CallSegmentID),
  MSFCResp(CSAID,CallSegmentID,Boolean),
  CACGReq(CSAID,CallSegmentID),
  CACGResp(CSAID,CallSegmentID,Boolean),
  CFReq(CSAID,CallSegmentID),
  CFResp(CSAID,CallSegmentID,Boolean);

SIGNALLIST SSME_Reqs =
  ArmTDPsRe      $GNALLIST tPICs = 
  PIC,
  PICResume;

SIGNALLIST PICs = 
  (oPICs), 
  (tPICs);)]]]]}CollectUserInformationPrim(PromptAndCollectUserInformationArg),
  SpecializedResourceReportPrim(SpecializedResourceReportArg);)]][9 �      (!
   6 ^  L  !
   
           V���� )[8         (!L    /**** SIGNAL DEFINITIONS FOR THE IN CS-1 ERROR AND DIALOUGE HANDLING ****/)]][9 �      (!
   6 ^  �  !
   
         )[8         (!�    SIGNAL
  Error(ErrorArg),  /* Return error. */
  ApplicationBegin, /* Begin a dialouge. */
  App      IlicationAbort, /* Abort a dialouge. */
  ApplicationEnd;   /* End a dialouge. */)]]]]}PartyBusy(OCalledPartyBusyType),
  ODisconnect(ODisconnectType),
  OMidCall(OMidCallType),
  ONoAnswer(ONoAnswerType),
  OriginationAttemptAuthorised(OriginationAttemptAu   V   (ST CS_In =
  (CS1_INAP_CS_In),
  (SigCon_In),
  (IBI),
  (SSME_Resps),
  CSStop;

SIGNALLIST CS_Out =
  (CS1_INAP_CS_Out),
  (SigCon_Out),
  (IBI),
  (SSME_Reqs),
  CSStop;

SIGNALLIST CS1_SSF_In =
  (DPs),
  (CS1_INAP_SSF_In),
  (SSME_Resps),
  SSFStop;

      _

  (SSME_Resps);)]][9 �      (!
   6 X  �  !
   
         )[8         (!�   SIGNALLIST CSA_In =
  (CS1_INAP_CSA_In),
  (SigCon_In),
  (IBI),
  (SSME_Resps);

SIGNALLIST CSA_Out =
  (CS1_INAP_CSA_Out),
  (SigCon_Out),
  (IBI),
  (SSME_Reqs);

SIGNALLI      JInitiateCallAttempt,
  ReleaseCall,
  RequestNotificationChargingEvent,
  RequestReportBCSMEvent,
  ResetTimer,
  SelectFacility,
  SelectRoute,
  SendChargingInformation,

  ApplicationBegin,
  ApplicationContinue,
  ApplicationAbort,
  ApplicationEnd;

S      `()[         (!
    l  �  !
    2   2   !   ( A   )[ �      (!
   
 l  �  )[ �      (!
   6       )[ �      (!
   6    d   !
   
         )]][  �      (!
   6      )][9 ]      (!
   6 �  ,  !
   
         )[8         (!�    /**** SI      ?n_Out),
  (IBI_Out),
  BCSMStop;

SIGNALLIST T_BCSM_In =
  (tPICs),
  (T_SigCon_In),
  (IBI_Out),
  BCSMStop;

SIGNALLIST T_BCSM_Out =
  (tDPs),
  (T_SigCon_Out),
  (IBI_In),
  BCSMStop;)]]]]}        )[8         (!�    
SIGNAL
  PIC(PICArg),
  PICResume(L   �����FINITIONS COMMON TO THE IH, CSA, CS, BCSM AND SSF-FSM PROCESSES. */)]][9 �      (!
   6 2   ,  !
   
         )[8         (!�   /* Definition of Leg */

NEWTYPE LegStatusType
  LITERALS joined, pending, shared, surrogate;
ENDNEWTYPE;

NEWTYPE BCSMType
      B�  X  �  !"            X  �          &  �  )[ �      (!
   6 X  ~  !        )[8         (!y    The SSME-FSM process type manages:
  - The processing of IN CS-1 management.
  - The handling of static arming of TDPs.)]]]]]]}f TDPs.)]]]]]]}l,
    �����entRecordType)
ENDNEWTYPE;

NEWTYPE EventRecordType
  ARRAY(EventTypeBCSM,ServiceKeyEventType)
ENDNEWTYPE;

NEWTYPE ServiceKeyEventType
  ARRAY(ServiceKey, BCSMEvent)
ENDNEWTYPE;
)]][9 `      (!
   6 2   �  !
   
         )[8         (!�   /* An SSF-FS      *()[         (!
    l  �  !
    2   2   !   ( d   )[ �      (!
   6 2   2   !
   
   �  )[ �      (!
   6 K   K   )[ �      (!
   6 K   �   !
   
         )]][  �      (!
   6 �  K   )]]]}�      (!
   6 �   ,  !
   
         )[8         (   �   T()[         (!
    l  �  !
    2   2   !   ( �   )[ �      (!
   
 l  �  )[ �      (!
   6       )[ �      (!
   6    d   !
   
         )]][  �      (!
   6      )][9 �      (!
   6    �   !
   
         )[8         (!%    /**** SI      !!H   /**** SIGNAL DEFINITIONS FOR THE IN CS-1 SCF-SSF OPERATIONS. ****/

/* Notes: - Connect is defined as Connnect because
            Connect is a reserved word in SDL.
          - The signals below are used at the interface between the
            Int      UerfaceHandler (IH) and CallSegmentAssociation (CSA)
            processes. */)]][9 �      (!
   6 �   &  !
   
         )[8         (!w   SIGNAL
  ActivateServiceFiltering(ActivateServiceFilteringArg),
  ActivityTest(ActivityTestArg),
  AnalysedInforma      Vtion(AnalysedInformationArg),
  AnalyseInformation(AnalyseInformationArg),
  ApplyCharging(ApplyChargingArg),
  ApplyChargingReport(ApplyChargingReportArg),
  AssistRequestInstructions(AssistRequestInstructionsArg),
  CallGap(CallGapArg),
  CallInformation      WReport(CallInformationReportArg),
  CallInformationRequest(CallInformationRequestArg),
  Cancel(CancelArg),
  CancelStatusReportRequest(CancelStatusReportRequestArg),
  CollectedInformation(CollectedInformationArg),
  CollectInformation(CollectInformationA      Xrg),
  Connect(ConnnectArg),
  ConnectToResource(ConnectToResourceArg),
  Continue(ContinueArg),
  DisconnectForwardConnection(DisconnectForwardConnectionArg),
  EstablishTemporaryConnection(EstablishTemporaryConnectionArg),
  EventNotificationCharging(Eve      YntNotificationChargingArg),
  EventReportBCSM(EventReportBCSMArg),
  FurnishChargingInformation(FurnishChargingInformationArg),
  HoldCallInNetwork(HoldCallInNetworkArg),
  InitialDP(InitialDPArg),
  InitiateCallAttempt(InitiateCallAttemptArg),
  OAnswer(O      ZAnswerArg),
  OCalledPartyBusy(OCalledPartyBusyArg),
  ODisconnect(ODisconnectArg),
  OMidCall(OMidCallArg),
  ONoAnswer(ONoAnswerArg),
  OriginationAttemptAuthorised(OriginationAttemptAuthorizedArg),
  ReleaseCall(ReleaseCallArg),
  RequestCurrentStatusRe      [port(RequestCurrentStatusReportArg),
  RequestEveryStatusChangeReport(RequestEveryStatusChangeReportArg),
  RequestFirstStatusMatchReport(RequestFirstStatusMatchReportArg),
  RequestNotificationChargingEvent(RequestNotificationChargingEventArg),
  RequestR      \eportBCSMEvent(CSAIdType,RequestReportBCSMEventArg),
  ResetTimer(ResetTimerArg),
  RouteSelectFailure(RouteSelectFailureArg),
  SelectFacility(SelectFacilityArg),
  SelectRoute(SelectRouteArg),
  SendChargingInformation(SendChargingInformationArg),
  Serv      ]iceFilteringResponse(ServiceFilteringResponseArg),
  StatusReport(StatusReportArg),
  TAnswer(TAnswerArg),
  TBusy(TBusyArg),
  TDisconnect(TDisconnectArg),
  TermAttemptAuthorised(TermAttemptAuthorisedArg),
  TMidCall(TMidCallArg),
  TNoAnswer(TNoAnswerAr      =egs = NATURAL
  CONSTANTS 1:numOfLegs
ENDSYNTYPE;

NEWTYPE LegEventListType
  ARRAY(MaxNumOfLegs,EventListType)
ENDNEWTYPE;)]][9 �      (!
   6 �  ~  !
   
         )[8         (!]   /* Signals used for passing information between the CSA, CS, BCSM an      /SIGNALLIST CS1_SSF_Out =
  (PICs),
  (CS1_INAP_SSF_Out),
  (SSME_Reqs);)]][9 �      (!
   6 �  �  !
   
         )[8         (!4   SIGNALLIST O_BCSM_In =
  (oPICs),
  (O_SigCon_In),
  (IBI_In),
  BCSMStop;

SIGNALLIST O_BCSM_Out =
  (oDPs),
  (O_SigCo      NIGNALLIST CS1_INAP_SSF_Out =
  ApplyChargingReport,
  AssistRequestInstructions,
  CallInformationReport,
  EventNotificationCharging,
  EventReportBCSM,
  InitialDP,

  Errror,
  ApplicationBegin,
  ApplicationContinue,
  ApplicationAbort,
  ApplicationEn      - CS1_INAP_SSF_In =
  AnalyseInformation,
  ApplyCharging,
  CallInformationRequest,
  Cancel,
  CollectInformation,
  Connnect,
  ConnectToResource,
  Continue,
  DisconnectForwardConnection,
  EstablishTemporaryConnection,
  FurnishChargingInformation,
        L()[         (!
    l  �  !
    2   2   !   ( L   )[ �      (!
   
 l  �  )[ �      (!
   6       )[ �      (!
   6    d   !
   
         )]][  �      (!
   6      )][? �      (!
   6 ,  �  !
   
 �   �   !        )[         (!
        dtinue,
  DisconnectForwardConnection,
  EstablishTemporaryConnection,
  FurnishChargingInformation,
  InitiateCallAttempt,
  ReleaseCall,
  RequestNotificationChargingEvent,
  RequestReportBCSMEvent,
  ResetTimer,
  SelectFacility,
  SelectRoute,
  SendCha      & 6 ^  �  !    virtual
Originating_
BCSM
)][ �      (!    &  �  X  �  !"            X  �          &  �  )[ �      (!
   6 X  �  !        )[8         (!g    The OriginatingBCSM (O-BCSM) process type manages:
  - The call processing of      f!        )[8         (!�    The SSF-FSM process type manages:
  - The processing of IN CS-1 operations.
  - The handling of detection points (EDPs & TDPs).)]]]]]]} TDPs).)]]]]]]}---------------------------------------------------------------------------   ����� originating half calls.)]]]][? �      (!
   6 ,  �  !
   
 �   �   !        )[         (!
   6 ^    !    virtual
Terminating_
BCSM)][ �      (!    &     X     !"            X             &     )[ �      (!
   6 X  �  !             g )[8         (!g    The TerminatingBCSM (T-BCSM) process type manages:
  - The call processing of terminating half calls.)]]]][? �      (!
   6 ,  ~  !
   
 �   �   !        )[         (!
   6 ^  �  !    virtual
SSME_FSM)][ �      (!    &        P