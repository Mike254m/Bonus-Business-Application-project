pageextension 50103 "LCB Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("LCB Bonuses"; "LCB Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Shows number of assigned bonuses to customer.';
            }
        }
    }
    actions
    {
        addlast(navigation)
        {
            action(LCBBonuses)
            {
                Caption = 'Bonuses';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "LCB Bonus List";

            }

        }


    }
}