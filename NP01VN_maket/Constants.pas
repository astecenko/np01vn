unit Constants;
interface
const

  csDataPath = 'Data\';
  csTempPath = 'TMPNP01VN';
  csArhivPath = 'Arhiv\';
  //csArhivRun = 'rar a -r ';
  csArhivRun = '7z a ';
  csJournalLog = 'Journal.log';
  csJournalLock = 'JOURNAL.LCK';
  csNP01F = 'NP01F';
  csDBExt = '.db';
  csArcExt = '.7z';
//  cs7ZExt = '.7z';
  csTXTExt = '.txt';
  csDBFExt = '.dbf';
  csMakFilePostfix='_mak.txt';
  csSprFilePostfix='_spr.txt';
  csNameDoc = 'NameDoc'+csTXTExt;
  csTempMaket = 'Tempmaket'+csTXTExt;
  csNP01VN1 = 'NP01VN1'+csDBExt;
  csPrint = 'print';
  csJournal_NullDate = '01.01.2000';
  csDdmmyy = 'dd.mm.yy';
  IndexTableName = 'NP01F0'+csDBExt;
  csTrue = 'True';
  csMaket = 'Mak_';
  csMaketName_42 = '42';
  csMaketName_P8 = 'P8';
  csRoute = '�������';
  csNote = '����������';
  csOpenDoc = '������ �������� ';
  csLimitCorrect = '������������� ������ �� ';
  csOstLimitCorrect = '������������� ������� ������ �� ';
  csMonth = '�����';
  csQuartal = '�������';
  csPrimechDef = '"-';
  cNS03Table = 'NS03'+csDBFExt;
  cNS02KITable = 'NS02KI'+csDBFExt;

  //-- Menu --
  csMenu_TMS = 'Nm0';
  csMenu_TMSOst = 'NOst0';

  //-- ���� ��������� --
  csDocType_1 = '����';
  csDocType_2 = '������';
  csDocType_3 = '��� ����� �����';
  csDocType_4 = '��� ����� �����';
  csDocType_5 = '��� ���. ������';
  csDocType_6 = '���� � �����';
  csDocType_7 = '�����';
  csDocType_8 = '���. ������';


  //-- Journal SaveDlg --
  csDlgSave = '���������� ';
  csDlgSave_Spr = '�������';
  csDlgSave_Mak = '������';
  csDlgSave_FN_Spr = 'Spravka'+csTXTExt;
