codeunit 50103 "LCB Bonus Calculation"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var SalesInvLine: Record "Sales Invoice Line")
    var
        LCBBonusHeader: Record "LCB Bonus Header";
    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then
            exit;

        LCBBonusHeader.SetRange("Customer No.", SalesInvLine."Bill-to Customer No.");
        LCBBonusHeader.SetRange(Status, LCBBonusHeader.Status::Released);
        LCBBonusHeader.SetFilter("Starting Date", '..%1..', SalesInvLine."Posting Date");
        LCBBonusHeader.SetFilter("Ending Date", '%1..', SalesInvLine."Posting Date");
        if LCBBonusHeader.IsEmpty() then
            exit;

        if LCBBonusHeader.FindSet() then
            repeat
                FindBonusForAllItems(LCBBonusHeader, SalesInvLine);
                FindBonusForOneItem(LCBBonusHeader, SalesInvLine);
            until LCBBonusHeader.Next() = 0;
    end;

    local procedure FindBonusForAllItems(var LCBBonusHeader: Record "LCB Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        LCBBonusLine: Record "LCB Bonus Line";
    begin
        LCBBonusLine.SetRange("Document No.", LCBBonusHeader."No.");
        LCBBonusLine.SetRange(Type, LCBBonusLine.Type::"All items");
        if LCBBonusLine.FindFirst() then
            InsertBonusEntry(LCBBonusLine, SalesInvLine);
    end;

    local procedure FindBonusForOneItem(var LCBBonusHeader: Record "LCB Bonus Header"; var SalesInvLine: Record "Sales Invoice Line");
    var
        LCBBonusLine: Record "LCB Bonus Line";
    begin
        LCBBonusLine.SetRange("Document No.", LCBBonusHeader."No.");
        LCBBonusLine.SetRange(Type, LCBBonusLine.Type::Item);
        if LCBBonusLine.FindFirst() then
            InsertBonusEntry(LCBBonusLine, SalesInvLine);
    end;

    local procedure InsertBonusEntry(var LCBBonusLine: Record "LCB Bonus Line"; var SalesInvLine: Record "Sales Invoice Line")
    var
        LCBBonusEntry: Record "LCB Bonus Entry";
        EntryNo: Integer;
    begin
        if LCBBonusEntry.FindLast() then
            EntryNo := LCBBOnusEntry."Entry No." + 1
        else
            EntryNo := 1;

        LCBBonusEntry.Init();
        LCBBonusEntry."Entry No." := EntryNo;
        LCBBonusEntry."Bonus No." := LCBBonusLine."Document No.";
        LCBBonusEntry."Document No." := SalesInvLine."Document No.";
        LCBBonusEntry."Item No." := SalesInvLine."No.";
        LCBBonusEntry."Posting Date" := SalesInvLine."Posting Date";
        LCBBonusEntry."Bonus Amount" := SalesInvLine."Line Amount" * LCBBonusLine."Bonus Perc" / 100;
        LCBBonusEntry.Insert();
    end;
}