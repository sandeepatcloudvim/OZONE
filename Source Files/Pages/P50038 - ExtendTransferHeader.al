pageextension 50038 ExtendTransferOrder extends "Transfer Order"
{
    layout
    {
        addfirst(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(5740), "No." = FIELD("No.");

            }
        }
    }

    actions
    {
    }
}