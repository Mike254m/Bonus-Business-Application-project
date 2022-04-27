table 50104 "LCB Bonus Entry"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
            Editable = false;

        }
        field(2; "Bonus No."; Code[20])
        {
            Caption = 'Bonus No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "LCB Bonus Header";
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Sales Invoice Header";
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = Item;
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(6; "Bonus Amount"; Decimal)
        {
            Caption = 'Bonus Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }

    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}