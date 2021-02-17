pageextension 50039 ExtendStockeepingUnit extends "Stockkeeping Unit List"
{
    layout
    {
        addafter(Inventory)
        {

            field("Qty. on Sales Order"; "Qty. on Sales Order")
            {
                ApplicationArea = All;
            }
            field("Qty. on Assembly Order"; "Qty. on Assembly Order")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Qty. on Asm. Component"; "Qty. on Asm. Component")
            {
                ApplicationArea = ALL;
            }
            field("Qty on Production BOM"; "Qty on Production BOM")
            {
                ApplicationArea = all;
            }

            field("Qty on Transfer Order"; "Qty on Transfer Order")
            {
                ApplicationArea = ALL;
            }
            field("Qty. on Purch. Order"; "Qty. on Purch. Order")
            {
                ApplicationArea = All;
            }

            field("Qty. on Prod. Order"; "Qty. on Prod. Order")
            {
                ApplicationArea = All;
            }
            field(QtyAvaliable; QtyAvaliable)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

    }
    actions
    {
    }
    trigger OnAfterGetRecord()

    begin
        QtyAvaliable := 0;
        CalcFields(Inventory, "Qty. on Sales Order", "Qty. on Asm. Component",
        "Qty on Production BOM",
           "Qty on Transfer Order", "Qty. on Purch. Order");
        QtyAvaliable := (Inventory - "Qty. on Sales Order" - "Qty. on Asm. Component"
        - "Qty on Production BOM" - "Qty on Transfer Order" + "Qty. on Purch. Order");

    end;


    var
        QtyAvaliable: Decimal;
}
