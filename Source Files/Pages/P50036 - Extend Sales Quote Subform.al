pageextension 50036 ExtendSalesQuoteSubform extends "Sales Quote Subform"
{
    layout
    {

    }
    actions
    {
        addbefore("Item Availability by")
        {
            action(RemoveZeroLines)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Remove Zeros';
                Ellipsis = true;
                Image = RemoveLine;
                ToolTip = 'Remove the sales lines which has the zero line quantity .';

                trigger OnAction()
                begin
                    RemoveZero;
                end;
            }
        }

    }
    local procedure RemoveZero()
    var
        SalesLinerec: Record "Sales Line";
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.GET("Document Type", "Document No.");
        SalesLinerec.Reset();
        SalesLinerec.SetRange("Document Type", SalesLinerec."Document Type"::Quote);
        SalesLinerec.SetRange("Document No.", SalesHeader."No.");
        SalesLinerec.SetRange(Quantity, 0);
        if SalesLinerec.FindFirst then begin
            repeat
                if SalesLinerec."No." <> '' then
                    SalesLinerec.Delete();
            until SalesLineRec.Next = 0;
            message('Completed !!')
        end;
    end;


}
