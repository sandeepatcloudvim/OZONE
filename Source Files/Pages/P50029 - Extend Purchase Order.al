pageextension 50029 ExtendPurchaseOrder extends "Purchase Order"
{
    layout
    {
        addafter("Vendor Shipment No.")
        {
            field("Sent to Vendor"; "Sent to Vendor")
            {
                ApplicationArea = All;
                Caption = 'Sent to Vendor';

            }
            field("Ordered for"; "Ordered for")
            {
                ApplicationArea = All;
                Caption = 'Orderd for';
            }
            field("Package Tracking No."; "Package Tracking No.")
            {
                ApplicationArea = All;
            }

        }

    }

    actions
    {
        // Add changes to page actions here
        addbefore(Dimensions)
        {

            action(OpenUserCard)
            {
                ApplicationArea = All;
                Caption = 'Open User Task Card';
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'Alt+D';

                trigger OnAction()
                var
                    CBRCodeunit: Codeunit ExtendEventsCBR;
                begin

                    CBRCodeunit.OpenUserTaskPage('Purchase Order', "No.");
                end;
            }

        }
        addafter(Dimensions)
        {
            action(TrackPackage)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Track Package';
                Image = ItemTracking;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                ShortCutKey = 'Alt+D';
                ToolTip = 'Track the order based upon the tracking number entered on the purchase order document';

                trigger OnAction()
                begin
                    StartTrackingSite("Package Tracking No.");

                end;
            }

        }


    }

    var
        myInt: Integer;

}