//  csDlgSave_FN_Mak = csMaket+csTXTExt;


  //-- SQL --
  csSQL_MarkClear = 'Update "NP01VN.DB" set Mark=False';

  csSQL_JournMark =
    'select * from "NP01VN.DB" where (Mark=True) AND (Sdate="01.01.2000")';
  csSQL_JournalClear = 'DELETE FROM "NP01VN.DB" WHERE (Sdate != "01.01.2000")';
  csSQL_SetMark =
    'UPDATE "NP01VN.DB" SET Mark=TRUE WHERE (SDate = "01.01.2000")';
  csSQL_JournalDelMarked =
    'DELETE FROM "NP01VN.DB" WHERE (Mark=TRUE) and (SDate = "01.01.2000")';
  csSQL_UpdateNP01VN = 'UPDATE "NP01VN.DB" SET ';
  csSQL_Add_Field_Data = 'ALTER TABLE "NP01F0.db" ADD data CHAR(10)';
  csSQL_AND = ' AND ';
  csSQL_OR = ' OR ';
  csSQL_WHERE = ' WHERE ';

  //-- ���� �� --
  csField_Cp = 'Cp';
  csField_Chert = 'Chert';
  csField_Data = 'Data';
  csField_Digit = 'Digit';
  csField_Eim = 'Eim';
  csField_FileName = 'FileName';
  csField_Fname = 'Fname';
  csField_Fname2 = csField_Fname + '2';
  csField_FnId = 'FnId';
  csField_Id = 'Id';
  csField_Kl = 'Kl';
  csField_Ki = 'Ki';
  csField_Kod = 'Kod';
  csField_Kol = 'Kol';
  csField_Kol_m = 'Kol_m';
  csField_Kol_m2 = 'Kol_m2';
  csField_Kol_m3 = 'Kol_m3';
  csField_Kol2 = 'Kol2';
  csField_Kol3 = 'Kol3';
  csField_Maket = 'Maket';
  csField_Makname = 'Makname';
  csField_Marsh = 'Marsh';
  csField_Mmyyyy = 'Mmyyyy';
  csField_Num = 'Num';
  csField_Norma = 'Norma';
  csField_OldDigit = 'OldDigit';
  csField_Pdate = 'PDate'; // ���� ������ �� ��������� � �����
  csField_Podrazd = 'Podrazd';
  csField_Prim = 'Prim';
  csField_Primech = 'Primech';
  csField_Sdate = 'SDate'; //���� �������� � ����� �� ���
  csField_Shifr = 'Shifr';
  csField_Spravka = 'Spravka';
  csField_Title = 'Title';
  csField_Tname = 'Tname';
  csField_Type = 'Type';
  csField_VP = 'VP';
  csField_Wdate = 'WDate'; // ���� ��������� � �����
  csField_Znak = 'Znak';

  //-- �������� Excel --
  csDocExcel = 'Excel.Application';
  csDocName_1 = '� 104-';
  csDocName_2 = ' �� ';
  csDocSheetName_1 = '�����';
  csDocSheetName_2 = '����';
  csDocFont_1 = 'Times New Roman';
  csDocPageFooter = '&"Arial Cyr,����������"&12&F - �������� &P';
  csDocHead_1 = '���������� �����';
  csDocHead_2 = '���� �.�.';
  csDocHead_3 = '��. ���. ';
  csDocFoot_1 = '�������� �� ������������';
  csDocFoot_2 = '�.�. �����';
  csDocFoot_3 = '��������� ���';
  csDocFoot_4 = '�.�. ��������';
  csDocFoot_5 = '��������� ������';
  csDocFoot_6 = '�.�. ��������';
  csDocColumn_1 = '��';
  csDocColumn_2 = '���';
  csDocColumn_3 = '�����';
  csDocColumn_4 = '���';
  csDocColumn_5 = '�����';
  csDocColumn_6 = 'I';
  csDocColumn_7 = 'II';
  csDocColumn_8 = 'III';
  csDocColumn_9 = '����������';
  csDocColumn_10 = '����������';
  csDocColumn_11 = '���� ���������';
  csDocColumn_12 = '��. ���';
  csDocColumn_13 = '���-���';
  csDocColumn_14 = '����'#10'0 - "+",'#10'1 - "-"';
  csDocColumn_15 = '���������� ���������';
  csDocColumn_17 = '��������-'#10'�����';
  csDocFileName_2 = '_����.xls';
  csDocPasw = 'rjcnz';

  //-- ��������� --
  csShowMsg_Del = '����������� ��������!';
  csShowMsg_InputTblName = '������� �������� �������';
  csShowMsg_InputCP = '������� ���-����������!';
  csShowMsg_InputShifr = '������� ���� ���������!';
  csShowMsg_InputKod = '������� ��� �������!';
  csShowMsg_Journal_1 = '����� ���������� � ������ �������� ����� �������� � ������ "������ ������"!';
  csShowMsg_Journal_2 = '           �� ������� ��� ������ � ���������� ��������� ���������';
  csShowMsg_Journal_3 = '                              � �� ����� � �������� � �����?';
  csShowMsg_Journal_Cap ='���������� ��������� � ������';

  //-- ������ --
  csErrorMsg_BlockDoc = '������ ��� ���������� ���������!!!';
  csErrorMsg_ServiceTable = '������ ��� �������� ��������� ������';
  csErrorMsg_DocTableEmpty =
    '����������� ������� �����������. � ������ ������ �� ���������� �� �������� ���������!';
  csErrorMsg_RunError = '������ ����������: ';
  cShifrError = '���� ��������� ����������� � ������������-�������!';
  csErrorMsg_KodCorrupt = '������ ������������ ��� �������!';
  csErrorMsg_DiskFull = '������������ ����� �� �����! ';
  csErrorMsg_DiskAChange = '�������� ������ ���� A:';
  csErrorMsg_DirCreate = '������ ��� �������� ��������! ';
  csErrorMsg_FileCreate = '������ ��� �������� �����! ';

  csSymb_Zero = '0';
  csSymb_Null = '';
  csSymb_BackSlash = '\';
  csSymb_LeftParenthesis = '(';
  csSymb_RightParenthesis = ')';
  csSymb_LeftBracket = '[';
  csSymb_RightBracket = ']';
  csSymb_Quote2 = '"';
  csSymb_Quote = '''';
  csSymb_Equal = '=';
  csSymb_Dot = '.';
  csSymb_NotEqual = ' != ';

implementation

end.

