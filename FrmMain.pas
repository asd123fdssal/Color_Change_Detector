unit FrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XiPanel, iComponent, iVCLComponent, iCustomComponent,
  iLed, iLedRectangle, XiButton, ZINICtrl, StdCtrls, Mask, AdvSpin;

type
  TForm1 = class(TForm)
    getColorTimer: TTimer;
    Edit1: TEdit;
    btnPos: TButton;
    Exit: TButton;
    Start: TButton;
    XiButton1: TButton;
    XPos: TPanel;
    YPos: TPanel;
    Color1: TPanel;
    Color2: TPanel;
    ColorPanel: TPanel;
    ColorPanel2: TPanel;
    procedure ExitClick(Sender: TObject);
    procedure btnPosClick(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getColorTimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure XiButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure WMHotkey(var Msg: TWMHotkey); message WM_HOTKEY;
  public
    { Public declarations }
    gbClick: Boolean;
    gbWhite: Boolean;
    gbLoop: Boolean;
  end;

var
  Form1: TForm1;
  wnd : HWND;

implementation

uses Types;

{$R *.dfm}

function ColorPixel(P: TPoint): TColor;
var
    DC: HDC;
begin
    DC := GetDC(wnd);
    Result:= GetPixel(DC,P.X,P.Y);
    ReleaseDC(0,DC);
end;

procedure TForm1.ExitClick(Sender: TObject);
begin
    gbLoop := False;
    Application.Terminate;
end;

procedure TForm1.btnPosClick(Sender: TObject);
var
    p: TPoint;
begin
    gbClick := True;
    GetCursorPos(p);
    p := Point(p.X, p.Y);
    ColorPanel.Color := ColorPixel(p);
    XPos.Caption := IntToStr(p.X);
    YPos.Caption := IntToStr(p.Y);

    //StartClick(nil);
end;

procedure TForm1.StartClick(Sender: TObject);
var
    p : TPoint;
    c : TColor;
begin
    getColorTimer.Enabled := True;
   { While gbClick do
    begin
        gbWhite := True;

        if XPos.Caption = 'XPos1' then break;

        p := Point(StrToInt(XPos.Caption), StrToInt(YPos.Caption));

        c := colorPixel(p);

        ColorPanel2.Color := c;

        Color1.Caption := ColorToString(ColorPanel.Color);
        Color2.Caption := ColorToString(ColorPanel2.Color);

        if DebugMode.Checked then break;

        if (ColorPanel.Color <> ColorPanel2.Color) and (gbClick) then
        begin
            mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
            mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);
            mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
            mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);
            gbClick := False;
        end;
        Application.ProcessMessages;
    end;}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    gbLoop := True;
    if not RegisterHotkey(Handle, 1, 0, VK_SPACE) then
        ShowMessage('HotKey Error!!');
end;

procedure TForm1.WMHotkey(var Msg: TWMHotkey);
begin
    if Msg.HotKey = 1 then
    begin
        {mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
        mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);}
        btnPosClick(nil);
        {mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
        mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);}
        StartClick(nil);
    end;
end;

procedure TForm1.getColorTimerTimer(Sender: TObject);
var
    p : TPoint;
    c : TColor;
begin
    if (XPos.Caption <> 'XPos1') and gbClick then
    begin
        p := Point(StrToInt(XPos.Caption), StrToInt(YPos.Caption));

        c := colorPixel(p);

        ColorPanel2.Color := c;

        Color1.Caption := ColorToString(ColorPanel.Color);
        Color2.Caption := ColorToString(ColorPanel2.Color);

        if (ColorPanel.Color <> ColorPanel2.Color) and (gbClick) then
        begin
            Enabled := False;
            mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
            mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);
            mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
            mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);
            gbClick := False;
        end;
    end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    UnRegisterHotkey(Handle, 1);
end;

function GetHwndFromProcessID(dwProcessID: DWORD): THandle;
var
    hWnd: THandle;
    dwProcessID2: DWORD;
begin
    hWnd := FindWindow(nil, nil); // 최상위 윈도우 핸들 찾기
    Result := 0;
    while( hWnd <> 0 ) do
    begin
        if( 0 = GetParent(hWnd)) then
        begin // 최상위 핸들인지 체크, 버튼 등도 핸들을 가질 수 있으므로 무시하기 위해
        GetWindowThreadProcessId( hWnd, @dwProcessID2 );
        if( dwProcessID2 = dwProcessID ) then
        begin
            Result := hWnd;
            break;
        end;
        end;
        hWnd := GetWindow(hWnd, GW_HWNDNEXT); // 다음 윈도우 핸들 찾기
    end;
end;

procedure TForm1.XiButton1Click(Sender: TObject);
begin
    wnd := GetHwndFromProcessID(StrToInt(Edit1.Text));
end;

end.
