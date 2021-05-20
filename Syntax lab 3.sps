* Encoding: UTF-8.

DATASET ACTIVATE DataSet7.
NOMREG Survived (BASE=FIRST ORDER=ASCENDING) WITH Age Fare Sex1 ticket_class_dummy_3 
    ticket_class_dummy_2 sibspdummy1 sibspdummy2 sibspdummy3 sibspdummy4 sibspdummy5 sibspdummy8 
    parchdummy1 parchdummy2 parchdummy3 parchdummy4 parchdummy5 parchdummy6 titles_dummy_Mr 
    titles_dummy_Miss titles_dummy_Mrs titles_dummy_Master
  /CRITERIA CIN(95) DELTA(0) MXITER(100) MXSTEP(5) CHKSEP(20) LCONVERGE(0) PCONVERGE(0.000001) 
    SINGULAR(0.00000001)
  /MODEL
  /STEPWISE=PIN(.05) POUT(0.1) MINEFFECT(0) RULE(SINGLE) ENTRYMETHOD(LR) REMOVALMETHOD(LR)
  /INTERCEPT=INCLUDE
  /PRINT=CLASSTABLE FIT PARAMETER SUMMARY LRT CPS STEP MFI IC.

NOMREG Survived (BASE=FIRST ORDER=ASCENDING) WITH Age Fare Sex1 ticket_class_dummy_3 
    ticket_class_dummy_2 sibspdummy1 sibspdummy2 sibspdummy3 sibspdummy4 sibspdummy5 sibspdummy8 
    parchdummy1 parchdummy2 parchdummy3 parchdummy4 parchdummy5 parchdummy6 titles_dummy_Mr 
    titles_dummy_Miss titles_dummy_Mrs titles_dummy_Master embarked_dummy_S embarked_dummy_Q
  /CRITERIA CIN(95) DELTA(0) MXITER(100) MXSTEP(5) CHKSEP(20) LCONVERGE(0) PCONVERGE(0.000001) 
    SINGULAR(0.00000001)
  /MODEL
  /STEPWISE=PIN(.05) POUT(0.1) MINEFFECT(0) RULE(SINGLE) ENTRYMETHOD(LR) REMOVALMETHOD(LR)
  /INTERCEPT=INCLUDE
  /PRINT=CLASSTABLE FIT PARAMETER SUMMARY LRT CPS STEP MFI IC.

NOMREG Survived (BASE=FIRST ORDER=ASCENDING) WITH Age Fare Sex1 ticket_class_dummy_3 
    ticket_class_dummy_2 sibspdummy1 sibspdummy2 sibspdummy3 sibspdummy4 sibspdummy5 sibspdummy8 
    parchdummy1 parchdummy2 parchdummy3 parchdummy4 parchdummy5 parchdummy6 titles_dummy_Mr 
    titles_dummy_Miss titles_dummy_Mrs titles_dummy_Master Cabin1
  /CRITERIA CIN(95) DELTA(0) MXITER(100) MXSTEP(5) CHKSEP(20) LCONVERGE(0) PCONVERGE(0.000001) 
    SINGULAR(0.00000001)
  /MODEL
  /STEPWISE=PIN(.05) POUT(0.1) MINEFFECT(0) RULE(SINGLE) ENTRYMETHOD(LR) REMOVALMETHOD(LR)
  /INTERCEPT=INCLUDE
  /PRINT=CLASSTABLE FIT PARAMETER SUMMARY LRT CPS STEP MFI IC.

RECODE titles1 (1=1) (ELSE=0) INTO Title__dummy_Mr.
VARIABLE LABELS  Title__dummy_Mr 'Title__dummy_Mr'.
EXECUTE.

RECODE titles1 (2=1) (ELSE=0) INTO Title__dummy_Miss.
VARIABLE LABELS  Title__dummy_Miss 'Title__dummy_Miss'.
EXECUTE.

RECODE titles1 (3=1) (ELSE=0) INTO Title__dummy_Mrs.
VARIABLE LABELS  Title__dummy_Mrs 'Title__dummy_Mrs'.
EXECUTE.

RECODE titles1 (4=1) (ELSE=0) INTO Title__dummy_Master.
VARIABLE LABELS  Title__dummy_Master 'Title__dummy_Master'.
EXECUTE.

