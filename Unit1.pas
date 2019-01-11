unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SkinCtrls, Vcl.StdCtrls, SkinBoxCtrls, RegularExpressions,
  SkinHint, SkinData, DynamicSkinForm, spSkinUnZip, spSkinZip;

type
  TForm1 = class(TForm)
    spSkinMemo1: TspSkinMemo;
    getLink: TspSkinButton;
    spSkinMemo2: TspSkinMemo;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinFrame1: TspSkinFrame;
    spSkinData1: TspSkinData;
    spCompressedStoredSkin1: TspCompressedStoredSkin;
    spCompressedSkinList1: TspCompressedSkinList;
    spResourceStrData1: TspResourceStrData;
    spSkinHint1: TspSkinHint;
    spSkinZip1: TspSkinZip;
    spSkinUnZip1: TspSkinUnZip;
    spSkinStatusBar1: TspSkinStatusBar;
    spSkinStatusPanel1: TspSkinStatusPanel;
    spSkinStatusPanel2: TspSkinStatusPanel;
    spSkinStatusPanel3: TspSkinStatusPanel;
    spSkinScrollBar1: TspSkinScrollBar;
    spSkinScrollBar2: TspSkinScrollBar;
    procedure getLinkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  pattern = 'magnet\:\?[^\"]+';  {#'^magnet[A-Za-z0-9:?= ]+$';       }

implementation

{$R *.dfm}

procedure TForm1.getLinkClick(Sender: TObject);
var
  matchs: TMatchCollection;
 match: TMatch;
 i:Integer;
begin
   matchs:=TRegEx.Matches(spSkinMemo1.Lines.Text,pattern);
   spSkinMemo2.Lines.Clear;
   //ShowMessage(IntToStr(matchs.Count));
   spSkinStatusPanel1.Caption := '������' + IntToStr(matchs.Count);
   for match in matchs do
   begin
     spSkinMemo2.Lines.Add(match.Value);
   end;
end;

end.
