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
  ���� ��� Kod:
  1 - ������� ������������� ����� "�������"
  2 - ������ "������"
  3 - ������� ������������� ������ ����� "�����"  ���
  4 - ������� ������������� ������ ������� "�����" ���
  5 - ������� ������������� ������� ������ ����� "���/�" ���
  6 - ������������� ����� � ������ 
  7 - ������������� ������
  8 - ������������� ������� ������

  ����������� Kod2 �� �������� ����� ������:
  ����� ������������ � ���2
1,6,7: kod2 3 ���������� �����. 1������ - ����� �������� �� ������� �������������,
       2 ������ - ����� ������ � ������� ���� ������� ������ � �������������,
       3 ������ - ��� ������������� (0-����. , 1-�����, 2-����. �������)
3,5: kod2 1-2� ���������� ����� - ����� ������ �� ������� ������������� [1:12]
4: kod2 3 ���������� �����. 1 ������ - ����� �������� �� ������� �������������,
       2 ������ - ����� ������ � ������� ���� ������� ������,
       3 ������ - ��� ������������� (1-�����., 2-�������. �������)
8: kod2 3 ���������� �����. 1 ������ - ����� �������� ���������,
       2 ������ - ����� �������� ������,
       3 ������ - ��� ������������� (1-�����, 2-������� ���)
  }
  Kod, Kod2: Integer;    

implementation
uses Constants, DateUtils;
var
  Close1: Boolean;
{$R *.dfm}

  //��������� ������ ��� �����. ������ ���������

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
          //������ ������ ��� ��������� ���������
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

//������ ������ ��������� ���������� ���������� ��������

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
        Caption := '����� ������������� �����';
        cbb1.Items.Text := GenQuartText(CurrentQuarter);
        cbb1.ItemIndex := 0;
        lbl1.Visible := True;
        lbl1.Caption := '�������';
        NewStr := GetTemplate(Kod, monthof(Date), StrToInt(cbb1.Text),
          Yearof(Date));
      end;
    2:
      begin
        Caption := '����� ������';
        cbb1.Visible := False;
        lbl1.Visible := False;
        NewStr := GetTemplate(Kod, monthof(Date), CurrentQuarter,
          Yearof(Date));
      end;
    3:
      begin
        Caption := '����� ������������� ������ ��� �� ' +
          SysUtils.LongMonthNames[kod2] + ' �����';
        cbb1.Visible := False;
        lbl1.Visible := False;
        NewStr := GetTemplate(Kod, kod2, CurrentQuarter, Yearof(Date));
      end;
    4:
      begin
        Caption := '����� ������������� ������ ��� �� ' + inttostr(kod2)[1] +
          ' �������';
        cbb1.Visible := False;
        lbl1.Visible := False;
        NewStr := GetTemplate(Kod, monthof(Date), StrToInt(IntToStr(kod2)[1]),
          Yearof(Date));

      end;
    5:
      begin
        Caption := '����� ������������� ������� ������ ��� �� ' +
          SysUtils.LongMonthNames[kod2] + ' �����';
        cbb1.Visible := False;
        lbl1.Visible := False;
        NewStr := GetTemplate(Kod, kod2, CurrentQuarter, Yearof(Date));
      end;
    6:
      begin
        cbb1.Visible := True;
        Caption := '����� ������������� ����� � ������';
        if Main.Form1.GetMonthOfQuartal(Kod2) = 3 then
          cbb1.Items.Text := GenQuartText(Main.CurrentQuarter, False)
        else
          cbb1.Items.Text := GenQuartText(Main.CurrentQuarter, False, True,
            False);
        cbb1.ItemIndex := 0;
        lbl1.Visible := True;
        lbl1.Caption := '�������';
        NewStr := GetTemplate(Kod, monthof(Date), StrToInt(cbb1.Text),
          Yearof(Date));
      end;
    7:
      begin
        Caption := '����� ������������� ������';
        cbb1.Visible := True;
        if Main.Form1.GetMonthOfQuartal(Kod2) = 3 then
          cbb1.Items.Text := GenQuartText(Main.CurrentQuarter, False)
        else
          cbb1.Items.Text := GenQuartText(Main.CurrentQuarter, False, True,
            False);
//        cbb1.Items.Text := GenQuartText(Main.CurrentQuarter, False);
        cbb1.ItemIndex := 0;
        lbl1.Visible := True;
        lbl1.Caption := '�������';
        NewStr := GetTemplate(Kod, monthof(Date), StrToInt(cbb1.Text),
          Yearof(Date));
      end;
    8:
      begin //����� �� �������� � ������: ����� ��� ����
        Caption := '����� ������������� ������� ������';
        lbl1.Visible := True;
        lbl1.Caption := '�����';
        cbb1.Visible := True;
        cbb1.Items.Text := '�����'#13'����';
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
  {if Kod = 1 then Caption := '����� �������'
   else Caption := '����� ������';}
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

