page 50103 "LCB Bonus Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "LCB Bonus Setup";
    Caption = 'Bonus Setup';

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Bonus Nos."; Rec."Bonus Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Number series what will be used for bonus numbers.';

                }
            }
        }



    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Get() then begin
            Init();
            Insert();
        end;
    end;
}