RECODE SibSp (1=1) (ELSE=0) INTO SibSp__dummy_1.
VARIABLE LABELS  SibSp__dummy_1 'SibSp__dummy_1'.
EXECUTE.

RECODE SibSp (2=1) (ELSE=0) INTO SibSp__dummy_2.
VARIABLE LABELS  SibSp__dummy_2 'SibSp__dummy_2'.
EXECUTE.

RECODE SibSp (3=1) (ELSE=0) INTO SibSp__dummy_3.
VARIABLE LABELS  SibSp__dummy_3 'SibSp__dummy_3'.
EXECUTE.

RECODE SibSp (4=1) (ELSE=0) INTO SibSp__dummy_4.
VARIABLE LABELS  SibSp__dummy_4 'SibSp__dummy_4'.
EXECUTE.

RECODE SibSp (5=1) (ELSE=0) INTO SibSp__dummy_5.
VARIABLE LABELS  SibSp__dummy_5 'SibSp__dummy_5'.
EXECUTE.

RECODE SibSp (8=1) (ELSE=0) INTO SibSp__dummy_8.
VARIABLE LABELS  SibSp__dummy_8 'SibSp__dummy_8'.
EXECUTE.

RECODE Parch (1=1) (ELSE=0) INTO Parch__dummy_1.
VARIABLE LABELS  Parch__dummy_1 'Parch__dummy_1'.
EXECUTE.

RECODE Parch (2=1) (ELSE=0) INTO Parch__dummy_2.
VARIABLE LABELS  Parch__dummy_2 'Parch__dummy_2'.
EXECUTE.

RECODE Parch (3=1) (ELSE=0) INTO Parch__dummy_3.
VARIABLE LABELS  Parch__dummy_3 'Parch__dummy_3'.
EXECUTE.

RECODE Parch (4=1) (ELSE=0) INTO Parch__dummy_4.
VARIABLE LABELS  Parch__dummy_4 'Parch__dummy_4'.
EXECUTE.

RECODE Parch (5=1) (ELSE=0) INTO Parch__dummy_5.
VARIABLE LABELS  Parch__dummy_5 'Parch__dummy_5'.
EXECUTE.

RECODE Parch (6=1) (ELSE=0) INTO Parch__dummy_6.
VARIABLE LABELS  Parch__dummy_6 'Parch__dummy_6'.
EXECUTE.

RECODE Pclass (3=1) (ELSE=0) INTO ticket_class__dummy_3.
VARIABLE LABELS  ticket_class__dummy_3 'ticket_class__dummy_3'.
EXECUTE.

RECODE Pclass (2=1) (ELSE=0) INTO ticket_class__dummy_2.
VARIABLE LABELS  ticket_class__dummy_2 'ticket_class__dummy_2'.
EXECUTE.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Pclass COUNT()[name="COUNT"] Survived 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Pclass=col(source(s), name("Pclass"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  GUIDE: axis(dim(1), label("Pclass"))
  GUIDE: axis(dim(2), label("Percent"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Survived"))
  GUIDE: text.title(label("Stacked Bar Percent of Pclass by Survived"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval.stack(position(summary.percent(Pclass*COUNT, base.coordinate(dim(1)))), 
    color.interior(Survived), shape.interior(shape.square))
END GPL.

NOMREG Survived (BASE=FIRST ORDER=ASCENDING) WITH Age Fare Sex1 Title__dummy_Mr Title__dummy_Miss 
    Title__dummy_Mrs Title__dummy_Master SibSp__dummy_1 SibSp__dummy_2 SibSp__dummy_3 SibSp__dummy_4 
    SibSp__dummy_5 SibSp__dummy_8 Parch__dummy_1 Parch__dummy_2 Parch__dummy_3 Parch__dummy_4 
    Parch__dummy_5 Parch__dummy_6 ticket_class__dummy_3 ticket_class__dummy_2
  /CRITERIA CIN(95) DELTA(0) MXITER(100) MXSTEP(5) CHKSEP(20) LCONVERGE(0) PCONVERGE(0.000001) 
    SINGULAR(0.00000001)
  /MODEL
  /STEPWISE=PIN(.05) POUT(0.1) MINEFFECT(0) RULE(SINGLE) ENTRYMETHOD(LR) REMOVALMETHOD(LR)
  /INTERCEPT=INCLUDE
  /PRINT=CLASSTABLE FIT PARAMETER SUMMARY LRT CPS STEP MFI IC.
