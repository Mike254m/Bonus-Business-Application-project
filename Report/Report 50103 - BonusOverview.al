report 50103 "LCB Bonus Overview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Bonus Overview';
    DefaultLayout = Word;
    WordLayout = './Report/Report 50103 BonusOverview.docx';

    dataset
    {
        dataitem("LCB BOnus Header"; "LCB Bonus header")
        {
            RequestFilterFields = "No.", "Customer No.";
            column(No_; "No.")
            {

            }
            column(Customer_No_; "Customer No.")
            {

            }
            column(Starting_Date; Format("Starting Date", 0))
            {

            }
            column(Ending_Date; Format("Ending Date", 0))
            {

            }
            column(BonusNoCaptionLbl; BonusNoCaptionLbl)
            {

            }
            column(CustomerNoCaptionLbl; CustomerNoCaptionLbl)
            {

            }
            column(PostingDateCaptionLbl; PostingDateCaptionLbl)
            {

            }
            column(DocumentNoCaptionLbl; DocumentNoCaptionLbl)
            {

            }
            column(BonusAmountCaptionLbl; BonusAmountCaptionLbl)
            {

            }
            column(ItemNoCaptionLbl; ItemNoCaptionLbl)
            {

            }
            column(StartingDateCaptionLbl; StartingDateCaptionLbl)
            {

            }
            column(EndingDateCaptionlbl; EndingDateCaptionLbl)
            {

            }
            dataitem("LCB Bonus Entry"; "LCB Bonus Entry")
            {
                DataItemLink = "Bonus No." = field("No.");
                RequestFilterFields = "Posting Date";

                column(Document_No_; "Document No.")
                {

                }
                column("Posting_Date"; Format("Posting Date", 0))
                {

                }
                column(Item_No_; "Item No.")
                {

                }
                column(Bonus_Amount; "Bonus Amount")
                {

                }

            }


            trigger OnAfterGetRecord()
            var
                LCBBonusEntry: Record "LCB Bonus Entry";
            begin
                LCBBonusEntry.CopyFilters("LCB Bonus Entry");
                LCBBonusEntry.SetRange("Bonus No.", "No.");
                LCBBonusEntry.CalcSums("Bonus Amount");
                AmountSum := LCBBonusEntry."Bonus Amount";
            end;
        }
    }
    var
        BonusNoCaptionLbl: Label 'Bonus No.';
        CustomerNoCaptionLbl: Label 'Customer No.';
        PostingDateCaptionLbl: Label 'Posting Date';
        DocumentNoCaptionLbl: Label 'Document No.';
        BonusAmountCaptionLbl: Label 'Amount';
        itemNoCaptionLbl: Label 'Item No.';
        StartingDateCaptionLbl: Label 'Starting Date';
        EndingDateCaptionlbl: Label 'Ending Date';
        AmountSum: Decimal;
}