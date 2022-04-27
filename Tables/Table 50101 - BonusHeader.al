table 50101 "LCB Bonus header"
{
    Caption = 'Bonus';
    DataClassification = CustomerContent;
    DrillDownPageId = "LCB Bonus List";
    LookupPageId = "LCB Bonus List";
    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }

        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;

        }

        field(3; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Stating Date';

        }
        field(4; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Ending Date';
        }
        field(5; "Status"; Enum "LCB Bonus Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }




    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

    }

}