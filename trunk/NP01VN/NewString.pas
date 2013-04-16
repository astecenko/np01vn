unit NewString;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Main;

type
  TFormNewString = class(TForm)
    Button1: TButton;
    Button2: TButton;
    MemoNewStr: TMemo;
    cbb1: TComboBox;
    lbl1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cbb1Select(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNewString: TFormNewString;
  NewStr: string;
  {
  Коды для Kod:
  1 - таблица корректировка плана "таблица"
  2 - строка "строка"
  3 - таблица корректировки лимита месяц "лимит"  ТМЦ
  4 - таблица корректировки лимита квартал "лимит" ТМЦ
  5 - таблица корректировки остатка лимита месяц "ост/л" ТМЦ
  6 - корректировка плана и лимита 
  7 - корректировка лимита
  8 - корректировка остатка лимита

  Расшифровка Kod2 по значению кодов таблиц:
  Когда задумывалось с Код2
1,6,7: kod2 3 символьное число. 1символ - номер квартала на который корректировка,
       2 символ - номер месяца в котором была создана запись о корректировке,
       3 символ - тип корректировки (0-пред. , 1-текущ, 2-след. квартал)
3,5: kod2 1-2х символьное число - номер месяца на который корректировка [1:12]
4: kod2 3 символьное число. 1 символ - номер квартала на который корректировка,
       2 символ - номер месяца в котором была создана запись,
       3 символ - тип корректировки (1-текущ., 2-следующ. квартал)
8: kod2 3 символьное число. 1 символ - номер текущего кварталал,
       2 символ - номер текущего месяца,
       3 символ - тип корректировки (1-текущ, 2-следующ мес)
  }
  Kod, Kod2: Integer;    

implementation
uses Constants, DateUtils;
var
  Close1: Boolean;
{$R *.dfm}

  //Генерация текста для выпад. списка кварталов

function GenQuartText(TekQuartNum: Integer; PrevQuart: Boolean = True; TekQuart:
  Boolean = True; NextQuart: Boolean = True): string;
begin
  Result := '';
  case TekQuartNum of
    1:
      begin
        if TekQuart = True then
          Result := Result + '1'#13;
        if NextQuart = True then
          Result := Result + '2'#13;
        if PrevQuart = True then
          Result := Result + '4';
      end;
    2:
      begin
        if PrevQuart = True then
          Result := Result + '1'#13;
        if TekQuart = True then
          Result := Result + '2'#13;
        if NextQuart = True then
          Result := Result + '3';
      end;
    3:
      begin
        if PrevQuart = True then
          Result := Result + '1'#13'2'#13;
        if TekQuart = True then
          Result := Result + '3'#13;
        if NextQuart = True then
          Result := Result + '4';
      end;
    4:
      begin
        if NextQuart = True then
          Result := Result + '1'#13;
        if PrevQuart = True then
          Result := Result + '1'#13'2'#13'3'#13;
        if TekQuart = True then
          Result := Result + '4'
      end;
  end;
  if Result[Length(Result)] = #13 then
    Result := Copy(Result, 1, Length(Result) - 1);
end;

procedure TFormNewString.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s, ss: string;
  j: integer;
begin
  if (cbb1.ItemIndex = -1) and (Close1 = False) and (cbb1.Visible = True) then
    Action := caNone
  else if Close1 = False then
  begin
    NewStr := MemoNewStr.Text;
    ss := '';
    s := '';
    case Kod of
      1, 6, 7:
        begin
          s := cbb1.Text + IntToStr(Main.Form1.GetMonthOfQuartal(Kod2));
          j := StrToInt(cbb1.Text);
          //особые случаи при граничных кварталах
          case CurrentQuarter of
            1: if j = 4 then
                ss := '0'
              else if j = 1 then
                ss := '1'
              else
                ss := '2';
            4: if j = 4 then
                ss := '1'
              else if j = 1 then
                ss := '2'
              else
                ss := '0';
          else
            begin
              if j < CurrentQuarter then
                ss := '0'
              else if j = CurrentQuarter then
                ss := '1'
              else
                ss := '2';
            end;
          end;
          Kod2 := StrToInt(s + ss);
        end;
      8:
        begin
          s := IntToStr(CurrentQuarter) +
            IntToStr(Main.Form1.GetMonthOfQuartal(Kod2));
          ss := IntToStr(cbb1.ItemIndex + 1);
          Kod2 := StrToInt(s + ss);
        end;

    end;

  end;

end;

//парсит шаблон заголовка подставляя переданные значения

function GetTemplate(const ikod: Integer; const mm, qq, yy: integer): string;
begin
  Result := stringReplace(TemplateList[ikod - 1], 'MM',
    SysUtils.LongMonthNames[mm], [rfReplaceAll]);
  Result := stringReplace(Result, 'QQ', IntToStr(qq), [rfReplaceAll]);
  Result := stringReplace(Result, 'YY', IntToStr(yy), [rfReplaceAll]);
end;

procedure TFormNewString.FormShow(Sender: TObject);
var
  i,j: Integer;
begin
  Close1 := False;
  //i := Main.CurrentQuarter;
  cbb1.Items.Clear;
  case Kod of
    1:
      begin
        Caption := 'Новая корректировка плана';
        cbb1.Items.Text := GenQuartText(CurrentQuarter);
        cbb1.ItemIndex := 0;
        lbl1.Visible := True;
        lbl1.Caption := 'квартал';
        NewStr := GetTemplate(Kod, monthof(Date), StrToInt(cbb1.Text),
          Yearof(Date));
      end;
    2:
      begin
        Caption := 'Новая строка';
        cbb1.Visible := False;
        lbl1.Visible := False;
        NewStr := GetTemplate(Kod, monthof(Date), CurrentQuarter,
          Yearof(Date));
      end;
    3:
      begin
        Caption := 'Новая корректировка лимита ТМЦ на ' +
          SysUtils.LongMonthNames[kod2] + ' месяц';
        cbb1.Visible := False;
        lbl1.Visible := False;
        NewStr := GetTemplate(Kod, kod2, CurrentQuarter, Yearof(Date));
      end;
    4:
      begin
        Caption := 'Новая корректировка лимита ТМЦ на ' + inttostr(kod2)[1] +
          ' квартал';
        cbb1.Visible := False;
        lbl1.Visible := False;
        NewStr := GetTemplate(Kod, monthof(Date), StrToInt(IntToStr(kod2)[1]),
          Yearof(Date));

      end;
    5:
      begin
        Caption := 'Новая корректировка остатка лимита ТМЦ на ' +
          SysUtils.LongMonthNames[kod2] + ' месяц';
        cbb1.Visible := False;
        lbl1.Visible := False;
        NewStr := GetTemplate(Kod, kod2, CurrentQuarter, Yearof(Date));
      end;
    6:
      begin
        cbb1.Visible := True;
        Caption := 'Новая корректировка плана и лимита';
        if Main.Form1.GetMonthOfQuartal(Kod2) = 3 then
          cbb1.Items.Text := GenQuartText(Main.CurrentQuarter, False)
        else
          cbb1.Items.Text := GenQuartText(Main.CurrentQuarter, False, True,
            False);
        cbb1.ItemIndex := 0;
        lbl1.Visible := True;
        lbl1.Caption := 'квартал';
        NewStr := GetTemplate(Kod, monthof(Date), StrToInt(cbb1.Text),
          Yearof(Date));
      end;
    7:
      begin
        Caption := 'Новая корректировка лимита';
        cbb1.Visible := True;
        if Main.Form1.GetMonthOfQuartal(Kod2) = 3 then
          cbb1.Items.Text := GenQuartText(Main.CurrentQuarter, False)
        else
          cbb1.Items.Text := GenQuartText(Main.CurrentQuarter, False, True,
            False);
//        cbb1.Items.Text := GenQuartText(Main.CurrentQuarter, False);
        cbb1.ItemIndex := 0;
        lbl1.Visible := True;
        lbl1.Caption := 'квартал';
        NewStr := GetTemplate(Kod, monthof(Date), StrToInt(cbb1.Text),
          Yearof(Date));
      end;
    8:
      begin //выбор не квартала а месяца: текущ или след
        Caption := 'Новая корректировка остатка лимита';
        lbl1.Visible := True;
        lbl1.Caption := 'месяц';
        cbb1.Visible := True;
        cbb1.Items.Text := 'Текущ'#13'След';
        cbb1.ItemIndex := 0;
//        NewStr := GetTemplate(Kod, monthof(Date), StrToInt(cbb1.Text),Yearof(Date));
        i := kod2;
        j := Yearof(Date);
        if i = 13 then
        begin
          i := 1;
          Inc(j);
        end;
        NewStr := GetTemplate(Kod, i, Main.Form1.GetQuartalByMonth(i), j);
      end;
  end;
  {if Kod = 1 then Caption := 'Новая таблица'
   else Caption := 'Новая строка';}
  MemoNewStr.Text := NewStr;
end;

procedure TFormNewString.Button2Click(Sender: TObject);
begin
  Close1 := True;
end;

procedure TFormNewString.cbb1Select(Sender: TObject);
var
  i, j: integer;
begin
  case Kod of
    1: MemoNewStr.Text := GetTemplate(Kod, monthof(Date), StrToInt(cbb1.Text),
        Yearof(Date));
    6: MemoNewStr.Text := GetTemplate(Kod, monthof(Date), StrToInt(cbb1.Text),
        Yearof(Date));
    7: MemoNewStr.Text := GetTemplate(Kod, monthof(Date), StrToInt(cbb1.Text),
        Yearof(Date));
    8:
      begin
        i := kod2 + cbb1.ItemIndex;
        j := Yearof(Date);
        if i = 13 then
        begin
          i := 1;
          Inc(j);
        end;
        MemoNewStr.Text := GetTemplate(Kod, i, Main.Form1.GetQuartalByMonth(i),
          j);
      end;
  end;

end;

end.

