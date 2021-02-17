tableextension 50018 ExtendStockKeepingUni extends "Stockkeeping Unit"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Qty on Production BOM"; Decimal)
        {
            Caption = 'Qty on Production BOM';
            FieldClass = FlowField;
            CalcFormula = Sum ("Production BOM Line".Quantity WHERE(Type = FILTER(Item), "No." = FIELD("Item No.")));
        }
        field(50001; "Qty on Transfer Order"; Decimal)
        {
            Caption = 'Qty on Transfer Order';
            FieldClass = FlowField;
            CalcFormula = Sum ("Transfer Line".Quantity WHERE("Item No." = FIELD("Item No."), "Shortcut Dimension 1 Code" =
FIELD("Global Dimension 1 Filter"), "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter")));
        }

    }

    var
        myInt: Integer;
}