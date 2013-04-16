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
  csRoute = 'Маршрут';
  csNote = 'Примечание';
  csOpenDoc = 'Открыт документ ';
  csLimitCorrect = 'Корректировка лимита на ';
  csOstLimitCorrect = 'Корректировка остатка лимита на ';
  csMonth = 'месяц';
  csQuartal = 'квартал';
  csPrimechDef = '"-';
  cNS03Table = 'NS03'+csDBFExt;
  cNS02KITable = 'NS02KI'+csDBFExt;

  //-- Menu --
  csMenu_TMS = 'Nm0';
  csMenu_TMSOst = 'NOst0';

  //-- Типы документа --
  csDocType_1 = 'План';
  csDocType_2 = 'Строка';
  csDocType_3 = 'ТМЦ Лимит месяц';
  csDocType_4 = 'ТМЦ Лимит кварт';
  csDocType_5 = 'ТМЦ Ост. лимита';
  csDocType_6 = 'План и лимит';
  csDocType_7 = 'Лимит';
  csDocType_8 = 'Ост. лимита';


  //-- Journal SaveDlg --
  csDlgSave = 'Сохранение ';
  csDlgSave_Spr = 'справки';
  csDlgSave_Mak = 'макета';
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

  //-- Поля БД --
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
  csField_Pdate = 'PDate'; // дата взятия на обработку в ОАСУП
  csField_Podrazd = 'Podrazd';
  csField_Prim = 'Prim';
  csField_Primech = 'Primech';
  csField_Sdate = 'SDate'; //дата отправки в ОАСУП из ПДО
  csField_Shifr = 'Shifr';
  csField_Spravka = 'Spravka';
  csField_Title = 'Title';
  csField_Tname = 'Tname';
  csField_Type = 'Type';
  csField_VP = 'VP';
  csField_Wdate = 'WDate'; // дата обработки в ОАСУП
  csField_Znak = 'Znak';

  //-- Документ Excel --
  csDocExcel = 'Excel.Application';
  csDocName_1 = '№ 104-';
  csDocName_2 = ' от ';
  csDocSheetName_1 = 'Отчет';
  csDocSheetName_2 = 'Коды';
  csDocFont_1 = 'Times New Roman';
  csDocPageFooter = '&"Arial Cyr,полужирный"&12&F - Страница &P';
  csDocHead_1 = 'Начальнику ОАСУП';
  csDocHead_2 = 'Цапу Ю.Г.';
  csDocHead_3 = 'Сл. зап. ';
  csDocFoot_1 = 'Директор по производству';
  csDocFoot_2 = 'С.А. Пудов';
  csDocFoot_3 = 'Начальник ПДО';
  csDocFoot_4 = 'В.С. Муравьев';
  csDocFoot_5 = 'Начальник ОПиАПД';
  csDocFoot_6 = 'А.И. Паскевич';
  csDocColumn_1 = '№№';
  csDocColumn_2 = 'Код';
  csDocColumn_3 = 'Чертёж';
  csDocColumn_4 = 'Кол';
  csDocColumn_5 = 'Месяц';
  csDocColumn_6 = 'I';
  csDocColumn_7 = 'II';
  csDocColumn_8 = 'III';
  csDocColumn_9 = 'Примечание';
  csDocColumn_10 = 'Содержание';
  csDocColumn_11 = 'Шифр материала';
  csDocColumn_12 = 'Ед. изм';
  csDocColumn_13 = 'Цех-пол';
  csDocColumn_14 = 'Знак'#10'0 - "+",'#10'1 - "-"';
  csDocColumn_15 = 'Количество материала';
  csDocColumn_17 = 'Подразде-'#10'ление';
  csDocFileName_2 = '_Коды.xls';
  csDocPasw = 'rjcnz';

  //-- Сообщения --
  csShowMsg_Del = 'Подтвердите удаление!';
  csShowMsg_InputTblName = 'Введите название таблицы';
  csShowMsg_InputCP = 'Укажите цех-получатель!';
  csShowMsg_InputShifr = 'Укажите шифр материала!';
  csShowMsg_InputKod = 'Укажите код изделия!';
  csShowMsg_Journal_1 = 'После добавления в журнал документ будет доступен в режиме "только чтение"!';
  csShowMsg_Journal_2 = '           Вы уверены что работа с документом закончена полностью';
  csShowMsg_Journal_3 = '                              и он готов к передаче в ОАСУП?';
  csShowMsg_Journal_Cap ='Добавление документа в журнал';

  //-- Ошибки --
  csErrorMsg_BlockDoc = 'Ошибка при блокировке документа!!!';
  csErrorMsg_ServiceTable = 'Ошибка при открытии служебных таблиц';
  csErrorMsg_DocTableEmpty =
    'Заполненные таблицы отсутствуют. В журнал ничего не добавленно из текущего документа!';
  csErrorMsg_RunError = 'Ошибка выполнения: ';
  cShifrError = 'Шифр материала отсутствует в номенклатура-ценнике!';
  csErrorMsg_KodCorrupt = 'Введен неправильный код изделия!';
  csErrorMsg_DiskFull = 'Недостаточно места на диске! ';
  csErrorMsg_DiskAChange = 'Вставьте другой диск A:';
  csErrorMsg_DirCreate = 'Ошибка при создании каталога! ';
  csErrorMsg_FileCreate = 'Ошибка при создании файла! ';

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

