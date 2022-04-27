tableextension 50103 "LCB Customer" extends Customer
{
    fields
    {
        field(50103; "LCB Bonuses"; Integer)
        {
            Caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("LCB Bonus Header" where("Customer No." = field("No.")));
            Editable = false;
        }

    }

    var
        BonusExistErr: Label 'You can not delete Customer %1 because there is at least one Bonus assigned';

    trigger OnBeforeDelete()
    var
        LCBBonusHeader: Record "LCB Bonus Header";
    begin
        LCBBonusHeader.SetRange("Customer No.", "No.");
        if not LCBBonusHeader.IsEmpty() then
            Error(BonusExistErr, "No.");
    end;
}